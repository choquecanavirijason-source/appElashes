import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_colors.dart';
import '../../data/models/commission_dto.dart';
import '../providers/comisiones_provider.dart';

class CommissionFormSheet extends ConsumerStatefulWidget {
  const CommissionFormSheet({super.key});

  @override
  ConsumerState<CommissionFormSheet> createState() =>
      _CommissionFormSheetState();
}

class _CommissionFormSheetState extends ConsumerState<CommissionFormSheet> {
  final _formKey = GlobalKey<FormState>();
  final _amountCtrl = TextEditingController();
  final _notesCtrl = TextEditingController();

  int? _selectedProfessionalId;
  DateTime? _periodStart;
  DateTime? _periodEnd;
  bool _saving = false;

  @override
  void dispose() {
    _amountCtrl.dispose();
    _notesCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickDate({required bool isStart}) async {
    final initial = isStart
        ? (_periodStart ?? DateTime.now())
        : (_periodEnd ?? DateTime.now());
    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked == null) return;
    setState(() {
      if (isStart) {
        _periodStart = picked;
      } else {
        _periodEnd = picked;
      }
    });
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedProfessionalId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Selecciona una operaria')),
      );
      return;
    }
    setState(() => _saving = true);
    final dateFmt = DateFormat('yyyy-MM-dd');
    final dto = CommissionPaymentCreateDto(
      professionalId: _selectedProfessionalId!,
      amount: double.parse(_amountCtrl.text.trim()),
      periodStart: _periodStart != null ? dateFmt.format(_periodStart!) : null,
      periodEnd: _periodEnd != null ? dateFmt.format(_periodEnd!) : null,
      notes: _notesCtrl.text.trim().isEmpty ? null : _notesCtrl.text.trim(),
    );
    try {
      await ref.read(comisionesProvider.notifier).add(dto);
      if (mounted) Navigator.of(context).pop();
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error al registrar comisión')),
        );
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final asyncProfessionals = ref.watch(professionalsProvider);
    final dateFmt = DateFormat('dd/MM/yyyy');

    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 24,
        bottom: MediaQuery.viewInsetsOf(context).bottom + 24,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Registrar pago de comisión',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Color(0xFF6B7280)),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Profesional selector
            asyncProfessionals.when(
              loading: () => const LinearProgressIndicator(),
              error: (_, __) => const Text(
                'Error al cargar operarias',
                style: TextStyle(color: Colors.redAccent),
              ),
              data: (professionals) => DropdownButtonFormField<int>(
                decoration: _inputDecoration('Operaria'),
                initialValue: _selectedProfessionalId,
                hint: const Text('Selecciona una operaria'),
                items: professionals
                    .map(
                      (p) => DropdownMenuItem(
                        value: p.id,
                        child: Text(p.displayName),
                      ),
                    )
                    .toList(),
                onChanged: (val) =>
                    setState(() => _selectedProfessionalId = val),
              ),
            ),
            const SizedBox(height: 14),

            // Monto
            TextFormField(
              controller: _amountCtrl,
              decoration: _inputDecoration('Monto (Bs)'),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              validator: (v) {
                if (v == null || v.trim().isEmpty) return 'Ingresa el monto';
                if (double.tryParse(v.trim()) == null) {
                  return 'Monto inválido';
                }
                if ((double.tryParse(v.trim()) ?? 0) <= 0) {
                  return 'El monto debe ser mayor a 0';
                }
                return null;
              },
            ),
            const SizedBox(height: 14),

            // Período
            Row(
              children: [
                Expanded(
                  child: _DateButton(
                    label: 'Inicio período',
                    value:
                        _periodStart != null ? dateFmt.format(_periodStart!) : null,
                    onTap: () => _pickDate(isStart: true),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _DateButton(
                    label: 'Fin período',
                    value:
                        _periodEnd != null ? dateFmt.format(_periodEnd!) : null,
                    onTap: () => _pickDate(isStart: false),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),

            // Notas
            TextFormField(
              controller: _notesCtrl,
              decoration: _inputDecoration('Notas (opcional)'),
              maxLines: 2,
              maxLength: 500,
            ),
            const SizedBox(height: 20),

            // Botón guardar
            SizedBox(
              height: 48,
              child: ElevatedButton(
                onPressed: _saving ? null : _submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.brandPrimary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: _saving
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text(
                        'Registrar comisión',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label) => InputDecoration(
        labelText: label,
        filled: true,
        fillColor: AppColors.darkCard,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.darkCardElevated),
        ),
      );
}

class _DateButton extends StatelessWidget {
  const _DateButton({required this.label, required this.value, required this.onTap});

  final String label;
  final String? value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.darkCard,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.darkCardElevated),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(color: Color(0xFF6B7280), fontSize: 12),
            ),
            const SizedBox(height: 4),
            Text(
              value ?? 'Sin fecha',
              style: TextStyle(
                color: value != null ? Colors.white : const Color(0xFF4B5563),
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

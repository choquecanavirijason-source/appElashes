import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/presentation/organisms/async_value_view.dart';
import '../../../../core/presentation/organisms/empty_state.dart';
import '../../../../core/storage/prefs_storage.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../citas/presentation/providers/appointments_provider.dart';
import '../../../dashboard/presentation/providers/dashboard_overview_provider.dart';
import '../../../sucursales/domain/entities/sucursal.dart';
import '../../../sucursales/presentation/providers/sucursales_provider.dart';
import '../../data/payments_repository_impl.dart';
import '../providers/payments_provider.dart';

// ─── Métodos de pago disponibles ──────────────────────────────────────────────

class _Method {
  const _Method(this.value, this.label, this.icon, this.color);
  final String? value;
  final String label;
  final IconData icon;
  final Color color;
}

const _methods = [
  _Method(null, 'Todos', Icons.list_outlined, Color(0xFF6B7280)),
  _Method('cash', 'Efectivo', Icons.attach_money, AppColors.onlineGreen),
  _Method('card', 'Tarjeta', Icons.credit_card, AppColors.statusEnServicio),
  _Method(
    'transfer',
    'Transferencia',
    Icons.swap_horiz,
    AppColors.statusReserva,
  ),
  _Method('qr', 'QR', Icons.qr_code, AppColors.goldAccent),
];

// ─── Screen ───────────────────────────────────────────────────────────────────

class PagosScreen extends ConsumerWidget {
  const PagosScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncPagos = ref.watch(paymentsProvider);
    final selectedMethod = ref.watch(paymentMethodFilterProvider);
    final selectedId = ref.watch(selectedBranchIdProvider);
    final sucursales =
        ref.watch(sucursalesListProvider).valueOrNull ?? <Sucursal>[];
    final sucursalActual =
        sucursales.where((s) => s.id == selectedId).firstOrNull;

    Future<void> seleccionarSucursal(Sucursal? s) async {
      ref.read(selectedBranchIdProvider.notifier).state = s?.id;
      await ref.read(prefsStorageProvider).setSelectedBranchId(s?.id);
      ref.invalidate(appointmentsListProvider);
      await ref.read(dashboardOverviewProvider.notifier).refresh();
    }

    void abrirSelector() {
      showModalBottomSheet<void>(
        context: context,
        backgroundColor: AppColors.darkCard,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (_) => _SucursalSheet(
          sucursales: sucursales,
          selectedId: selectedId,
          onSelect: (Sucursal? s) {
            Navigator.of(context).pop();
            seleccionarSucursal(s);
          },
        ),
      );
    }

    final fmt = NumberFormat.currency(
      locale: 'es_BO',
      symbol: 'Bs ',
      decimalDigits: 2,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(paymentsProvider.notifier).refresh(),
          ),
        ],
      ),
      body: Column(
        children: [
          // ── Filtro sucursal ───────────────────────────────────────────
          _BranchFilterBar(
            nombre: sucursalActual?.nombre,
            onTap: abrirSelector,
          ),
          // ── Chips de método ───────────────────────────────────────────
          _MethodChips(
            selected: selectedMethod,
            onSelect: (m) =>
                ref.read(paymentMethodFilterProvider.notifier).state = m,
          ),
          // ── Lista ─────────────────────────────────────────────────────
          Expanded(
            child: AsyncValueView<List<Payment>>(
              value: asyncPagos,
              onRetry: () => ref.invalidate(paymentsProvider),
              builder: (pagos) {
                if (pagos.isEmpty) {
                  return EmptyState(
                    icon: Icons.receipt_long_outlined,
                    title: 'Sin pagos',
                    message: _emptyMessage(sucursalActual?.nombre, selectedMethod),
                  );
                }

                final total = pagos.fold<double>(0, (a, p) => a + p.amount);

                return Column(
                  children: [
                    _TotalBanner(
                      total: total,
                      count: pagos.length,
                      fmt: fmt,
                      branchNombre: sucursalActual?.nombre,
                      method: selectedMethod,
                    ),
                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.fromLTRB(16, 12, 16, 88),
                        itemCount: pagos.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 10),
                        itemBuilder: (_, i) =>
                            _PaymentCard(payment: pagos[i], fmt: fmt),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  static String _emptyMessage(String? branch, String? method) {
    final parts = <String>[];
    if (method != null) parts.add(_methodName(method).toLowerCase());
    if (branch != null) parts.add('en $branch');
    if (parts.isEmpty) return 'Los pagos registrados aparecerán aquí.';
    return 'No hay pagos ${parts.join(' ')} registrados.';
  }

  static String _methodName(String m) => switch (m) {
        'cash' => 'Efectivo',
        'card' => 'Tarjeta',
        'transfer' => 'Transferencia',
        'qr' => 'QR',
        _ => m,
      };
}

// ─── Branch filter bar ────────────────────────────────────────────────────────

class _BranchFilterBar extends StatelessWidget {
  const _BranchFilterBar({required this.nombre, required this.onTap});

  final String? nombre;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isTodas = nombre == null;
    final label = nombre ?? 'Todas las sucursales';
    final color = isTodas ? const Color(0xFF6B7280) : AppColors.brandAccent;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: const BoxDecoration(
          color: AppColors.darkCard,
          border: Border(
            bottom: BorderSide(color: AppColors.darkCardElevated),
          ),
        ),
        child: Row(
          children: [
            Icon(
              isTodas ? Icons.public_outlined : Icons.store_outlined,
              size: 14,
              color: color,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 4),
            Icon(Icons.keyboard_arrow_down_rounded, size: 16, color: color),
            const Spacer(),
            const Text(
              'Cambiar',
              style: TextStyle(color: Color(0xFF4B5563), fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Method chips ─────────────────────────────────────────────────────────────

class _MethodChips extends StatelessWidget {
  const _MethodChips({required this.selected, required this.onSelect});

  final String? selected;
  final void Function(String?) onSelect;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        children: _methods.map((m) {
          final isActive = selected == m.value;
          return Padding(
            padding: const EdgeInsets.only(right: 6),
            child: GestureDetector(
              onTap: () => onSelect(m.value),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: isActive
                      ? m.color.withValues(alpha: 0.18)
                      : AppColors.darkCard,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isActive ? m.color : AppColors.darkCardElevated,
                    width: isActive ? 1.5 : 1.0,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(m.icon, size: 13, color: isActive ? m.color : const Color(0xFF6B7280)),
                    const SizedBox(width: 5),
                    Text(
                      m.label,
                      style: TextStyle(
                        color: isActive ? m.color : const Color(0xFF6B7280),
                        fontSize: 12,
                        fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

// ─── Total banner ─────────────────────────────────────────────────────────────

class _TotalBanner extends StatelessWidget {
  const _TotalBanner({
    required this.total,
    required this.count,
    required this.fmt,
    this.branchNombre,
    this.method,
  });

  final double total;
  final int count;
  final NumberFormat fmt;
  final String? branchNombre;
  final String? method;

  static String _methodLabel(String m) => switch (m) {
        'cash' => 'Efectivo',
        'card' => 'Tarjeta',
        'transfer' => 'Transferencia',
        'qr' => 'QR',
        _ => m,
      };

  @override
  Widget build(BuildContext context) {
    final parts = <String>[];
    if (method != null) parts.add(_methodLabel(method!));
    if (branchNombre != null) parts.add(branchNombre!);
    final subtitle = parts.isEmpty
        ? '$count pagos registrados'
        : '$count pagos · ${parts.join(' · ')}';

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 4),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.darkCardElevated),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.iconBgGreen,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.payments_outlined,
              color: AppColors.onlineGreen,
              size: 22,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFF6B7280),
                    fontSize: 12,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  fmt.format(total),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Payment card ─────────────────────────────────────────────────────────────

class _PaymentCard extends StatelessWidget {
  const _PaymentCard({required this.payment, required this.fmt});

  final Payment payment;
  final NumberFormat fmt;

  static String _methodLabel(String m) => switch (m) {
        'cash' => 'Efectivo',
        'card' => 'Tarjeta',
        'transfer' => 'Transferencia',
        'qr' => 'QR',
        _ => m,
      };

  static Color _methodColor(String m) => switch (m) {
        'cash' => AppColors.onlineGreen,
        'card' => AppColors.statusEnServicio,
        'transfer' => AppColors.statusReserva,
        'qr' => AppColors.goldAccent,
        _ => AppColors.statusSinEstado,
      };

  static IconData _methodIcon(String m) => switch (m) {
        'cash' => Icons.attach_money,
        'card' => Icons.credit_card,
        'transfer' => Icons.swap_horiz,
        'qr' => Icons.qr_code,
        _ => Icons.payments_outlined,
      };

  @override
  Widget build(BuildContext context) {
    final fechaFmt =
        DateFormat('d MMM · HH:mm', 'es_BO').format(payment.paidAt);
    final methodLabel = _methodLabel(payment.method);
    final methodColor = _methodColor(payment.method);

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.darkCardElevated),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icono método
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: methodColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(_methodIcon(payment.method), color: methodColor, size: 20),
          ),
          const SizedBox(width: 12),
          // Datos cliente + meta
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nombre
                Text(
                  payment.clientName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                // Fecha + pills — Wrap evita el overflow
                Wrap(
                  spacing: 6,
                  runSpacing: 4,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      fechaFmt,
                      style: const TextStyle(
                        color: Color(0xFF6B7280),
                        fontSize: 11,
                      ),
                    ),
                    _Pill(label: methodLabel, color: methodColor),
                    if (payment.appointmentId != null)
                      _Pill(
                        label: 'Cita #${payment.appointmentId}',
                        color: AppColors.statusAtendido,
                      ),
                  ],
                ),
                // Referencia
                if (payment.reference != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    'Ref: ${payment.reference}',
                    style: const TextStyle(
                      color: Color(0xFF4B5563),
                      fontSize: 11,
                    ),
                  ),
                ],
                // Notas
                if (payment.notes != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    payment.notes!,
                    style: const TextStyle(
                      color: Color(0xFF4B5563),
                      fontSize: 11,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 12),
          // Monto — columna propia, sin overflow
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                fmt.format(payment.amount),
                style: const TextStyle(
                  color: AppColors.onlineGreen,
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
              ),
              if (payment.status != 'paid') ...[
                const SizedBox(height: 4),
                _Pill(
                  label: payment.status,
                  color: AppColors.statusCancelado,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Pill ─────────────────────────────────────────────────────────────────────

class _Pill extends StatelessWidget {
  const _Pill({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

// ─── Sucursal selector sheet ──────────────────────────────────────────────────

class _SucursalSheet extends StatelessWidget {
  const _SucursalSheet({
    required this.sucursales,
    required this.selectedId,
    required this.onSelect,
  });

  final List<Sucursal> sucursales;
  final int? selectedId;
  final void Function(Sucursal?) onSelect;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 8),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: const Color(0xFF374151),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Icon(
                  Icons.store_outlined,
                  size: 18,
                  color: AppColors.brandAccent,
                ),
                SizedBox(width: 10),
                Text(
                  'Filtrar por sucursal',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _SheetOption(
            icon: Icons.public_outlined,
            label: 'Todas las sucursales',
            sublabel: 'Ver pagos globales',
            selected: selectedId == null,
            color: const Color(0xFF6B7280),
            onTap: () => onSelect(null),
          ),
          if (sucursales.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'Sin sucursales registradas',
                style: TextStyle(color: Color(0xFF6B7280), fontSize: 13),
              ),
            )
          else
            ...sucursales.map(
              (s) => _SheetOption(
                icon: Icons.store_outlined,
                label: s.nombre,
                sublabel: s.ciudad ?? s.direccion ?? '',
                selected: s.id == selectedId,
                color: AppColors.brandAccent,
                onTap: () => onSelect(s),
              ),
            ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

class _SheetOption extends StatelessWidget {
  const _SheetOption({
    required this.icon,
    required this.label,
    required this.sublabel,
    required this.selected,
    required this.color,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final String sublabel;
  final bool selected;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: selected
              ? color.withValues(alpha: 0.15)
              : const Color(0xFF242424),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          icon,
          size: 20,
          color: selected ? color : const Color(0xFF6B7280),
        ),
      ),
      title: Text(
        label,
        style: TextStyle(
          color: selected ? color : Colors.white,
          fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
          fontSize: 14,
        ),
      ),
      subtitle: sublabel.isNotEmpty
          ? Text(
              sublabel,
              style: const TextStyle(color: Color(0xFF6B7280), fontSize: 12),
            )
          : null,
      trailing: selected
          ? Icon(Icons.check_circle_rounded, color: color, size: 20)
          : null,
    );
  }
}

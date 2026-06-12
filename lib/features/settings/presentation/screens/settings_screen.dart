import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/storage/prefs_storage.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../admin/presentation/screens/admin_tab.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _whatsappUrlController = TextEditingController();
  final _whatsappTokenController = TextEditingController();

  static const _whatsappApiUrlKey = 'whatsapp_api_url';
  static const _whatsappTokenKey = 'whatsapp_access_token';

  bool _isLoading = true;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = ref.read(prefsStorageProvider);
    _whatsappUrlController.text = prefs.readString(_whatsappApiUrlKey) ?? '';
    _whatsappTokenController.text = prefs.readString(_whatsappTokenKey) ?? '';
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _saveSettings() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isSaving = true;
    });

    try {
      final prefs = ref.read(prefsStorageProvider);
      await prefs.writeString(_whatsappApiUrlKey, _whatsappUrlController.text.trim());
      await prefs.writeString(_whatsappTokenKey, _whatsappTokenController.text.trim());

      if (this.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Configuración de WhatsApp guardada'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (this.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al guardar: $e')),
        );
      }
    } finally {
      if (this.mounted) {
        setState(() {
          _isSaving = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _whatsappUrlController.dispose();
    _whatsappTokenController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración'),
        backgroundColor: AppColors.darkBg,
        elevation: 0,
      ),
      backgroundColor: AppColors.darkBg,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'APIs e Integraciones',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Configura las integraciones externas del salón.',
                style: TextStyle(color: Color(0xFF9CA3AF)),
              ),
              const SizedBox(height: 24),

              // WhatsApp Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.darkCard,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.darkCardElevated),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xFF25D366).withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.chat_rounded,
                            color: Color(0xFF25D366),
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'WhatsApp Business API',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'URL base de la API',
                      style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 13),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: _whatsappUrlController,
                      decoration: const InputDecoration(
                        hintText: 'https://graph.facebook.com/v19.0',
                        hintStyle: TextStyle(color: Color(0xFF6B7280)),
                        filled: true,
                        fillColor: Color(0xFF1F1F1F),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF3A3A3A)),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                      validator: (value) {
                        if (value != null && value.trim().isNotEmpty) {
                          final uri = Uri.tryParse(value.trim());
                          if (uri == null || !uri.hasScheme) {
                            return 'Ingresa una URL válida';
                          }
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Access Token',
                      style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 13),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: _whatsappTokenController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'EAA... (tu token de WhatsApp)',
                        hintStyle: TextStyle(color: Color(0xFF6B7280)),
                        filled: true,
                        fillColor: Color(0xFF1F1F1F),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF3A3A3A)),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Este token se usará para enviar mensajes y plantillas vía la API oficial de WhatsApp.',
                      style: TextStyle(
                        color: Color(0xFF6B7280),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: FilledButton(
                  onPressed: _isSaving ? null : _saveSettings,
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.goldAccent,
                    foregroundColor: Colors.black87,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: _isSaving
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black87),
                        )
                      : const Text(
                          'Guardar configuración',
                          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                        ),
                ),
              ),

              const SizedBox(height: 16),
              Center(
                child: Text(
                  'Los cambios se aplicarán en la próxima apertura de conversaciones.',
                  style: TextStyle(color: Color(0xFF6B7280), fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

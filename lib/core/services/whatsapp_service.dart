import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Abre WhatsApp con el número del cliente, opcionalmente con un mensaje
/// pre-rellenado. Normaliza el número eliminando espacios, guiones y el "+".
class WhatsAppService {
  WhatsAppService._();

  static String _normalize(String telefono) => telefono
      .replaceAll(RegExp(r'[\s\-()]'), '')
      .replaceFirst('+', '');

  /// Abre WhatsApp con número y texto opcionales. Devuelve true si se abrió.
  static Future<bool> abrir({
    required String telefono,
    String? mensaje,
  }) async {
    final numero = _normalize(telefono);
    final query = mensaje != null && mensaje.isNotEmpty
        ? '?text=${Uri.encodeComponent(mensaje)}'
        : '';
    final uri = Uri.parse('https://wa.me/$numero$query');

    try {
      return await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (e) {
      log(
        'WhatsAppService: no se pudo abrir $uri — $e',
        name: 'whatsapp.service',
      );
      return false;
    }
  }

  /// Muestra un bottom sheet con plantillas de mensajes para seleccionar.
  static Future<void> mostrarPlantillas({
    required BuildContext context,
    required String telefono,
    required String nombreCliente,
    String? servicio,
    String? fechaHora,
  }) {
    final templates = _buildTemplates(
      nombre: nombreCliente,
      servicio: servicio,
      fechaHora: fechaHora,
    );

    return showModalBottomSheet<void>(
      context: context,
      backgroundColor: const Color(0xFF181818),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (_) => _PlantillasSheet(
        telefono: telefono,
        templates: templates,
      ),
    );
  }

  // ── Plantillas ──────────────────────────────────────────────────────────

  static List<_Template> _buildTemplates({
    required String nombre,
    String? servicio,
    String? fechaHora,
  }) {
    return [
      if (servicio != null && fechaHora != null)
        _Template(
          icono: Icons.check_circle_outline,
          titulo: 'Confirmación de cita',
          texto:
              '¡Hola $nombre! 💚 Te confirmamos tu cita en *eLashes* para el *$fechaHora*.\n'
              'Servicio: $servicio.\n'
              '¡Te esperamos! Ante cualquier duda escríbenos.',
        ),
      if (servicio != null && fechaHora != null)
        _Template(
          icono: Icons.alarm_outlined,
          titulo: 'Recordatorio (día anterior)',
          texto:
              '¡Hola $nombre! 💚 Te recordamos que mañana tienes cita en *eLashes*.\n'
              'Hora: *$fechaHora* — $servicio.\n'
              '¿Confirmas tu asistencia? Responde este mensaje.',
        ),
      _Template(
        icono: Icons.favorite_border,
        titulo: 'Bienvenida al salón',
        texto:
            '¡Bienvenida $nombre! 💚 Gracias por elegirnos.\n'
            'Estamos felices de tenerte en la familia *eLashes*. '
            '¿Tienes alguna duda o comentario?',
      ),
      _Template(
        icono: Icons.cancel_outlined,
        titulo: 'Cancelación de cita',
        texto:
            'Hola $nombre, lamentamos comunicarte que necesitamos cancelar '
            'tu cita${fechaHora != null ? ' del *$fechaHora*' : ''}. '
            'Nos comunicaremos a la brevedad para reagendarla. '
            'Disculpa los inconvenientes.',
      ),
      _Template(
        icono: Icons.star_border_outlined,
        titulo: 'Solicitar reseña',
        texto:
            '¡Hola $nombre! 😊 Esperamos que hayas quedado feliz con tu '
            'servicio en *eLashes*. Si tienes un momento, nos ayudaría mucho '
            'que dejes una reseña. ¡Muchas gracias!',
      ),
      _Template(
        icono: Icons.local_offer_outlined,
        titulo: 'Promoción / descuento',
        texto:
            '¡Hola $nombre! 💚 Tenemos una oferta especial para ti esta semana '
            'en *eLashes*. Escríbenos para conocer los detalles.',
      ),
    ];
  }
}

class _Template {
  const _Template({
    required this.icono,
    required this.titulo,
    required this.texto,
  });
  final IconData icono;
  final String titulo;
  final String texto;
}

class _PlantillasSheet extends StatefulWidget {
  const _PlantillasSheet({
    required this.telefono,
    required this.templates,
  });

  final String telefono;
  final List<_Template> templates;

  @override
  State<_PlantillasSheet> createState() => _PlantillasSheetState();
}

class _PlantillasSheetState extends State<_PlantillasSheet> {
  int? _selected;
  late final TextEditingController _editor;

  @override
  void initState() {
    super.initState();
    _editor = TextEditingController();
  }

  @override
  void dispose() {
    _editor.dispose();
    super.dispose();
  }

  void _selectTemplate(int i) {
    setState(() {
      _selected = i;
      _editor.text = widget.templates[i].texto;
    });
  }

  Future<void> _enviar() async {
    final texto = _editor.text.trim();
    if (texto.isEmpty) return;
    Navigator.of(context).pop();
    await WhatsAppService.abrir(
      telefono: widget.telefono,
      mensaje: texto,
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewInsets = MediaQuery.viewInsetsOf(context).bottom;

    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, viewInsets),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // handle
          Container(
            margin: const EdgeInsets.only(top: 12, bottom: 8),
            width: 36,
            height: 4,
            decoration: BoxDecoration(
              color: const Color(0xFF4B5563),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 4, 20, 12),
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: const Color(0xFF25D366).withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.chat_rounded,
                    color: Color(0xFF25D366),
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  'Enviar por WhatsApp',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          // Templates list
          SizedBox(
            height: 88,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              itemCount: widget.templates.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (_, i) {
                final t = widget.templates[i];
                final sel = _selected == i;
                return GestureDetector(
                  onTap: () => _selectTemplate(i),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    width: 130,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: sel
                          ? const Color(0xFF25D366).withValues(alpha: 0.15)
                          : const Color(0xFF242424),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: sel
                            ? const Color(0xFF25D366)
                            : const Color(0xFF2A2A2A),
                        width: sel ? 1.5 : 1,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          t.icono,
                          size: 18,
                          color: sel
                              ? const Color(0xFF25D366)
                              : const Color(0xFF6B7280),
                        ),
                        const Spacer(),
                        Text(
                          t.titulo,
                          maxLines: 2,
                          style: TextStyle(
                            color: sel ? Colors.white : const Color(0xFF9CA3AF),
                            fontSize: 11,
                            fontWeight: sel
                                ? FontWeight.w600
                                : FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Editor
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 14, 20, 6),
            child: TextField(
              controller: _editor,
              maxLines: 4,
              minLines: 3,
              style: const TextStyle(color: Colors.white, fontSize: 13),
              decoration: InputDecoration(
                hintText: 'Escribe o selecciona una plantilla…',
                hintStyle: const TextStyle(color: Color(0xFF4B5563)),
                filled: true,
                fillColor: const Color(0xFF242424),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFF2A2A2A)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFF2A2A2A)),
                ),
              ),
            ),
          ),
          // Send button
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
            child: SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: _enviar,
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFF25D366),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.chat_rounded, size: 20),
                label: const Text(
                  'Abrir en WhatsApp',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

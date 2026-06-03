import '../../features/mensajes/domain/entities/message.dart';

/// Hilo especial de IA — clienteId = 0.
const int kAiThreadClientId = 0;

List<MessageThread> buildMockThreads() {
  final now = DateTime.now();

  return [
    // Thread IA (asistente)
    MessageThread(
      id: 0,
      clienteId: kAiThreadClientId,
      channel: MessageChannel.ai,
      mensajes: [
        Message(
          id: 1,
          texto: '¡Hola! Soy tu asistente del salón. ¿En qué te ayudo hoy?',
          enviadoEn: now.subtract(const Duration(minutes: 35)),
          sender: MessageSender.ai,
          channel: MessageChannel.ai,
        ),
        Message(
          id: 2,
          texto: '¿Qué citas tengo hoy?',
          enviadoEn: now.subtract(const Duration(minutes: 32)),
          sender: MessageSender.user,
          channel: MessageChannel.ai,
        ),
        Message(
          id: 3,
          texto:
              'Tienes 4 citas hoy: 09:00 María Rodríguez, 11:30 Lucía Mendoza, '
              '15:00 Valeria Torrico y 17:30 Daniela Quispe.',
          enviadoEn: now.subtract(const Duration(minutes: 31)),
          sender: MessageSender.ai,
          channel: MessageChannel.ai,
        ),
      ],
    ),

    // WhatsApp con María (cliente 1)
    MessageThread(
      id: 1,
      clienteId: 1,
      channel: MessageChannel.whatsapp,
      mensajes: [
        Message(
          id: 10,
          texto: 'Hola, quería confirmar mi cita de mañana 🙂',
          enviadoEn: now.subtract(const Duration(hours: 2)),
          sender: MessageSender.client,
          channel: MessageChannel.whatsapp,
        ),
        Message(
          id: 11,
          texto: '¡Hola María! Sí, tu cita es a las 09:00 con Andrea.',
          enviadoEn: now.subtract(const Duration(hours: 1, minutes: 55)),
          sender: MessageSender.user,
          channel: MessageChannel.whatsapp,
        ),
        Message(
          id: 12,
          texto: 'Perfecto, ahí estaré. ¡Gracias!',
          enviadoEn: now.subtract(const Duration(hours: 1, minutes: 50)),
          sender: MessageSender.client,
          channel: MessageChannel.whatsapp,
        ),
      ],
    ),

    // WhatsApp con Lucía (cliente 3)
    MessageThread(
      id: 3,
      clienteId: 3,
      channel: MessageChannel.whatsapp,
      mensajes: [
        Message(
          id: 20,
          texto: '¿Tienen disponibilidad el sábado?',
          enviadoEn: now.subtract(const Duration(hours: 6)),
          sender: MessageSender.client,
          channel: MessageChannel.whatsapp,
        ),
      ],
    ),

    // WhatsApp con Valeria (cliente 7)
    MessageThread(
      id: 7,
      clienteId: 7,
      channel: MessageChannel.whatsapp,
      mensajes: [
        Message(
          id: 30,
          texto: 'Te envío la dirección del salón por aquí.',
          enviadoEn: now.subtract(const Duration(days: 1)),
          sender: MessageSender.user,
          channel: MessageChannel.whatsapp,
        ),
        Message(
          id: 31,
          texto: '¡Listo, ya la tengo! Nos vemos el jueves.',
          enviadoEn: now.subtract(const Duration(days: 1, hours: -1)),
          sender: MessageSender.client,
          channel: MessageChannel.whatsapp,
        ),
      ],
    ),
  ];
}

/// Respuestas que simulan a la IA — se eligen pseudo-aleatorias según
/// la longitud del mensaje del usuario, para variar las demos.
const List<String> kAiCannedReplies = [
  'Entendido. Lo agendé para la próxima fecha disponible.',
  'Listo, ya envié el recordatorio por WhatsApp al cliente.',
  '¿Quieres que también le confirme la operaria asignada?',
  'Te paso el resumen del día: 4 citas, 2 confirmadas, 2 pendientes.',
  'Perfecto, marqué la cita como pagada y actualicé el historial.',
  'Anoté la nota en la ficha del cliente.',
  'Recomendaría reagendar a las 11:00 — esa hora está libre.',
];

/// Respuestas que simulan una respuesta del cliente por WhatsApp.
const List<String> kClientCannedReplies = [
  '¡Perfecto, gracias!',
  'Ok, lo confirmo en un rato 🙂',
  '¿Y tendrías algo más tarde?',
  'Sí, ahí estaré.',
  '¡Mil gracias por avisar!',
];

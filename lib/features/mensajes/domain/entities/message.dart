enum MessageChannel { whatsapp, ai }

enum MessageSender { user, client, ai }

class Message {
  const Message({
    required this.id,
    required this.texto,
    required this.enviadoEn,
    required this.sender,
    required this.channel,
  });

  final int id;
  final String texto;
  final DateTime enviadoEn;
  final MessageSender sender;
  final MessageChannel channel;

  bool get esDelUsuario => sender == MessageSender.user;
}

class MessageThread {
  const MessageThread({
    required this.id,
    required this.clienteId,
    required this.channel,
    required this.mensajes,
  });

  /// Identificador único del hilo. Para WhatsApp == clienteId. Para IA = 0.
  final int id;
  final int clienteId;
  final MessageChannel channel;
  final List<Message> mensajes;

  Message? get ultimoMensaje =>
      mensajes.isEmpty ? null : mensajes.last;

  DateTime get ultimaActividad =>
      ultimoMensaje?.enviadoEn ?? DateTime.fromMillisecondsSinceEpoch(0);

  MessageThread copyWith({
    int? id,
    int? clienteId,
    MessageChannel? channel,
    List<Message>? mensajes,
  }) {
    return MessageThread(
      id: id ?? this.id,
      clienteId: clienteId ?? this.clienteId,
      channel: channel ?? this.channel,
      mensajes: mensajes ?? this.mensajes,
    );
  }
}

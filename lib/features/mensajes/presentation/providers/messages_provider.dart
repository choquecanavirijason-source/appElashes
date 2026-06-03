import 'dart:async';
import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/data/mock_messages.dart';
import '../../domain/entities/message.dart';

class MessagesNotifier extends Notifier<List<MessageThread>> {
  final _rand = math.Random();
  int _nextMessageId = 1000;

  @override
  List<MessageThread> build() {
    return buildMockThreads()
      ..sort((a, b) => b.ultimaActividad.compareTo(a.ultimaActividad));
  }

  MessageThread? threadByClient({
    required int clienteId,
    required MessageChannel channel,
  }) {
    for (final t in state) {
      if (t.clienteId == clienteId && t.channel == channel) return t;
    }
    return null;
  }

  /// Garantiza que exista un thread para `clienteId+channel`. Si no existe,
  /// lo crea vacío y devuelve la referencia actualizada.
  MessageThread ensureThread({
    required int clienteId,
    required MessageChannel channel,
  }) {
    final existing = threadByClient(clienteId: clienteId, channel: channel);
    if (existing != null) return existing;

    final nextId = state.isEmpty
        ? 1
        : (state.map((t) => t.id).reduce((a, b) => a > b ? a : b) + 1);
    final nuevo = MessageThread(
      id: nextId,
      clienteId: clienteId,
      channel: channel,
      mensajes: const [],
    );
    state = [nuevo, ...state];
    return nuevo;
  }

  /// Envía un mensaje del usuario. Simula una respuesta del cliente (WA) o
  /// del asistente (IA) con un pequeño retraso.
  Future<void> enviar({
    required int clienteId,
    required MessageChannel channel,
    required String texto,
  }) async {
    final trimmed = texto.trim();
    if (trimmed.isEmpty) return;

    ensureThread(clienteId: clienteId, channel: channel);

    final mensajeUsuario = Message(
      id: _nextMessageId++,
      texto: trimmed,
      enviadoEn: DateTime.now(),
      sender: MessageSender.user,
      channel: channel,
    );
    _append(clienteId: clienteId, channel: channel, mensaje: mensajeUsuario);

    // Simulación: respuesta automática después de 800–1500 ms.
    await Future<void>.delayed(
      Duration(milliseconds: 800 + _rand.nextInt(700)),
    );

    final respuestaTexto = channel == MessageChannel.ai
        ? kAiCannedReplies[_rand.nextInt(kAiCannedReplies.length)]
        : kClientCannedReplies[_rand.nextInt(kClientCannedReplies.length)];

    final respuesta = Message(
      id: _nextMessageId++,
      texto: respuestaTexto,
      enviadoEn: DateTime.now(),
      sender: channel == MessageChannel.ai
          ? MessageSender.ai
          : MessageSender.client,
      channel: channel,
    );
    _append(clienteId: clienteId, channel: channel, mensaje: respuesta);
  }

  void _append({
    required int clienteId,
    required MessageChannel channel,
    required Message mensaje,
  }) {
    state = [
      for (final t in state)
        if (t.clienteId == clienteId && t.channel == channel)
          t.copyWith(mensajes: [...t.mensajes, mensaje])
        else
          t,
    ]..sort((a, b) => b.ultimaActividad.compareTo(a.ultimaActividad));
  }
}

final messagesProvider =
    NotifierProvider<MessagesNotifier, List<MessageThread>>(
  MessagesNotifier.new,
);

/// Sólo hilos de WhatsApp (excluye el de IA).
final whatsappThreadsProvider = Provider<List<MessageThread>>((ref) {
  final all = ref.watch(messagesProvider);
  return all.where((t) => t.channel == MessageChannel.whatsapp).toList();
});

/// El hilo único del asistente IA.
final aiThreadProvider = Provider<MessageThread>((ref) {
  final all = ref.watch(messagesProvider);
  return all.firstWhere(
    (t) => t.channel == MessageChannel.ai,
    orElse: () => const MessageThread(
      id: 0,
      clienteId: kAiThreadClientId,
      channel: MessageChannel.ai,
      mensajes: [],
    ),
  );
});

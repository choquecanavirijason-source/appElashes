import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/presentation/atoms/initials_avatar.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../clientes/presentation/providers/clients_provider.dart';
import '../../domain/entities/message.dart';
import '../providers/messages_provider.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({
    super.key,
    required this.clienteId,
    required this.channel,
  });

  final int clienteId;
  final MessageChannel channel;

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final _composer = TextEditingController();
  final _scroll = ScrollController();
  bool _sending = false;

  @override
  void dispose() {
    _composer.dispose();
    _scroll.dispose();
    super.dispose();
  }

  Future<void> _send() async {
    final texto = _composer.text;
    if (texto.trim().isEmpty || _sending) return;

    setState(() => _sending = true);
    _composer.clear();

    await ref.read(messagesProvider.notifier).enviar(
          clienteId: widget.clienteId,
          channel: widget.channel,
          texto: texto,
        );

    if (mounted) {
      setState(() => _sending = false);
      _scrollToBottom();
      if (widget.channel == MessageChannel.whatsapp) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('✓ Enviado por WhatsApp'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scroll.hasClients) {
        _scroll.animateTo(
          _scroll.position.maxScrollExtent,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isAi = widget.channel == MessageChannel.ai;
    final cliente = ref.watch(clientByIdProvider(widget.clienteId));
    final thread = ref.watch(messagesProvider).firstWhere(
          (t) => t.clienteId == widget.clienteId && t.channel == widget.channel,
          orElse: () => MessageThread(
            id: -1,
            clienteId: widget.clienteId,
            channel: widget.channel,
            mensajes: const [],
          ),
        );

    // Auto-scroll cuando llega un mensaje nuevo.
    _scrollToBottom();

    final tituloPantalla = isAi
        ? 'Asistente IA'
        : (cliente?.nombreCompleto ?? 'Cliente');
    final subtituloPantalla = isAi
        ? 'Salón Elashes · simulación'
        : 'WhatsApp · simulación';

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            isAi
                ? const CircleAvatar(
                    backgroundColor: AppColors.brandPrimary,
                    child: Icon(Icons.auto_awesome, color: Colors.white),
                  )
                : InitialsAvatar(initials: cliente?.iniciales ?? '?'),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    tituloPantalla,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    subtituloPantalla,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: thread.mensajes.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Text(
                        isAi
                            ? '¡Hola! Pregúntame lo que necesites del salón.'
                            : 'Sin mensajes todavía. Escribe el primero.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color:
                                  Theme.of(context).colorScheme.onSurfaceVariant,
                            ),
                      ),
                    ),
                  )
                : ListView.builder(
                    controller: _scroll,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                    itemCount: thread.mensajes.length,
                    itemBuilder: (_, i) => _Bubble(
                      mensaje: thread.mensajes[i],
                      isAi: isAi,
                    ),
                  ),
          ),
          _Composer(
            controller: _composer,
            sending: _sending,
            channel: widget.channel,
            onSend: _send,
          ),
        ],
      ),
    );
  }
}

class _Bubble extends StatelessWidget {
  const _Bubble({required this.mensaje, required this.isAi});

  final Message mensaje;
  final bool isAi;

  @override
  Widget build(BuildContext context) {
    final esUser = mensaje.esDelUsuario;
    final align = esUser ? Alignment.centerRight : Alignment.centerLeft;
    final color = esUser
        ? AppColors.brandPrimary
        : (isAi
            ? AppColors.brandAccent.withValues(alpha: 0.15)
            : const Color(0xFFEAEFF1));
    final fg = esUser ? Colors.white : Colors.black87;
    final hora = DateFormat('HH:mm').format(mensaje.enviadoEn);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      alignment: align,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width * 0.78,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(16),
              topRight: const Radius.circular(16),
              bottomLeft: Radius.circular(esUser ? 16 : 4),
              bottomRight: Radius.circular(esUser ? 4 : 16),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                mensaje.texto,
                style: TextStyle(color: fg, fontSize: 14, height: 1.3),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    hora,
                    style: TextStyle(
                      color: esUser
                          ? Colors.white.withValues(alpha: 0.8)
                          : Colors.black54,
                      fontSize: 10,
                    ),
                  ),
                  if (esUser) ...[
                    const SizedBox(width: 4),
                    Icon(
                      Icons.done_all,
                      size: 12,
                      color: Colors.white.withValues(alpha: 0.85),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Composer extends StatelessWidget {
  const _Composer({
    required this.controller,
    required this.sending,
    required this.channel,
    required this.onSend,
  });

  final TextEditingController controller;
  final bool sending;
  final MessageChannel channel;
  final VoidCallback onSend;

  @override
  Widget build(BuildContext context) {
    final isAi = channel == MessageChannel.ai;
    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          border: Border(
            top: BorderSide(
              color: Theme.of(context).colorScheme.outlineVariant,
              width: 0.5,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                minLines: 1,
                maxLines: 4,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  hintText: isAi
                      ? 'Pregúntale al asistente…'
                      : 'Escribe un mensaje…',
                  filled: true,
                  fillColor: Theme.of(context)
                      .colorScheme
                      .surfaceContainerHighest
                      .withValues(alpha: 0.4),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
                onSubmitted: (_) => onSend(),
              ),
            ),
            const SizedBox(width: 8),
            Material(
              color: isAi
                  ? AppColors.brandPrimary
                  : const Color(0xFF25D366), // WhatsApp green
              shape: const CircleBorder(),
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: sending ? null : onSend,
                child: SizedBox(
                  width: 48,
                  height: 48,
                  child: Center(
                    child: sending
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.4,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.white,
                              ),
                            ),
                          )
                        : Icon(
                            isAi ? Icons.auto_awesome : Icons.send,
                            color: Colors.white,
                            size: 20,
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

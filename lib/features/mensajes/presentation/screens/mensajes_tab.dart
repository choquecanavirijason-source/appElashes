import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/presentation/atoms/initials_avatar.dart';
import '../../../../core/router/routes.dart';
import '../../../../core/services/whatsapp_service.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../clientes/presentation/providers/clients_provider.dart';
import '../../domain/entities/message.dart';
import '../providers/messages_provider.dart';

class MensajesScreen extends ConsumerStatefulWidget {
  const MensajesScreen({super.key});

  @override
  ConsumerState<MensajesScreen> createState() => _MensajesScreenState();
}

class _MensajesScreenState extends ConsumerState<MensajesScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tab;

  @override
  void initState() {
    super.initState();
    _tab = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tab.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBg,
      appBar: AppBar(
        backgroundColor: AppColors.darkBg,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Mensajes',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 22,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(42),
          child: TabBar(
            controller: _tab,
            labelColor: Colors.white,
            unselectedLabelColor: const Color(0xFF6B7280),
            indicatorColor: AppColors.goldAccent,
            indicatorWeight: 2,
            dividerColor: const Color(0xFF1E1E1E),
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
            tabs: const [
              Tab(text: 'WhatsApp'),
              Tab(text: 'Asistente IA'),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tab,
        children: const [
          _WhatsappList(),
          _AiEntry(),
        ],
      ),
    );
  }
}

// ─── WhatsApp thread list ────────────────────────────────────────────────────

class _WhatsappList extends ConsumerWidget {
  const _WhatsappList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final threads = ref.watch(whatsappThreadsProvider);

    if (threads.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF25D366).withValues(alpha: 0.10),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.chat_rounded,
                size: 48,
                color: Color(0xFF25D366),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Sin conversaciones',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Aún no hay mensajes de WhatsApp.',
              style: TextStyle(
                color: Color(0xFF6B7280),
                fontSize: 13,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      itemCount: threads.length,
      itemBuilder: (_, i) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: _ThreadTile(thread: threads[i]),
      ),
    );
  }
}

class _ThreadTile extends ConsumerWidget {
  const _ThreadTile({required this.thread});

  final MessageThread thread;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cliente = ref.watch(clientByIdProvider(thread.clienteId));
    final ultimo = thread.ultimoMensaje;
    final hora = ultimo == null
        ? ''
        : DateFormat('HH:mm').format(ultimo.enviadoEn);
    final unread = ultimo != null && !ultimo.esDelUsuario;

    return GestureDetector(
      onTap: () => context.push(AppRoutes.chatWhatsApp(thread.clienteId)),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.darkCard,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: unread
                ? const Color(0xFF25D366).withValues(alpha: 0.3)
                : AppColors.darkCardElevated,
          ),
        ),
        child: Row(
          children: [
            InitialsAvatar(
              initials: cliente?.iniciales ?? '?',
              size: 46,
              backgroundColor: AppColors.avatarOlive,
              statusColor: const Color(0xFF25D366),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cliente?.nombreCompleto ?? 'Cliente',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 3),
                  if (ultimo == null)
                    const Text(
                      'Sin mensajes',
                      style: TextStyle(
                        color: Color(0xFF4B5563),
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                      ),
                    )
                  else
                    Text(
                      '${ultimo.esDelUsuario ? "Tú: " : ""}${ultimo.texto}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: unread
                            ? const Color(0xFFD1FAE5)
                            : const Color(0xFF6B7280),
                        fontSize: 12,
                        fontWeight: unread
                            ? FontWeight.w600
                            : FontWeight.w400,
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  hora,
                  style: TextStyle(
                    color: unread
                        ? const Color(0xFF25D366)
                        : const Color(0xFF6B7280),
                    fontSize: 11,
                    fontWeight: unread ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 6),
                if (unread)
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Color(0xFF25D366),
                      shape: BoxShape.circle,
                    ),
                  )
                else
                  GestureDetector(
                    onTap: () {
                      if (cliente == null) return;
                      WhatsAppService.mostrarPlantillas(
                        context: context,
                        telefono: cliente.telefono ?? '',
                        nombreCliente: cliente.nombreCompleto,
                      );
                    },
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: const Color(0xFF25D366).withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.chat_rounded,
                        color: Color(0xFF25D366),
                        size: 14,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ─── AI entry ────────────────────────────────────────────────────────────────

class _AiEntry extends StatelessWidget {
  const _AiEntry();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.brandPrimary.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.auto_awesome,
                size: 56,
                color: AppColors.brandPrimary,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Asistente IA del salón',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Pídele resúmenes del día, agenda, recordatorios\n'
              'o respuestas para tus clientas.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF6B7280),
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: () => context.push(AppRoutes.chatIa),
              icon: const Icon(Icons.auto_awesome),
              label: const Text('Abrir chat con IA'),
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.brandPrimary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

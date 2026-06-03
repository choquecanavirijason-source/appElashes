import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/presentation/atoms/initials_avatar.dart';
import '../../../../core/presentation/organisms/empty_state.dart';
import '../../../../core/router/routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../clientes/presentation/providers/clients_provider.dart';
import '../../domain/entities/message.dart';
import '../providers/messages_provider.dart';

class MensajesTab extends ConsumerStatefulWidget {
  const MensajesTab({super.key});

  @override
  ConsumerState<MensajesTab> createState() => _MensajesTabState();
}

class _MensajesTabState extends ConsumerState<MensajesTab>
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
    return Column(
      children: [
        Material(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: TabBar(
            controller: _tab,
            labelColor: AppColors.brandPrimary,
            indicatorColor: AppColors.brandPrimary,
            tabs: const [
              Tab(icon: Icon(Icons.chat), text: 'WhatsApp'),
              Tab(icon: Icon(Icons.auto_awesome), text: 'Asistente IA'),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tab,
            children: const [
              _WhatsappList(),
              _AiEntry(),
            ],
          ),
        ),
      ],
    );
  }
}

class _WhatsappList extends ConsumerWidget {
  const _WhatsappList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final threads = ref.watch(whatsappThreadsProvider);

    if (threads.isEmpty) {
      return const EmptyState(
        icon: Icons.chat_outlined,
        title: 'Sin conversaciones',
        message: 'Aún no hay mensajes de WhatsApp.',
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: threads.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (_, i) => _ThreadTile(thread: threads[i]),
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

    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: InitialsAvatar(initials: cliente?.iniciales ?? '?'),
      title: Text(
        cliente?.nombreCompleto ?? 'Cliente',
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: ultimo == null
          ? const Text(
              'Sin mensajes',
              style: TextStyle(fontStyle: FontStyle.italic),
            )
          : Text(
              '${ultimo.esDelUsuario ? "Tú: " : ""}${ultimo.texto}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(hora, style: const TextStyle(fontSize: 11)),
          const SizedBox(height: 4),
          const Icon(Icons.chat, size: 14, color: Color(0xFF25D366)),
        ],
      ),
      onTap: () => context.push(
        AppRoutes.chatWhatsApp(thread.clienteId),
      ),
    );
  }
}

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
                color: AppColors.brandPrimary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.auto_awesome,
                size: 56,
                color: AppColors.brandPrimary,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Asistente IA del salón',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Pídele resúmenes del día, agenda, recordatorios\n'
              'o respuestas para tus clientas.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: () => context.push(AppRoutes.chatIa),
              icon: const Icon(Icons.chat_bubble),
              label: const Text('Abrir chat con IA'),
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.brandPrimary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../core/presentation/atoms/initials_avatar.dart';
import '../../../../core/presentation/atoms/status_badge.dart';
import '../../../../core/presentation/organisms/async_value_view.dart';
import '../../../../core/presentation/organisms/confirm_dialog.dart';
import '../../../../core/presentation/organisms/empty_state.dart';
import '../../../../core/services/whatsapp_service.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/client.dart';
import '../providers/clients_provider.dart';
import '../widgets/client_form_sheet.dart';

class ClientesTab extends ConsumerStatefulWidget {
  const ClientesTab({super.key});

  @override
  ConsumerState<ClientesTab> createState() => _ClientesTabState();
}

class _ClientesTabState extends ConsumerState<ClientesTab> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final asyncClientes = ref.watch(clientsListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Clientes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.invalidate(clientsListProvider),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: TextField(
              onChanged: (v) => setState(() => _query = v),
              decoration: const InputDecoration(
                hintText: 'Buscar cliente o teléfono…',
                prefixIcon: Icon(Icons.search),
                isDense: true,
              ),
            ),
          ),
          Expanded(
            child: AsyncValueView<List<Client>>(
              value: asyncClientes,
              onRetry: () => ref.invalidate(clientsListProvider),
              builder: (clientes) {
                final q = _query.trim().toLowerCase();
                final filtered = q.isEmpty
                    ? clientes
                    : clientes.where((c) {
                        return c.nombreCompleto.toLowerCase().contains(q) ||
                            (c.telefono?.toLowerCase().contains(q) ?? false);
                      }).toList();

                if (filtered.isEmpty) {
                  return const EmptyState(
                    icon: Icons.people_outline,
                    title: 'Sin clientes',
                    message: 'Toca + para registrar el primero.',
                  );
                }

                return ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 88),
                  itemCount: filtered.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemBuilder: (_, i) => _ClientCard(
                    client: filtered[i],
                    onDelete: () => _onDelete(filtered[i]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.brandPrimary,
        foregroundColor: Colors.white,
        onPressed: () => ClientFormSheet.show(context),
        icon: const Icon(Icons.person_add_alt_1),
        label: const Text('Nuevo cliente'),
      ),
    );
  }

  Future<void> _onDelete(Client client) async {
    final confirmed = await ConfirmDialog.show(
      context,
      title: 'Eliminar cliente',
      message:
          '¿Eliminar a ${client.nombreCompleto}? Esta acción no se puede deshacer.',
      confirmLabel: 'Eliminar',
      destructive: true,
    );
    if (!confirmed || !mounted) return;

    try {
      await ref.read(clientsListProvider.notifier).removeClient(client.id);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${client.nombreCompleto} eliminado')),
        );
      }
    } on ApiException catch (e) {
      developer.log('Error al eliminar cliente', name: 'clientes', error: e);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message)),
        );
      }
    }
  }
}

class _ClientCard extends StatelessWidget {
  const _ClientCard({required this.client, required this.onDelete});

  final Client client;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final info = [
      if (client.telefono != null) client.telefono!,
      if (client.edad != null) '${client.edad} años',
      if (client.tipoOjo != null) client.tipoOjo!,
    ].join(' · ');

    return Dismissible(
      key: ValueKey(client.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: AppColors.statusCancelado,
          borderRadius: BorderRadius.circular(14),
        ),
        child: const Icon(Icons.delete_outline, color: Colors.white),
      ),
      confirmDismiss: (_) async {
        onDelete();
        return false;
      },
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: BorderSide(
            color: Theme.of(context)
                .colorScheme
                .outlineVariant
                .withValues(alpha: 0.5),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Row(
            children: [
              InitialsAvatar(initials: client.iniciales),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      client.nombreCompleto,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    if (info.isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Text(
                        info,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF9CA3AF),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  StatusBadge(
                    label: client.status.displayName,
                    color: client.status.color,
                  ),
                  if (client.telefono != null) ...[
                    const SizedBox(height: 6),
                    GestureDetector(
                      onTap: () => WhatsAppService.mostrarPlantillas(
                        context: context,
                        telefono: client.telefono!,
                        nombreCliente: client.nombreCompleto,
                      ),
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color:
                              const Color(0xFF25D366).withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.chat_rounded,
                          color: Color(0xFF25D366),
                          size: 15,
                        ),
                      ),
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

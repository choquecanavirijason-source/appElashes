import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/presentation/atoms/initials_avatar.dart';
import '../../../../core/presentation/atoms/status_badge.dart';
import '../../../../core/presentation/organisms/empty_state.dart';
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
    final all = ref.watch(clientsProvider);
    final q = _query.trim().toLowerCase();
    final clientes = q.isEmpty
        ? all
        : all.where((c) {
            return c.nombreCompleto.toLowerCase().contains(q) ||
                c.telefono.toLowerCase().contains(q);
          }).toList();

    return Scaffold(
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
            child: clientes.isEmpty
                ? const EmptyState(
                    icon: Icons.people_outline,
                    title: 'Sin clientes',
                    message: 'Toca + para registrar el primero.',
                  )
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 88),
                    itemCount: clientes.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (_, i) => _ClientCard(client: clientes[i]),
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
}

class _ClientCard extends StatelessWidget {
  const _ClientCard({required this.client});

  final Client client;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(
          color: Theme.of(context).colorScheme.outlineVariant.withValues(
                alpha: 0.5,
              ),
        ),
      ),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        leading: InitialsAvatar(initials: client.iniciales),
        title: Text(
          client.nombreCompleto,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Text(
            '${client.telefono} · ${client.edad} años · ${client.tipoOjo}',
            style: const TextStyle(fontSize: 13),
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '${client.visitas} visitas',
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                color: AppColors.brandPrimary,
              ),
            ),
            const SizedBox(height: 4),
            if (client.esFrecuente)
              const StatusBadge(
                label: 'Frecuente',
                color: AppColors.brandAccent,
                icon: Icons.star,
              ),
          ],
        ),
      ),
    );
  }
}

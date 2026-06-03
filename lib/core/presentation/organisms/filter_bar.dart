import 'package:flutter/material.dart';

import '../molecules/search_field.dart';

/// Toolbar superior para pantallas de listado.
///
/// A la izquierda un `SearchField`; a la derecha un `Wrap` de
/// `actions` (chips de filtro, botones secundarios).
/// En pantallas <600 px las acciones bajan a una segunda fila.
class FilterBar extends StatelessWidget {
  const FilterBar({
    super.key,
    this.searchController,
    this.searchHint = 'Buscar...',
    this.onSearchChanged,
    this.actions = const [],
  });

  final TextEditingController? searchController;
  final String searchHint;
  final ValueChanged<String>? onSearchChanged;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 600;
          final search = SizedBox(
            width: isWide ? 360 : double.infinity,
            child: SearchField(
              controller: searchController,
              hint: searchHint,
              onChanged: onSearchChanged,
            ),
          );

          if (isWide) {
            return Row(
              children: [
                search,
                const Spacer(),
                Wrap(spacing: 8, runSpacing: 8, children: actions),
              ],
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              search,
              if (actions.isNotEmpty) ...[
                const SizedBox(height: 8),
                Wrap(spacing: 8, runSpacing: 8, children: actions),
              ],
            ],
          );
        },
      ),
    );
  }
}

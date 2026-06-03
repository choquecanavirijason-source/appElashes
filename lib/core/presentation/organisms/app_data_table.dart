import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

/// Definición de una columna genérica para `AppDataTable<T>`.
class AppDataColumn<T> {
  const AppDataColumn({
    required this.label,
    required this.cellBuilder,
    this.size = ColumnSize.M,
    this.numeric = false,
    this.tooltip,
  });

  final String label;
  final Widget Function(T item) cellBuilder;
  final ColumnSize size;
  final bool numeric;
  final String? tooltip;
}

/// Acción contextual por fila (botón al final, o menú overflow).
class AppDataRowAction<T> {
  const AppDataRowAction({
    required this.icon,
    required this.tooltip,
    required this.onTap,
    this.color,
    this.visible,
  });

  final IconData icon;
  final String tooltip;
  final void Function(T item) onTap;
  final Color? color;
  final bool Function(T item)? visible;
}

/// Tabla genérica basada en `data_table_2` con responsive horizontal scroll,
/// columna opcional de acciones, callback de tap por fila y empty state.
class AppDataTable<T> extends StatelessWidget {
  const AppDataTable({
    super.key,
    required this.rows,
    required this.columns,
    this.actions = const [],
    this.onRowTap,
    this.minWidth = 720,
    this.rowsPerPage,
  });

  final List<T> rows;
  final List<AppDataColumn<T>> columns;
  final List<AppDataRowAction<T>> actions;
  final void Function(T item)? onRowTap;
  final double minWidth;
  final int? rowsPerPage;

  @override
  Widget build(BuildContext context) {
    final tableColumns = <DataColumn2>[
      ...columns.map(
        (c) => DataColumn2(
          label: Text(
            c.label,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          tooltip: c.tooltip,
          numeric: c.numeric,
          size: c.size,
        ),
      ),
      if (actions.isNotEmpty)
        const DataColumn2(
          label: Text(
            'Acciones',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          size: ColumnSize.S,
          fixedWidth: 140,
        ),
    ];

    final tableRows = rows.map<DataRow>((item) {
      final cells = <DataCell>[
        ...columns.map(
          (c) => DataCell(
            c.cellBuilder(item),
            onTap: onRowTap == null ? null : () => onRowTap!(item),
          ),
        ),
        if (actions.isNotEmpty)
          DataCell(_ActionsRow<T>(item: item, actions: actions)),
      ];
      return DataRow(cells: cells);
    }).toList();

    return DataTable2(
      columns: tableColumns,
      rows: tableRows,
      minWidth: minWidth,
      columnSpacing: 16,
      horizontalMargin: 16,
      headingRowHeight: 44,
      dataRowHeight: 56,
      empty: const Padding(
        padding: EdgeInsets.all(24),
        child: Text('Sin resultados', textAlign: TextAlign.center),
      ),
    );
  }
}

class _ActionsRow<T> extends StatelessWidget {
  const _ActionsRow({required this.item, required this.actions});

  final T item;
  final List<AppDataRowAction<T>> actions;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: actions
          .where((a) => a.visible?.call(item) ?? true)
          .map(
            (a) => IconButton(
              icon: Icon(a.icon, size: 20, color: a.color),
              tooltip: a.tooltip,
              onPressed: () => a.onTap(item),
            ),
          )
          .toList(),
    );
  }
}

import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../core/presentation/organisms/async_value_view.dart';
import '../../../../core/presentation/organisms/confirm_dialog.dart';
import '../../../../core/presentation/organisms/empty_state.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/product.dart';
import '../providers/inventory_provider.dart';
import '../widgets/product_form_sheet.dart';

class InventarioScreen extends ConsumerStatefulWidget {
  const InventarioScreen({super.key});

  @override
  ConsumerState<InventarioScreen> createState() => _InventarioScreenState();
}

class _InventarioScreenState extends ConsumerState<InventarioScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabs;
  String _query = '';

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventario'),
        bottom: TabBar(
          controller: _tabs,
          tabs: const [
            Tab(text: 'Productos'),
            Tab(text: 'Stock'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabs,
        children: [
          _ProductsTab(query: _query, onQueryChanged: (v) => setState(() => _query = v)),
          const _StockTab(),
        ],
      ),
      floatingActionButton: ListenableBuilder(
        listenable: _tabs,
        builder: (_, __) => _tabs.index == 0
            ? FloatingActionButton.extended(
                backgroundColor: AppColors.brandPrimary,
                foregroundColor: Colors.white,
                onPressed: () => ProductFormSheet.show(context),
                icon: const Icon(Icons.add),
                label: const Text('Nuevo producto'),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}

// ─── Products tab ─────────────────────────────────────────────────────────────

class _ProductsTab extends ConsumerWidget {
  const _ProductsTab({required this.query, required this.onQueryChanged});

  final String query;
  final ValueChanged<String> onQueryChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncProducts = ref.watch(productsProvider);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          child: TextField(
            onChanged: onQueryChanged,
            decoration: const InputDecoration(
              hintText: 'Buscar por nombre o SKU…',
              prefixIcon: Icon(Icons.search),
              isDense: true,
            ),
          ),
        ),
        Expanded(
          child: AsyncValueView<List<Product>>(
            value: asyncProducts,
            onRetry: () => ref.invalidate(productsProvider),
            builder: (products) {
              final q = query.trim().toLowerCase();
              final filtered = q.isEmpty
                  ? products
                  : products.where((p) {
                      return p.name.toLowerCase().contains(q) ||
                          p.sku.toLowerCase().contains(q);
                    }).toList();

              if (filtered.isEmpty) {
                return const EmptyState(
                  icon: Icons.inventory_2_outlined,
                  title: 'Sin productos',
                  message: 'Toca + para agregar el primero.',
                );
              }

              return ListView.separated(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 88),
                itemCount: filtered.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (_, i) => _ProductCard(
                  product: filtered[i],
                  onEdit: () => ProductFormSheet.show(context, product: filtered[i]),
                  onDelete: () => _onDelete(context, ref, filtered[i]),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Future<void> _onDelete(
    BuildContext context,
    WidgetRef ref,
    Product product,
  ) async {
    final confirmed = await ConfirmDialog.show(
      context,
      title: 'Eliminar producto',
      message: '¿Eliminar "${product.name}"? Esta acción no se puede deshacer.',
      confirmLabel: 'Eliminar',
      destructive: true,
    );
    if (!confirmed || !context.mounted) return;

    try {
      await ref.read(productsProvider.notifier).remove(product.id);
    } on ApiException catch (e) {
      developer.log('Error al eliminar producto', name: 'inventario', error: e);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message)),
        );
      }
    }
  }
}

class _ProductCard extends StatelessWidget {
  const _ProductCard({
    required this.product,
    required this.onEdit,
    required this.onDelete,
  });

  final Product product;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final priceFmt = NumberFormat.currency(
      locale: 'es_BO',
      symbol: 'Bs ',
      decimalDigits: 2,
    );

    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.darkCardElevated),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        leading: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: product.isActive
                ? AppColors.iconBgGreen
                : AppColors.darkCardElevated,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            Icons.inventory_2_outlined,
            color: product.isActive ? AppColors.brandAccent : Colors.grey,
            size: 22,
          ),
        ),
        title: Text(
          product.name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 2),
            Text(
              'SKU: ${product.sku}  ·  ${product.categoryName ?? 'Sin categoría'}',
              style: const TextStyle(color: Color(0xFF6B7280), fontSize: 11),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  priceFmt.format(product.price),
                  style: const TextStyle(
                    color: AppColors.brandAccent,
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'Costo: ${priceFmt.format(product.cost)}',
                  style: const TextStyle(color: Color(0xFF6B7280), fontSize: 11),
                ),
              ],
            ),
          ],
        ),
        trailing: PopupMenuButton<String>(
          icon: const Icon(Icons.more_vert, color: Color(0xFF6B7280)),
          color: AppColors.darkCardElevated,
          onSelected: (v) {
            if (v == 'edit') onEdit();
            if (v == 'delete') onDelete();
          },
          itemBuilder: (_) => const [
            PopupMenuItem(
              value: 'edit',
              child: Row(
                children: [
                  Icon(Icons.edit_outlined, size: 18),
                  SizedBox(width: 8),
                  Text('Editar'),
                ],
              ),
            ),
            PopupMenuItem(
              value: 'delete',
              child: Row(
                children: [
                  Icon(Icons.delete_outline, size: 18, color: AppColors.offlineRed),
                  SizedBox(width: 8),
                  Text('Eliminar', style: TextStyle(color: AppColors.offlineRed)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Stock tab ────────────────────────────────────────────────────────────────

class _StockTab extends ConsumerWidget {
  const _StockTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncStock = ref.watch(stockSummaryProvider);

    return AsyncValueView<List<StockSummary>>(
      value: asyncStock,
      onRetry: () => ref.invalidate(stockSummaryProvider),
      builder: (items) {
        if (items.isEmpty) {
          return const EmptyState(
            icon: Icons.bar_chart_outlined,
            title: 'Sin stock registrado',
            message: 'Crea lotes de inventario para ver el stock aquí.',
          );
        }

        final low = items.where((s) => s.isLowStock).toList();
        final normal = items.where((s) => !s.isLowStock).toList();

        return ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 88),
          children: [
            if (low.isNotEmpty) ...[
              _SectionHeader(
                label: 'STOCK BAJO',
                count: low.length,
                color: AppColors.offlineRed,
              ),
              const SizedBox(height: 8),
              for (final s in low)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: _StockCard(item: s),
                ),
              const SizedBox(height: 16),
            ],
            if (normal.isNotEmpty) ...[
              _SectionHeader(
                label: 'STOCK NORMAL',
                count: normal.length,
                color: AppColors.brandAccent,
              ),
              const SizedBox(height: 8),
              for (final s in normal)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: _StockCard(item: s),
                ),
            ],
          ],
        );
      },
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.label,
    required this.count,
    required this.color,
  });

  final String label;
  final int count;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            '$count',
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}

class _StockCard extends StatelessWidget {
  const _StockCard({required this.item});

  final StockSummary item;

  @override
  Widget build(BuildContext context) {
    final isLow = item.isLowStock;
    final stockColor = isLow ? AppColors.offlineRed : AppColors.onlineGreen;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isLow
              ? AppColors.offlineRed.withValues(alpha: 0.3)
              : AppColors.darkCardElevated,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.productName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '${item.productSku}  ·  ${item.branchName}',
                  style: const TextStyle(color: Color(0xFF6B7280), fontSize: 11),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                item.totalStock.toStringAsFixed(item.totalStock == item.totalStock.roundToDouble() ? 0 : 1),
                style: TextStyle(
                  color: stockColor,
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ),
              if (item.minStock != null)
                Text(
                  'mín ${item.minStock!.toStringAsFixed(0)}',
                  style: const TextStyle(color: Color(0xFF6B7280), fontSize: 11),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/error/api_exception.dart';
import '../../../../../core/presentation/atoms/pill_button.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../data/models/inventory_dto.dart';
import '../../domain/entities/product.dart';
import '../providers/inventory_provider.dart';

class ProductFormSheet extends ConsumerStatefulWidget {
  const ProductFormSheet({super.key, this.product});

  final Product? product;

  static Future<void> show(BuildContext context, {Product? product}) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) => ProductFormSheet(product: product),
    );
  }

  @override
  ConsumerState<ProductFormSheet> createState() => _ProductFormSheetState();
}

class _ProductFormSheetState extends ConsumerState<ProductFormSheet> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _sku;
  late final TextEditingController _name;
  late final TextEditingController _price;
  late final TextEditingController _cost;
  late final TextEditingController _minStock;
  int? _categoryId;
  bool _isActive = true;
  bool _isLoading = false;

  bool get _isEdit => widget.product != null;

  @override
  void initState() {
    super.initState();
    final p = widget.product;
    _sku = TextEditingController(text: p?.sku ?? '');
    _name = TextEditingController(text: p?.name ?? '');
    _price = TextEditingController(text: p != null ? p.price.toStringAsFixed(2) : '');
    _cost = TextEditingController(text: p != null ? p.cost.toStringAsFixed(2) : '');
    _minStock = TextEditingController(
      text: p?.minStock != null ? p!.minStock!.toStringAsFixed(0) : '',
    );
    _categoryId = p?.categoryId;
    _isActive = p?.isActive ?? true;
  }

  @override
  void dispose() {
    _sku.dispose();
    _name.dispose();
    _price.dispose();
    _cost.dispose();
    _minStock.dispose();
    super.dispose();
  }

  Future<void> _onSubmit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);

    try {
      final minStockVal = _minStock.text.trim().isEmpty
          ? null
          : double.tryParse(_minStock.text.trim());

      if (_isEdit) {
        await ref.read(productsProvider.notifier).edit(
              widget.product!.id,
              ProductUpdateDto(
                sku: _sku.text.trim(),
                name: _name.text.trim(),
                categoryId: _categoryId,
                price: double.tryParse(_price.text.trim()) ?? 0,
                cost: double.tryParse(_cost.text.trim()) ?? 0,
                status: _isActive,
                minStock: minStockVal,
              ),
            );
      } else {
        await ref.read(productsProvider.notifier).create(
              ProductCreateDto(
                sku: _sku.text.trim(),
                name: _name.text.trim(),
                categoryId: _categoryId,
                price: double.tryParse(_price.text.trim()) ?? 0,
                cost: double.tryParse(_cost.text.trim()) ?? 0,
                status: _isActive,
                minStock: minStockVal,
              ),
            );
      }
      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_isEdit ? 'Producto actualizado' : 'Producto creado'),
          ),
        );
      }
    } on ApiException catch (e) {
      developer.log('Error en producto', name: 'inventario', error: e);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message)),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final categoriesAsync = ref.watch(inventoryCategoriesProvider);
    final viewInsets = MediaQuery.viewInsetsOf(context).bottom;

    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 20 + viewInsets),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                _isEdit ? 'Editar producto' : 'Nuevo producto',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _sku,
                      textCapitalization: TextCapitalization.characters,
                      decoration: const InputDecoration(labelText: 'SKU *'),
                      validator: (v) =>
                          v == null || v.trim().isEmpty ? 'Requerido' : null,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: _name,
                      textCapitalization: TextCapitalization.words,
                      decoration: const InputDecoration(labelText: 'Nombre *'),
                      validator: (v) =>
                          v == null || v.trim().length < 2 ? 'Mínimo 2 caracteres' : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              categoriesAsync.when(
                loading: () => const LinearProgressIndicator(),
                error: (_, __) => const SizedBox.shrink(),
                data: (cats) => DropdownButtonFormField<int?>(
                  initialValue: _categoryId,
                  decoration: const InputDecoration(labelText: 'Categoría'),
                  items: [
                    const DropdownMenuItem(
                      value: null,
                      child: Text('Sin categoría'),
                    ),
                    ...cats.map(
                      (c) => DropdownMenuItem(value: c.id, child: Text(c.name)),
                    ),
                  ],
                  onChanged: (v) => setState(() => _categoryId = v),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _price,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Precio venta (Bs)',
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      controller: _cost,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Costo (Bs)',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _minStock,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Stock mínimo (alerta)',
                  hintText: 'Ej: 5',
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Text('Activo', style: TextStyle(color: Colors.white70)),
                  const Spacer(),
                  Switch(
                    value: _isActive,
                    activeThumbColor: AppColors.brandAccent,
                    onChanged: (v) => setState(() => _isActive = v),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              PillButton(
                label: _isLoading
                    ? 'Guardando…'
                    : (_isEdit ? 'Actualizar' : 'Crear producto'),
                onPressed: _isLoading ? null : _onSubmit,
                height: 52,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

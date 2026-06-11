// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InventoryCategoryDto _$InventoryCategoryDtoFromJson(Map<String, dynamic> json) {
  return _InventoryCategoryDto.fromJson(json);
}

/// @nodoc
mixin _$InventoryCategoryDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this InventoryCategoryDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InventoryCategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InventoryCategoryDtoCopyWith<InventoryCategoryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryCategoryDtoCopyWith<$Res> {
  factory $InventoryCategoryDtoCopyWith(InventoryCategoryDto value,
          $Res Function(InventoryCategoryDto) then) =
      _$InventoryCategoryDtoCopyWithImpl<$Res, InventoryCategoryDto>;
  @useResult
  $Res call({int id, String name, String? description});
}

/// @nodoc
class _$InventoryCategoryDtoCopyWithImpl<$Res,
        $Val extends InventoryCategoryDto>
    implements $InventoryCategoryDtoCopyWith<$Res> {
  _$InventoryCategoryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InventoryCategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InventoryCategoryDtoImplCopyWith<$Res>
    implements $InventoryCategoryDtoCopyWith<$Res> {
  factory _$$InventoryCategoryDtoImplCopyWith(_$InventoryCategoryDtoImpl value,
          $Res Function(_$InventoryCategoryDtoImpl) then) =
      __$$InventoryCategoryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String? description});
}

/// @nodoc
class __$$InventoryCategoryDtoImplCopyWithImpl<$Res>
    extends _$InventoryCategoryDtoCopyWithImpl<$Res, _$InventoryCategoryDtoImpl>
    implements _$$InventoryCategoryDtoImplCopyWith<$Res> {
  __$$InventoryCategoryDtoImplCopyWithImpl(_$InventoryCategoryDtoImpl _value,
      $Res Function(_$InventoryCategoryDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of InventoryCategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
  }) {
    return _then(_$InventoryCategoryDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InventoryCategoryDtoImpl implements _InventoryCategoryDto {
  const _$InventoryCategoryDtoImpl(
      {required this.id, required this.name, this.description});

  factory _$InventoryCategoryDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$InventoryCategoryDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? description;

  @override
  String toString() {
    return 'InventoryCategoryDto(id: $id, name: $name, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryCategoryDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description);

  /// Create a copy of InventoryCategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryCategoryDtoImplCopyWith<_$InventoryCategoryDtoImpl>
      get copyWith =>
          __$$InventoryCategoryDtoImplCopyWithImpl<_$InventoryCategoryDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InventoryCategoryDtoImplToJson(
      this,
    );
  }
}

abstract class _InventoryCategoryDto implements InventoryCategoryDto {
  const factory _InventoryCategoryDto(
      {required final int id,
      required final String name,
      final String? description}) = _$InventoryCategoryDtoImpl;

  factory _InventoryCategoryDto.fromJson(Map<String, dynamic> json) =
      _$InventoryCategoryDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get description;

  /// Create a copy of InventoryCategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InventoryCategoryDtoImplCopyWith<_$InventoryCategoryDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

InventoryCategoryCreateDto _$InventoryCategoryCreateDtoFromJson(
    Map<String, dynamic> json) {
  return _InventoryCategoryCreateDto.fromJson(json);
}

/// @nodoc
mixin _$InventoryCategoryCreateDto {
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this InventoryCategoryCreateDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InventoryCategoryCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InventoryCategoryCreateDtoCopyWith<InventoryCategoryCreateDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryCategoryCreateDtoCopyWith<$Res> {
  factory $InventoryCategoryCreateDtoCopyWith(InventoryCategoryCreateDto value,
          $Res Function(InventoryCategoryCreateDto) then) =
      _$InventoryCategoryCreateDtoCopyWithImpl<$Res,
          InventoryCategoryCreateDto>;
  @useResult
  $Res call({String name, String? description});
}

/// @nodoc
class _$InventoryCategoryCreateDtoCopyWithImpl<$Res,
        $Val extends InventoryCategoryCreateDto>
    implements $InventoryCategoryCreateDtoCopyWith<$Res> {
  _$InventoryCategoryCreateDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InventoryCategoryCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InventoryCategoryCreateDtoImplCopyWith<$Res>
    implements $InventoryCategoryCreateDtoCopyWith<$Res> {
  factory _$$InventoryCategoryCreateDtoImplCopyWith(
          _$InventoryCategoryCreateDtoImpl value,
          $Res Function(_$InventoryCategoryCreateDtoImpl) then) =
      __$$InventoryCategoryCreateDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String? description});
}

/// @nodoc
class __$$InventoryCategoryCreateDtoImplCopyWithImpl<$Res>
    extends _$InventoryCategoryCreateDtoCopyWithImpl<$Res,
        _$InventoryCategoryCreateDtoImpl>
    implements _$$InventoryCategoryCreateDtoImplCopyWith<$Res> {
  __$$InventoryCategoryCreateDtoImplCopyWithImpl(
      _$InventoryCategoryCreateDtoImpl _value,
      $Res Function(_$InventoryCategoryCreateDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of InventoryCategoryCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
  }) {
    return _then(_$InventoryCategoryCreateDtoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InventoryCategoryCreateDtoImpl implements _InventoryCategoryCreateDto {
  const _$InventoryCategoryCreateDtoImpl(
      {required this.name, this.description});

  factory _$InventoryCategoryCreateDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$InventoryCategoryCreateDtoImplFromJson(json);

  @override
  final String name;
  @override
  final String? description;

  @override
  String toString() {
    return 'InventoryCategoryCreateDto(name: $name, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryCategoryCreateDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, description);

  /// Create a copy of InventoryCategoryCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryCategoryCreateDtoImplCopyWith<_$InventoryCategoryCreateDtoImpl>
      get copyWith => __$$InventoryCategoryCreateDtoImplCopyWithImpl<
          _$InventoryCategoryCreateDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InventoryCategoryCreateDtoImplToJson(
      this,
    );
  }
}

abstract class _InventoryCategoryCreateDto
    implements InventoryCategoryCreateDto {
  const factory _InventoryCategoryCreateDto(
      {required final String name,
      final String? description}) = _$InventoryCategoryCreateDtoImpl;

  factory _InventoryCategoryCreateDto.fromJson(Map<String, dynamic> json) =
      _$InventoryCategoryCreateDtoImpl.fromJson;

  @override
  String get name;
  @override
  String? get description;

  /// Create a copy of InventoryCategoryCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InventoryCategoryCreateDtoImplCopyWith<_$InventoryCategoryCreateDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ProductDto _$ProductDtoFromJson(Map<String, dynamic> json) {
  return _ProductDto.fromJson(json);
}

/// @nodoc
mixin _$ProductDto {
  int get id => throw _privateConstructorUsedError;
  String get sku => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  int? get categoryId => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double get cost => throw _privateConstructorUsedError;
  bool get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_stock')
  double? get minStock => throw _privateConstructorUsedError;
  InventoryCategoryDto? get category => throw _privateConstructorUsedError;

  /// Serializes this ProductDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductDtoCopyWith<ProductDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDtoCopyWith<$Res> {
  factory $ProductDtoCopyWith(
          ProductDto value, $Res Function(ProductDto) then) =
      _$ProductDtoCopyWithImpl<$Res, ProductDto>;
  @useResult
  $Res call(
      {int id,
      String sku,
      String name,
      @JsonKey(name: 'category_id') int? categoryId,
      double price,
      double cost,
      bool status,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'min_stock') double? minStock,
      InventoryCategoryDto? category});

  $InventoryCategoryDtoCopyWith<$Res>? get category;
}

/// @nodoc
class _$ProductDtoCopyWithImpl<$Res, $Val extends ProductDto>
    implements $ProductDtoCopyWith<$Res> {
  _$ProductDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sku = null,
    Object? name = null,
    Object? categoryId = freezed,
    Object? price = null,
    Object? cost = null,
    Object? status = null,
    Object? imageUrl = freezed,
    Object? minStock = freezed,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      sku: null == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      minStock: freezed == minStock
          ? _value.minStock
          : minStock // ignore: cast_nullable_to_non_nullable
              as double?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as InventoryCategoryDto?,
    ) as $Val);
  }

  /// Create a copy of ProductDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InventoryCategoryDtoCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $InventoryCategoryDtoCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductDtoImplCopyWith<$Res>
    implements $ProductDtoCopyWith<$Res> {
  factory _$$ProductDtoImplCopyWith(
          _$ProductDtoImpl value, $Res Function(_$ProductDtoImpl) then) =
      __$$ProductDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String sku,
      String name,
      @JsonKey(name: 'category_id') int? categoryId,
      double price,
      double cost,
      bool status,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'min_stock') double? minStock,
      InventoryCategoryDto? category});

  @override
  $InventoryCategoryDtoCopyWith<$Res>? get category;
}

/// @nodoc
class __$$ProductDtoImplCopyWithImpl<$Res>
    extends _$ProductDtoCopyWithImpl<$Res, _$ProductDtoImpl>
    implements _$$ProductDtoImplCopyWith<$Res> {
  __$$ProductDtoImplCopyWithImpl(
      _$ProductDtoImpl _value, $Res Function(_$ProductDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sku = null,
    Object? name = null,
    Object? categoryId = freezed,
    Object? price = null,
    Object? cost = null,
    Object? status = null,
    Object? imageUrl = freezed,
    Object? minStock = freezed,
    Object? category = freezed,
  }) {
    return _then(_$ProductDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      sku: null == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      minStock: freezed == minStock
          ? _value.minStock
          : minStock // ignore: cast_nullable_to_non_nullable
              as double?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as InventoryCategoryDto?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductDtoImpl implements _ProductDto {
  const _$ProductDtoImpl(
      {required this.id,
      required this.sku,
      required this.name,
      @JsonKey(name: 'category_id') this.categoryId,
      this.price = 0.0,
      this.cost = 0.0,
      this.status = true,
      @JsonKey(name: 'image_url') this.imageUrl,
      @JsonKey(name: 'min_stock') this.minStock,
      this.category});

  factory _$ProductDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String sku;
  @override
  final String name;
  @override
  @JsonKey(name: 'category_id')
  final int? categoryId;
  @override
  @JsonKey()
  final double price;
  @override
  @JsonKey()
  final double cost;
  @override
  @JsonKey()
  final bool status;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  @JsonKey(name: 'min_stock')
  final double? minStock;
  @override
  final InventoryCategoryDto? category;

  @override
  String toString() {
    return 'ProductDto(id: $id, sku: $sku, name: $name, categoryId: $categoryId, price: $price, cost: $cost, status: $status, imageUrl: $imageUrl, minStock: $minStock, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.minStock, minStock) ||
                other.minStock == minStock) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, sku, name, categoryId, price,
      cost, status, imageUrl, minStock, category);

  /// Create a copy of ProductDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductDtoImplCopyWith<_$ProductDtoImpl> get copyWith =>
      __$$ProductDtoImplCopyWithImpl<_$ProductDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductDtoImplToJson(
      this,
    );
  }
}

abstract class _ProductDto implements ProductDto {
  const factory _ProductDto(
      {required final int id,
      required final String sku,
      required final String name,
      @JsonKey(name: 'category_id') final int? categoryId,
      final double price,
      final double cost,
      final bool status,
      @JsonKey(name: 'image_url') final String? imageUrl,
      @JsonKey(name: 'min_stock') final double? minStock,
      final InventoryCategoryDto? category}) = _$ProductDtoImpl;

  factory _ProductDto.fromJson(Map<String, dynamic> json) =
      _$ProductDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get sku;
  @override
  String get name;
  @override
  @JsonKey(name: 'category_id')
  int? get categoryId;
  @override
  double get price;
  @override
  double get cost;
  @override
  bool get status;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  @JsonKey(name: 'min_stock')
  double? get minStock;
  @override
  InventoryCategoryDto? get category;

  /// Create a copy of ProductDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductDtoImplCopyWith<_$ProductDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductCreateDto _$ProductCreateDtoFromJson(Map<String, dynamic> json) {
  return _ProductCreateDto.fromJson(json);
}

/// @nodoc
mixin _$ProductCreateDto {
  String get sku => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  int? get categoryId => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double get cost => throw _privateConstructorUsedError;
  bool get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_stock')
  double? get minStock => throw _privateConstructorUsedError;
  @JsonKey(name: 'initial_stock')
  double? get initialStock => throw _privateConstructorUsedError;
  @JsonKey(name: 'branch_id')
  int? get branchId => throw _privateConstructorUsedError;

  /// Serializes this ProductCreateDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductCreateDtoCopyWith<ProductCreateDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCreateDtoCopyWith<$Res> {
  factory $ProductCreateDtoCopyWith(
          ProductCreateDto value, $Res Function(ProductCreateDto) then) =
      _$ProductCreateDtoCopyWithImpl<$Res, ProductCreateDto>;
  @useResult
  $Res call(
      {String sku,
      String name,
      @JsonKey(name: 'category_id') int? categoryId,
      double price,
      double cost,
      bool status,
      @JsonKey(name: 'min_stock') double? minStock,
      @JsonKey(name: 'initial_stock') double? initialStock,
      @JsonKey(name: 'branch_id') int? branchId});
}

/// @nodoc
class _$ProductCreateDtoCopyWithImpl<$Res, $Val extends ProductCreateDto>
    implements $ProductCreateDtoCopyWith<$Res> {
  _$ProductCreateDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sku = null,
    Object? name = null,
    Object? categoryId = freezed,
    Object? price = null,
    Object? cost = null,
    Object? status = null,
    Object? minStock = freezed,
    Object? initialStock = freezed,
    Object? branchId = freezed,
  }) {
    return _then(_value.copyWith(
      sku: null == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      minStock: freezed == minStock
          ? _value.minStock
          : minStock // ignore: cast_nullable_to_non_nullable
              as double?,
      initialStock: freezed == initialStock
          ? _value.initialStock
          : initialStock // ignore: cast_nullable_to_non_nullable
              as double?,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductCreateDtoImplCopyWith<$Res>
    implements $ProductCreateDtoCopyWith<$Res> {
  factory _$$ProductCreateDtoImplCopyWith(_$ProductCreateDtoImpl value,
          $Res Function(_$ProductCreateDtoImpl) then) =
      __$$ProductCreateDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String sku,
      String name,
      @JsonKey(name: 'category_id') int? categoryId,
      double price,
      double cost,
      bool status,
      @JsonKey(name: 'min_stock') double? minStock,
      @JsonKey(name: 'initial_stock') double? initialStock,
      @JsonKey(name: 'branch_id') int? branchId});
}

/// @nodoc
class __$$ProductCreateDtoImplCopyWithImpl<$Res>
    extends _$ProductCreateDtoCopyWithImpl<$Res, _$ProductCreateDtoImpl>
    implements _$$ProductCreateDtoImplCopyWith<$Res> {
  __$$ProductCreateDtoImplCopyWithImpl(_$ProductCreateDtoImpl _value,
      $Res Function(_$ProductCreateDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sku = null,
    Object? name = null,
    Object? categoryId = freezed,
    Object? price = null,
    Object? cost = null,
    Object? status = null,
    Object? minStock = freezed,
    Object? initialStock = freezed,
    Object? branchId = freezed,
  }) {
    return _then(_$ProductCreateDtoImpl(
      sku: null == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      minStock: freezed == minStock
          ? _value.minStock
          : minStock // ignore: cast_nullable_to_non_nullable
              as double?,
      initialStock: freezed == initialStock
          ? _value.initialStock
          : initialStock // ignore: cast_nullable_to_non_nullable
              as double?,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductCreateDtoImpl implements _ProductCreateDto {
  const _$ProductCreateDtoImpl(
      {required this.sku,
      required this.name,
      @JsonKey(name: 'category_id') this.categoryId,
      this.price = 0.0,
      this.cost = 0.0,
      this.status = true,
      @JsonKey(name: 'min_stock') this.minStock,
      @JsonKey(name: 'initial_stock') this.initialStock,
      @JsonKey(name: 'branch_id') this.branchId});

  factory _$ProductCreateDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductCreateDtoImplFromJson(json);

  @override
  final String sku;
  @override
  final String name;
  @override
  @JsonKey(name: 'category_id')
  final int? categoryId;
  @override
  @JsonKey()
  final double price;
  @override
  @JsonKey()
  final double cost;
  @override
  @JsonKey()
  final bool status;
  @override
  @JsonKey(name: 'min_stock')
  final double? minStock;
  @override
  @JsonKey(name: 'initial_stock')
  final double? initialStock;
  @override
  @JsonKey(name: 'branch_id')
  final int? branchId;

  @override
  String toString() {
    return 'ProductCreateDto(sku: $sku, name: $name, categoryId: $categoryId, price: $price, cost: $cost, status: $status, minStock: $minStock, initialStock: $initialStock, branchId: $branchId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductCreateDtoImpl &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.minStock, minStock) ||
                other.minStock == minStock) &&
            (identical(other.initialStock, initialStock) ||
                other.initialStock == initialStock) &&
            (identical(other.branchId, branchId) ||
                other.branchId == branchId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, sku, name, categoryId, price,
      cost, status, minStock, initialStock, branchId);

  /// Create a copy of ProductCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductCreateDtoImplCopyWith<_$ProductCreateDtoImpl> get copyWith =>
      __$$ProductCreateDtoImplCopyWithImpl<_$ProductCreateDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductCreateDtoImplToJson(
      this,
    );
  }
}

abstract class _ProductCreateDto implements ProductCreateDto {
  const factory _ProductCreateDto(
          {required final String sku,
          required final String name,
          @JsonKey(name: 'category_id') final int? categoryId,
          final double price,
          final double cost,
          final bool status,
          @JsonKey(name: 'min_stock') final double? minStock,
          @JsonKey(name: 'initial_stock') final double? initialStock,
          @JsonKey(name: 'branch_id') final int? branchId}) =
      _$ProductCreateDtoImpl;

  factory _ProductCreateDto.fromJson(Map<String, dynamic> json) =
      _$ProductCreateDtoImpl.fromJson;

  @override
  String get sku;
  @override
  String get name;
  @override
  @JsonKey(name: 'category_id')
  int? get categoryId;
  @override
  double get price;
  @override
  double get cost;
  @override
  bool get status;
  @override
  @JsonKey(name: 'min_stock')
  double? get minStock;
  @override
  @JsonKey(name: 'initial_stock')
  double? get initialStock;
  @override
  @JsonKey(name: 'branch_id')
  int? get branchId;

  /// Create a copy of ProductCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductCreateDtoImplCopyWith<_$ProductCreateDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductUpdateDto _$ProductUpdateDtoFromJson(Map<String, dynamic> json) {
  return _ProductUpdateDto.fromJson(json);
}

/// @nodoc
mixin _$ProductUpdateDto {
  String? get sku => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  int? get categoryId => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  double? get cost => throw _privateConstructorUsedError;
  bool? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_stock')
  double? get minStock => throw _privateConstructorUsedError;

  /// Serializes this ProductUpdateDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductUpdateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductUpdateDtoCopyWith<ProductUpdateDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductUpdateDtoCopyWith<$Res> {
  factory $ProductUpdateDtoCopyWith(
          ProductUpdateDto value, $Res Function(ProductUpdateDto) then) =
      _$ProductUpdateDtoCopyWithImpl<$Res, ProductUpdateDto>;
  @useResult
  $Res call(
      {String? sku,
      String? name,
      @JsonKey(name: 'category_id') int? categoryId,
      double? price,
      double? cost,
      bool? status,
      @JsonKey(name: 'min_stock') double? minStock});
}

/// @nodoc
class _$ProductUpdateDtoCopyWithImpl<$Res, $Val extends ProductUpdateDto>
    implements $ProductUpdateDtoCopyWith<$Res> {
  _$ProductUpdateDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductUpdateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sku = freezed,
    Object? name = freezed,
    Object? categoryId = freezed,
    Object? price = freezed,
    Object? cost = freezed,
    Object? status = freezed,
    Object? minStock = freezed,
  }) {
    return _then(_value.copyWith(
      sku: freezed == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      cost: freezed == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      minStock: freezed == minStock
          ? _value.minStock
          : minStock // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductUpdateDtoImplCopyWith<$Res>
    implements $ProductUpdateDtoCopyWith<$Res> {
  factory _$$ProductUpdateDtoImplCopyWith(_$ProductUpdateDtoImpl value,
          $Res Function(_$ProductUpdateDtoImpl) then) =
      __$$ProductUpdateDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? sku,
      String? name,
      @JsonKey(name: 'category_id') int? categoryId,
      double? price,
      double? cost,
      bool? status,
      @JsonKey(name: 'min_stock') double? minStock});
}

/// @nodoc
class __$$ProductUpdateDtoImplCopyWithImpl<$Res>
    extends _$ProductUpdateDtoCopyWithImpl<$Res, _$ProductUpdateDtoImpl>
    implements _$$ProductUpdateDtoImplCopyWith<$Res> {
  __$$ProductUpdateDtoImplCopyWithImpl(_$ProductUpdateDtoImpl _value,
      $Res Function(_$ProductUpdateDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductUpdateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sku = freezed,
    Object? name = freezed,
    Object? categoryId = freezed,
    Object? price = freezed,
    Object? cost = freezed,
    Object? status = freezed,
    Object? minStock = freezed,
  }) {
    return _then(_$ProductUpdateDtoImpl(
      sku: freezed == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      cost: freezed == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      minStock: freezed == minStock
          ? _value.minStock
          : minStock // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductUpdateDtoImpl implements _ProductUpdateDto {
  const _$ProductUpdateDtoImpl(
      {this.sku,
      this.name,
      @JsonKey(name: 'category_id') this.categoryId,
      this.price,
      this.cost,
      this.status,
      @JsonKey(name: 'min_stock') this.minStock});

  factory _$ProductUpdateDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductUpdateDtoImplFromJson(json);

  @override
  final String? sku;
  @override
  final String? name;
  @override
  @JsonKey(name: 'category_id')
  final int? categoryId;
  @override
  final double? price;
  @override
  final double? cost;
  @override
  final bool? status;
  @override
  @JsonKey(name: 'min_stock')
  final double? minStock;

  @override
  String toString() {
    return 'ProductUpdateDto(sku: $sku, name: $name, categoryId: $categoryId, price: $price, cost: $cost, status: $status, minStock: $minStock)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductUpdateDtoImpl &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.minStock, minStock) ||
                other.minStock == minStock));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, sku, name, categoryId, price, cost, status, minStock);

  /// Create a copy of ProductUpdateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductUpdateDtoImplCopyWith<_$ProductUpdateDtoImpl> get copyWith =>
      __$$ProductUpdateDtoImplCopyWithImpl<_$ProductUpdateDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductUpdateDtoImplToJson(
      this,
    );
  }
}

abstract class _ProductUpdateDto implements ProductUpdateDto {
  const factory _ProductUpdateDto(
          {final String? sku,
          final String? name,
          @JsonKey(name: 'category_id') final int? categoryId,
          final double? price,
          final double? cost,
          final bool? status,
          @JsonKey(name: 'min_stock') final double? minStock}) =
      _$ProductUpdateDtoImpl;

  factory _ProductUpdateDto.fromJson(Map<String, dynamic> json) =
      _$ProductUpdateDtoImpl.fromJson;

  @override
  String? get sku;
  @override
  String? get name;
  @override
  @JsonKey(name: 'category_id')
  int? get categoryId;
  @override
  double? get price;
  @override
  double? get cost;
  @override
  bool? get status;
  @override
  @JsonKey(name: 'min_stock')
  double? get minStock;

  /// Create a copy of ProductUpdateDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductUpdateDtoImplCopyWith<_$ProductUpdateDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StockSummaryDto _$StockSummaryDtoFromJson(Map<String, dynamic> json) {
  return _StockSummaryDto.fromJson(json);
}

/// @nodoc
mixin _$StockSummaryDto {
  @JsonKey(name: 'product_id')
  int get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String get productName => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_sku')
  String get productSku => throw _privateConstructorUsedError;
  @JsonKey(name: 'branch_id')
  int get branchId => throw _privateConstructorUsedError;
  @JsonKey(name: 'branch_name')
  String get branchName => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_stock')
  double get totalStock => throw _privateConstructorUsedError;

  /// Serializes this StockSummaryDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StockSummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StockSummaryDtoCopyWith<StockSummaryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockSummaryDtoCopyWith<$Res> {
  factory $StockSummaryDtoCopyWith(
          StockSummaryDto value, $Res Function(StockSummaryDto) then) =
      _$StockSummaryDtoCopyWithImpl<$Res, StockSummaryDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'product_id') int productId,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'product_sku') String productSku,
      @JsonKey(name: 'branch_id') int branchId,
      @JsonKey(name: 'branch_name') String branchName,
      @JsonKey(name: 'total_stock') double totalStock});
}

/// @nodoc
class _$StockSummaryDtoCopyWithImpl<$Res, $Val extends StockSummaryDto>
    implements $StockSummaryDtoCopyWith<$Res> {
  _$StockSummaryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StockSummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? productName = null,
    Object? productSku = null,
    Object? branchId = null,
    Object? branchName = null,
    Object? totalStock = null,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productSku: null == productSku
          ? _value.productSku
          : productSku // ignore: cast_nullable_to_non_nullable
              as String,
      branchId: null == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int,
      branchName: null == branchName
          ? _value.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String,
      totalStock: null == totalStock
          ? _value.totalStock
          : totalStock // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StockSummaryDtoImplCopyWith<$Res>
    implements $StockSummaryDtoCopyWith<$Res> {
  factory _$$StockSummaryDtoImplCopyWith(_$StockSummaryDtoImpl value,
          $Res Function(_$StockSummaryDtoImpl) then) =
      __$$StockSummaryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'product_id') int productId,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'product_sku') String productSku,
      @JsonKey(name: 'branch_id') int branchId,
      @JsonKey(name: 'branch_name') String branchName,
      @JsonKey(name: 'total_stock') double totalStock});
}

/// @nodoc
class __$$StockSummaryDtoImplCopyWithImpl<$Res>
    extends _$StockSummaryDtoCopyWithImpl<$Res, _$StockSummaryDtoImpl>
    implements _$$StockSummaryDtoImplCopyWith<$Res> {
  __$$StockSummaryDtoImplCopyWithImpl(
      _$StockSummaryDtoImpl _value, $Res Function(_$StockSummaryDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of StockSummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? productName = null,
    Object? productSku = null,
    Object? branchId = null,
    Object? branchName = null,
    Object? totalStock = null,
  }) {
    return _then(_$StockSummaryDtoImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productSku: null == productSku
          ? _value.productSku
          : productSku // ignore: cast_nullable_to_non_nullable
              as String,
      branchId: null == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int,
      branchName: null == branchName
          ? _value.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String,
      totalStock: null == totalStock
          ? _value.totalStock
          : totalStock // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StockSummaryDtoImpl implements _StockSummaryDto {
  const _$StockSummaryDtoImpl(
      {@JsonKey(name: 'product_id') required this.productId,
      @JsonKey(name: 'product_name') required this.productName,
      @JsonKey(name: 'product_sku') required this.productSku,
      @JsonKey(name: 'branch_id') required this.branchId,
      @JsonKey(name: 'branch_name') required this.branchName,
      @JsonKey(name: 'total_stock') this.totalStock = 0.0});

  factory _$StockSummaryDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$StockSummaryDtoImplFromJson(json);

  @override
  @JsonKey(name: 'product_id')
  final int productId;
  @override
  @JsonKey(name: 'product_name')
  final String productName;
  @override
  @JsonKey(name: 'product_sku')
  final String productSku;
  @override
  @JsonKey(name: 'branch_id')
  final int branchId;
  @override
  @JsonKey(name: 'branch_name')
  final String branchName;
  @override
  @JsonKey(name: 'total_stock')
  final double totalStock;

  @override
  String toString() {
    return 'StockSummaryDto(productId: $productId, productName: $productName, productSku: $productSku, branchId: $branchId, branchName: $branchName, totalStock: $totalStock)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockSummaryDtoImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productSku, productSku) ||
                other.productSku == productSku) &&
            (identical(other.branchId, branchId) ||
                other.branchId == branchId) &&
            (identical(other.branchName, branchName) ||
                other.branchName == branchName) &&
            (identical(other.totalStock, totalStock) ||
                other.totalStock == totalStock));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, productId, productName,
      productSku, branchId, branchName, totalStock);

  /// Create a copy of StockSummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StockSummaryDtoImplCopyWith<_$StockSummaryDtoImpl> get copyWith =>
      __$$StockSummaryDtoImplCopyWithImpl<_$StockSummaryDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StockSummaryDtoImplToJson(
      this,
    );
  }
}

abstract class _StockSummaryDto implements StockSummaryDto {
  const factory _StockSummaryDto(
          {@JsonKey(name: 'product_id') required final int productId,
          @JsonKey(name: 'product_name') required final String productName,
          @JsonKey(name: 'product_sku') required final String productSku,
          @JsonKey(name: 'branch_id') required final int branchId,
          @JsonKey(name: 'branch_name') required final String branchName,
          @JsonKey(name: 'total_stock') final double totalStock}) =
      _$StockSummaryDtoImpl;

  factory _StockSummaryDto.fromJson(Map<String, dynamic> json) =
      _$StockSummaryDtoImpl.fromJson;

  @override
  @JsonKey(name: 'product_id')
  int get productId;
  @override
  @JsonKey(name: 'product_name')
  String get productName;
  @override
  @JsonKey(name: 'product_sku')
  String get productSku;
  @override
  @JsonKey(name: 'branch_id')
  int get branchId;
  @override
  @JsonKey(name: 'branch_name')
  String get branchName;
  @override
  @JsonKey(name: 'total_stock')
  double get totalStock;

  /// Create a copy of StockSummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StockSummaryDtoImplCopyWith<_$StockSummaryDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

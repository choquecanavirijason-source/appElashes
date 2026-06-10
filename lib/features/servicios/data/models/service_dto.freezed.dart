// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ServiceCategoryDto _$ServiceCategoryDtoFromJson(Map<String, dynamic> json) {
  return _ServiceCategoryDto.fromJson(json);
}

/// @nodoc
mixin _$ServiceCategoryDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_mobile')
  bool get isMobile => throw _privateConstructorUsedError;

  /// Serializes this ServiceCategoryDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ServiceCategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServiceCategoryDtoCopyWith<ServiceCategoryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceCategoryDtoCopyWith<$Res> {
  factory $ServiceCategoryDtoCopyWith(
          ServiceCategoryDto value, $Res Function(ServiceCategoryDto) then) =
      _$ServiceCategoryDtoCopyWithImpl<$Res, ServiceCategoryDto>;
  @useResult
  $Res call(
      {int id,
      String name,
      String? description,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'is_mobile') bool isMobile});
}

/// @nodoc
class _$ServiceCategoryDtoCopyWithImpl<$Res, $Val extends ServiceCategoryDto>
    implements $ServiceCategoryDtoCopyWith<$Res> {
  _$ServiceCategoryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServiceCategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? isMobile = null,
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
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isMobile: null == isMobile
          ? _value.isMobile
          : isMobile // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceCategoryDtoImplCopyWith<$Res>
    implements $ServiceCategoryDtoCopyWith<$Res> {
  factory _$$ServiceCategoryDtoImplCopyWith(_$ServiceCategoryDtoImpl value,
          $Res Function(_$ServiceCategoryDtoImpl) then) =
      __$$ServiceCategoryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String? description,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'is_mobile') bool isMobile});
}

/// @nodoc
class __$$ServiceCategoryDtoImplCopyWithImpl<$Res>
    extends _$ServiceCategoryDtoCopyWithImpl<$Res, _$ServiceCategoryDtoImpl>
    implements _$$ServiceCategoryDtoImplCopyWith<$Res> {
  __$$ServiceCategoryDtoImplCopyWithImpl(_$ServiceCategoryDtoImpl _value,
      $Res Function(_$ServiceCategoryDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServiceCategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? isMobile = null,
  }) {
    return _then(_$ServiceCategoryDtoImpl(
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
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isMobile: null == isMobile
          ? _value.isMobile
          : isMobile // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceCategoryDtoImpl implements _ServiceCategoryDto {
  const _$ServiceCategoryDtoImpl(
      {required this.id,
      required this.name,
      this.description,
      @JsonKey(name: 'image_url') this.imageUrl,
      @JsonKey(name: 'is_mobile') this.isMobile = false});

  factory _$ServiceCategoryDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceCategoryDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? description;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  @JsonKey(name: 'is_mobile')
  final bool isMobile;

  @override
  String toString() {
    return 'ServiceCategoryDto(id: $id, name: $name, description: $description, imageUrl: $imageUrl, isMobile: $isMobile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceCategoryDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.isMobile, isMobile) ||
                other.isMobile == isMobile));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, description, imageUrl, isMobile);

  /// Create a copy of ServiceCategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceCategoryDtoImplCopyWith<_$ServiceCategoryDtoImpl> get copyWith =>
      __$$ServiceCategoryDtoImplCopyWithImpl<_$ServiceCategoryDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceCategoryDtoImplToJson(
      this,
    );
  }
}

abstract class _ServiceCategoryDto implements ServiceCategoryDto {
  const factory _ServiceCategoryDto(
          {required final int id,
          required final String name,
          final String? description,
          @JsonKey(name: 'image_url') final String? imageUrl,
          @JsonKey(name: 'is_mobile') final bool isMobile}) =
      _$ServiceCategoryDtoImpl;

  factory _ServiceCategoryDto.fromJson(Map<String, dynamic> json) =
      _$ServiceCategoryDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  @JsonKey(name: 'is_mobile')
  bool get isMobile;

  /// Create a copy of ServiceCategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServiceCategoryDtoImplCopyWith<_$ServiceCategoryDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ServiceDto _$ServiceDtoFromJson(Map<String, dynamic> json) {
  return _ServiceDto.fromJson(json);
}

/// @nodoc
mixin _$ServiceDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  int? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration_minutes')
  int get durationMinutes => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'commission_rate')
  double? get commissionRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'branch_ids')
  List<int>? get branchIds => throw _privateConstructorUsedError;
  ServiceCategoryDto? get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'ticket_count')
  int get ticketCount => throw _privateConstructorUsedError;

  /// Serializes this ServiceDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ServiceDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServiceDtoCopyWith<ServiceDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceDtoCopyWith<$Res> {
  factory $ServiceDtoCopyWith(
          ServiceDto value, $Res Function(ServiceDto) then) =
      _$ServiceDtoCopyWithImpl<$Res, ServiceDto>;
  @useResult
  $Res call(
      {int id,
      String name,
      String? description,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'category_id') int? categoryId,
      @JsonKey(name: 'duration_minutes') int durationMinutes,
      double price,
      @JsonKey(name: 'commission_rate') double? commissionRate,
      @JsonKey(name: 'branch_ids') List<int>? branchIds,
      ServiceCategoryDto? category,
      @JsonKey(name: 'ticket_count') int ticketCount});

  $ServiceCategoryDtoCopyWith<$Res>? get category;
}

/// @nodoc
class _$ServiceDtoCopyWithImpl<$Res, $Val extends ServiceDto>
    implements $ServiceDtoCopyWith<$Res> {
  _$ServiceDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServiceDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? categoryId = freezed,
    Object? durationMinutes = null,
    Object? price = null,
    Object? commissionRate = freezed,
    Object? branchIds = freezed,
    Object? category = freezed,
    Object? ticketCount = null,
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
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      durationMinutes: null == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      commissionRate: freezed == commissionRate
          ? _value.commissionRate
          : commissionRate // ignore: cast_nullable_to_non_nullable
              as double?,
      branchIds: freezed == branchIds
          ? _value.branchIds
          : branchIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ServiceCategoryDto?,
      ticketCount: null == ticketCount
          ? _value.ticketCount
          : ticketCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of ServiceDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServiceCategoryDtoCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $ServiceCategoryDtoCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ServiceDtoImplCopyWith<$Res>
    implements $ServiceDtoCopyWith<$Res> {
  factory _$$ServiceDtoImplCopyWith(
          _$ServiceDtoImpl value, $Res Function(_$ServiceDtoImpl) then) =
      __$$ServiceDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String? description,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'category_id') int? categoryId,
      @JsonKey(name: 'duration_minutes') int durationMinutes,
      double price,
      @JsonKey(name: 'commission_rate') double? commissionRate,
      @JsonKey(name: 'branch_ids') List<int>? branchIds,
      ServiceCategoryDto? category,
      @JsonKey(name: 'ticket_count') int ticketCount});

  @override
  $ServiceCategoryDtoCopyWith<$Res>? get category;
}

/// @nodoc
class __$$ServiceDtoImplCopyWithImpl<$Res>
    extends _$ServiceDtoCopyWithImpl<$Res, _$ServiceDtoImpl>
    implements _$$ServiceDtoImplCopyWith<$Res> {
  __$$ServiceDtoImplCopyWithImpl(
      _$ServiceDtoImpl _value, $Res Function(_$ServiceDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServiceDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? categoryId = freezed,
    Object? durationMinutes = null,
    Object? price = null,
    Object? commissionRate = freezed,
    Object? branchIds = freezed,
    Object? category = freezed,
    Object? ticketCount = null,
  }) {
    return _then(_$ServiceDtoImpl(
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
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      durationMinutes: null == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      commissionRate: freezed == commissionRate
          ? _value.commissionRate
          : commissionRate // ignore: cast_nullable_to_non_nullable
              as double?,
      branchIds: freezed == branchIds
          ? _value._branchIds
          : branchIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ServiceCategoryDto?,
      ticketCount: null == ticketCount
          ? _value.ticketCount
          : ticketCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceDtoImpl implements _ServiceDto {
  const _$ServiceDtoImpl(
      {required this.id,
      required this.name,
      this.description,
      @JsonKey(name: 'image_url') this.imageUrl,
      @JsonKey(name: 'category_id') this.categoryId,
      @JsonKey(name: 'duration_minutes') required this.durationMinutes,
      required this.price,
      @JsonKey(name: 'commission_rate') this.commissionRate,
      @JsonKey(name: 'branch_ids') final List<int>? branchIds,
      this.category,
      @JsonKey(name: 'ticket_count') this.ticketCount = 0})
      : _branchIds = branchIds;

  factory _$ServiceDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? description;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  @JsonKey(name: 'category_id')
  final int? categoryId;
  @override
  @JsonKey(name: 'duration_minutes')
  final int durationMinutes;
  @override
  final double price;
  @override
  @JsonKey(name: 'commission_rate')
  final double? commissionRate;
  final List<int>? _branchIds;
  @override
  @JsonKey(name: 'branch_ids')
  List<int>? get branchIds {
    final value = _branchIds;
    if (value == null) return null;
    if (_branchIds is EqualUnmodifiableListView) return _branchIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final ServiceCategoryDto? category;
  @override
  @JsonKey(name: 'ticket_count')
  final int ticketCount;

  @override
  String toString() {
    return 'ServiceDto(id: $id, name: $name, description: $description, imageUrl: $imageUrl, categoryId: $categoryId, durationMinutes: $durationMinutes, price: $price, commissionRate: $commissionRate, branchIds: $branchIds, category: $category, ticketCount: $ticketCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.commissionRate, commissionRate) ||
                other.commissionRate == commissionRate) &&
            const DeepCollectionEquality()
                .equals(other._branchIds, _branchIds) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.ticketCount, ticketCount) ||
                other.ticketCount == ticketCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      imageUrl,
      categoryId,
      durationMinutes,
      price,
      commissionRate,
      const DeepCollectionEquality().hash(_branchIds),
      category,
      ticketCount);

  /// Create a copy of ServiceDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceDtoImplCopyWith<_$ServiceDtoImpl> get copyWith =>
      __$$ServiceDtoImplCopyWithImpl<_$ServiceDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceDtoImplToJson(
      this,
    );
  }
}

abstract class _ServiceDto implements ServiceDto {
  const factory _ServiceDto(
      {required final int id,
      required final String name,
      final String? description,
      @JsonKey(name: 'image_url') final String? imageUrl,
      @JsonKey(name: 'category_id') final int? categoryId,
      @JsonKey(name: 'duration_minutes') required final int durationMinutes,
      required final double price,
      @JsonKey(name: 'commission_rate') final double? commissionRate,
      @JsonKey(name: 'branch_ids') final List<int>? branchIds,
      final ServiceCategoryDto? category,
      @JsonKey(name: 'ticket_count') final int ticketCount}) = _$ServiceDtoImpl;

  factory _ServiceDto.fromJson(Map<String, dynamic> json) =
      _$ServiceDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  @JsonKey(name: 'category_id')
  int? get categoryId;
  @override
  @JsonKey(name: 'duration_minutes')
  int get durationMinutes;
  @override
  double get price;
  @override
  @JsonKey(name: 'commission_rate')
  double? get commissionRate;
  @override
  @JsonKey(name: 'branch_ids')
  List<int>? get branchIds;
  @override
  ServiceCategoryDto? get category;
  @override
  @JsonKey(name: 'ticket_count')
  int get ticketCount;

  /// Create a copy of ServiceDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServiceDtoImplCopyWith<_$ServiceDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ServiceCreateDto _$ServiceCreateDtoFromJson(Map<String, dynamic> json) {
  return _ServiceCreateDto.fromJson(json);
}

/// @nodoc
mixin _$ServiceCreateDto {
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  int? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration_minutes')
  int get durationMinutes => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'commission_rate')
  double? get commissionRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'branch_ids')
  List<int>? get branchIds => throw _privateConstructorUsedError;

  /// Serializes this ServiceCreateDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ServiceCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServiceCreateDtoCopyWith<ServiceCreateDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceCreateDtoCopyWith<$Res> {
  factory $ServiceCreateDtoCopyWith(
          ServiceCreateDto value, $Res Function(ServiceCreateDto) then) =
      _$ServiceCreateDtoCopyWithImpl<$Res, ServiceCreateDto>;
  @useResult
  $Res call(
      {String name,
      String? description,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'category_id') int? categoryId,
      @JsonKey(name: 'duration_minutes') int durationMinutes,
      double price,
      @JsonKey(name: 'commission_rate') double? commissionRate,
      @JsonKey(name: 'branch_ids') List<int>? branchIds});
}

/// @nodoc
class _$ServiceCreateDtoCopyWithImpl<$Res, $Val extends ServiceCreateDto>
    implements $ServiceCreateDtoCopyWith<$Res> {
  _$ServiceCreateDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServiceCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? categoryId = freezed,
    Object? durationMinutes = null,
    Object? price = null,
    Object? commissionRate = freezed,
    Object? branchIds = freezed,
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
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      durationMinutes: null == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      commissionRate: freezed == commissionRate
          ? _value.commissionRate
          : commissionRate // ignore: cast_nullable_to_non_nullable
              as double?,
      branchIds: freezed == branchIds
          ? _value.branchIds
          : branchIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceCreateDtoImplCopyWith<$Res>
    implements $ServiceCreateDtoCopyWith<$Res> {
  factory _$$ServiceCreateDtoImplCopyWith(_$ServiceCreateDtoImpl value,
          $Res Function(_$ServiceCreateDtoImpl) then) =
      __$$ServiceCreateDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String? description,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'category_id') int? categoryId,
      @JsonKey(name: 'duration_minutes') int durationMinutes,
      double price,
      @JsonKey(name: 'commission_rate') double? commissionRate,
      @JsonKey(name: 'branch_ids') List<int>? branchIds});
}

/// @nodoc
class __$$ServiceCreateDtoImplCopyWithImpl<$Res>
    extends _$ServiceCreateDtoCopyWithImpl<$Res, _$ServiceCreateDtoImpl>
    implements _$$ServiceCreateDtoImplCopyWith<$Res> {
  __$$ServiceCreateDtoImplCopyWithImpl(_$ServiceCreateDtoImpl _value,
      $Res Function(_$ServiceCreateDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServiceCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? categoryId = freezed,
    Object? durationMinutes = null,
    Object? price = null,
    Object? commissionRate = freezed,
    Object? branchIds = freezed,
  }) {
    return _then(_$ServiceCreateDtoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      durationMinutes: null == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      commissionRate: freezed == commissionRate
          ? _value.commissionRate
          : commissionRate // ignore: cast_nullable_to_non_nullable
              as double?,
      branchIds: freezed == branchIds
          ? _value._branchIds
          : branchIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceCreateDtoImpl implements _ServiceCreateDto {
  const _$ServiceCreateDtoImpl(
      {required this.name,
      this.description,
      @JsonKey(name: 'image_url') this.imageUrl,
      @JsonKey(name: 'category_id') this.categoryId,
      @JsonKey(name: 'duration_minutes') required this.durationMinutes,
      required this.price,
      @JsonKey(name: 'commission_rate') this.commissionRate,
      @JsonKey(name: 'branch_ids') final List<int>? branchIds})
      : _branchIds = branchIds;

  factory _$ServiceCreateDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceCreateDtoImplFromJson(json);

  @override
  final String name;
  @override
  final String? description;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  @JsonKey(name: 'category_id')
  final int? categoryId;
  @override
  @JsonKey(name: 'duration_minutes')
  final int durationMinutes;
  @override
  final double price;
  @override
  @JsonKey(name: 'commission_rate')
  final double? commissionRate;
  final List<int>? _branchIds;
  @override
  @JsonKey(name: 'branch_ids')
  List<int>? get branchIds {
    final value = _branchIds;
    if (value == null) return null;
    if (_branchIds is EqualUnmodifiableListView) return _branchIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ServiceCreateDto(name: $name, description: $description, imageUrl: $imageUrl, categoryId: $categoryId, durationMinutes: $durationMinutes, price: $price, commissionRate: $commissionRate, branchIds: $branchIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceCreateDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.commissionRate, commissionRate) ||
                other.commissionRate == commissionRate) &&
            const DeepCollectionEquality()
                .equals(other._branchIds, _branchIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      description,
      imageUrl,
      categoryId,
      durationMinutes,
      price,
      commissionRate,
      const DeepCollectionEquality().hash(_branchIds));

  /// Create a copy of ServiceCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceCreateDtoImplCopyWith<_$ServiceCreateDtoImpl> get copyWith =>
      __$$ServiceCreateDtoImplCopyWithImpl<_$ServiceCreateDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceCreateDtoImplToJson(
      this,
    );
  }
}

abstract class _ServiceCreateDto implements ServiceCreateDto {
  const factory _ServiceCreateDto(
          {required final String name,
          final String? description,
          @JsonKey(name: 'image_url') final String? imageUrl,
          @JsonKey(name: 'category_id') final int? categoryId,
          @JsonKey(name: 'duration_minutes') required final int durationMinutes,
          required final double price,
          @JsonKey(name: 'commission_rate') final double? commissionRate,
          @JsonKey(name: 'branch_ids') final List<int>? branchIds}) =
      _$ServiceCreateDtoImpl;

  factory _ServiceCreateDto.fromJson(Map<String, dynamic> json) =
      _$ServiceCreateDtoImpl.fromJson;

  @override
  String get name;
  @override
  String? get description;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  @JsonKey(name: 'category_id')
  int? get categoryId;
  @override
  @JsonKey(name: 'duration_minutes')
  int get durationMinutes;
  @override
  double get price;
  @override
  @JsonKey(name: 'commission_rate')
  double? get commissionRate;
  @override
  @JsonKey(name: 'branch_ids')
  List<int>? get branchIds;

  /// Create a copy of ServiceCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServiceCreateDtoImplCopyWith<_$ServiceCreateDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ServiceUpdateDto _$ServiceUpdateDtoFromJson(Map<String, dynamic> json) {
  return _ServiceUpdateDto.fromJson(json);
}

/// @nodoc
mixin _$ServiceUpdateDto {
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  int? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration_minutes')
  int? get durationMinutes => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'commission_rate')
  double? get commissionRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'branch_ids')
  List<int>? get branchIds => throw _privateConstructorUsedError;

  /// Serializes this ServiceUpdateDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ServiceUpdateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServiceUpdateDtoCopyWith<ServiceUpdateDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceUpdateDtoCopyWith<$Res> {
  factory $ServiceUpdateDtoCopyWith(
          ServiceUpdateDto value, $Res Function(ServiceUpdateDto) then) =
      _$ServiceUpdateDtoCopyWithImpl<$Res, ServiceUpdateDto>;
  @useResult
  $Res call(
      {String? name,
      String? description,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'category_id') int? categoryId,
      @JsonKey(name: 'duration_minutes') int? durationMinutes,
      double? price,
      @JsonKey(name: 'commission_rate') double? commissionRate,
      @JsonKey(name: 'branch_ids') List<int>? branchIds});
}

/// @nodoc
class _$ServiceUpdateDtoCopyWithImpl<$Res, $Val extends ServiceUpdateDto>
    implements $ServiceUpdateDtoCopyWith<$Res> {
  _$ServiceUpdateDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServiceUpdateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? categoryId = freezed,
    Object? durationMinutes = freezed,
    Object? price = freezed,
    Object? commissionRate = freezed,
    Object? branchIds = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      durationMinutes: freezed == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      commissionRate: freezed == commissionRate
          ? _value.commissionRate
          : commissionRate // ignore: cast_nullable_to_non_nullable
              as double?,
      branchIds: freezed == branchIds
          ? _value.branchIds
          : branchIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceUpdateDtoImplCopyWith<$Res>
    implements $ServiceUpdateDtoCopyWith<$Res> {
  factory _$$ServiceUpdateDtoImplCopyWith(_$ServiceUpdateDtoImpl value,
          $Res Function(_$ServiceUpdateDtoImpl) then) =
      __$$ServiceUpdateDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? description,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'category_id') int? categoryId,
      @JsonKey(name: 'duration_minutes') int? durationMinutes,
      double? price,
      @JsonKey(name: 'commission_rate') double? commissionRate,
      @JsonKey(name: 'branch_ids') List<int>? branchIds});
}

/// @nodoc
class __$$ServiceUpdateDtoImplCopyWithImpl<$Res>
    extends _$ServiceUpdateDtoCopyWithImpl<$Res, _$ServiceUpdateDtoImpl>
    implements _$$ServiceUpdateDtoImplCopyWith<$Res> {
  __$$ServiceUpdateDtoImplCopyWithImpl(_$ServiceUpdateDtoImpl _value,
      $Res Function(_$ServiceUpdateDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServiceUpdateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? categoryId = freezed,
    Object? durationMinutes = freezed,
    Object? price = freezed,
    Object? commissionRate = freezed,
    Object? branchIds = freezed,
  }) {
    return _then(_$ServiceUpdateDtoImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      durationMinutes: freezed == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      commissionRate: freezed == commissionRate
          ? _value.commissionRate
          : commissionRate // ignore: cast_nullable_to_non_nullable
              as double?,
      branchIds: freezed == branchIds
          ? _value._branchIds
          : branchIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceUpdateDtoImpl implements _ServiceUpdateDto {
  const _$ServiceUpdateDtoImpl(
      {this.name,
      this.description,
      @JsonKey(name: 'image_url') this.imageUrl,
      @JsonKey(name: 'category_id') this.categoryId,
      @JsonKey(name: 'duration_minutes') this.durationMinutes,
      this.price,
      @JsonKey(name: 'commission_rate') this.commissionRate,
      @JsonKey(name: 'branch_ids') final List<int>? branchIds})
      : _branchIds = branchIds;

  factory _$ServiceUpdateDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceUpdateDtoImplFromJson(json);

  @override
  final String? name;
  @override
  final String? description;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  @JsonKey(name: 'category_id')
  final int? categoryId;
  @override
  @JsonKey(name: 'duration_minutes')
  final int? durationMinutes;
  @override
  final double? price;
  @override
  @JsonKey(name: 'commission_rate')
  final double? commissionRate;
  final List<int>? _branchIds;
  @override
  @JsonKey(name: 'branch_ids')
  List<int>? get branchIds {
    final value = _branchIds;
    if (value == null) return null;
    if (_branchIds is EqualUnmodifiableListView) return _branchIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ServiceUpdateDto(name: $name, description: $description, imageUrl: $imageUrl, categoryId: $categoryId, durationMinutes: $durationMinutes, price: $price, commissionRate: $commissionRate, branchIds: $branchIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceUpdateDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.commissionRate, commissionRate) ||
                other.commissionRate == commissionRate) &&
            const DeepCollectionEquality()
                .equals(other._branchIds, _branchIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      description,
      imageUrl,
      categoryId,
      durationMinutes,
      price,
      commissionRate,
      const DeepCollectionEquality().hash(_branchIds));

  /// Create a copy of ServiceUpdateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceUpdateDtoImplCopyWith<_$ServiceUpdateDtoImpl> get copyWith =>
      __$$ServiceUpdateDtoImplCopyWithImpl<_$ServiceUpdateDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceUpdateDtoImplToJson(
      this,
    );
  }
}

abstract class _ServiceUpdateDto implements ServiceUpdateDto {
  const factory _ServiceUpdateDto(
          {final String? name,
          final String? description,
          @JsonKey(name: 'image_url') final String? imageUrl,
          @JsonKey(name: 'category_id') final int? categoryId,
          @JsonKey(name: 'duration_minutes') final int? durationMinutes,
          final double? price,
          @JsonKey(name: 'commission_rate') final double? commissionRate,
          @JsonKey(name: 'branch_ids') final List<int>? branchIds}) =
      _$ServiceUpdateDtoImpl;

  factory _ServiceUpdateDto.fromJson(Map<String, dynamic> json) =
      _$ServiceUpdateDtoImpl.fromJson;

  @override
  String? get name;
  @override
  String? get description;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  @JsonKey(name: 'category_id')
  int? get categoryId;
  @override
  @JsonKey(name: 'duration_minutes')
  int? get durationMinutes;
  @override
  double? get price;
  @override
  @JsonKey(name: 'commission_rate')
  double? get commissionRate;
  @override
  @JsonKey(name: 'branch_ids')
  List<int>? get branchIds;

  /// Create a copy of ServiceUpdateDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServiceUpdateDtoImplCopyWith<_$ServiceUpdateDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

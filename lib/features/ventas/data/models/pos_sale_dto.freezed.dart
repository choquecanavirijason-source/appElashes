// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pos_sale_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PosSaleClientDto _$PosSaleClientDtoFromJson(Map<String, dynamic> json) {
  return _PosSaleClientDto.fromJson(json);
}

/// @nodoc
mixin _$PosSaleClientDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;

  /// Serializes this PosSaleClientDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PosSaleClientDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PosSaleClientDtoCopyWith<PosSaleClientDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PosSaleClientDtoCopyWith<$Res> {
  factory $PosSaleClientDtoCopyWith(
          PosSaleClientDto value, $Res Function(PosSaleClientDto) then) =
      _$PosSaleClientDtoCopyWithImpl<$Res, PosSaleClientDto>;
  @useResult
  $Res call(
      {int id, String name, @JsonKey(name: 'last_name') String? lastName});
}

/// @nodoc
class _$PosSaleClientDtoCopyWithImpl<$Res, $Val extends PosSaleClientDto>
    implements $PosSaleClientDtoCopyWith<$Res> {
  _$PosSaleClientDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PosSaleClientDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? lastName = freezed,
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
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PosSaleClientDtoImplCopyWith<$Res>
    implements $PosSaleClientDtoCopyWith<$Res> {
  factory _$$PosSaleClientDtoImplCopyWith(_$PosSaleClientDtoImpl value,
          $Res Function(_$PosSaleClientDtoImpl) then) =
      __$$PosSaleClientDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, String name, @JsonKey(name: 'last_name') String? lastName});
}

/// @nodoc
class __$$PosSaleClientDtoImplCopyWithImpl<$Res>
    extends _$PosSaleClientDtoCopyWithImpl<$Res, _$PosSaleClientDtoImpl>
    implements _$$PosSaleClientDtoImplCopyWith<$Res> {
  __$$PosSaleClientDtoImplCopyWithImpl(_$PosSaleClientDtoImpl _value,
      $Res Function(_$PosSaleClientDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PosSaleClientDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? lastName = freezed,
  }) {
    return _then(_$PosSaleClientDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PosSaleClientDtoImpl implements _PosSaleClientDto {
  const _$PosSaleClientDtoImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'last_name') this.lastName});

  factory _$PosSaleClientDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PosSaleClientDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: 'last_name')
  final String? lastName;

  @override
  String toString() {
    return 'PosSaleClientDto(id: $id, name: $name, lastName: $lastName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PosSaleClientDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, lastName);

  /// Create a copy of PosSaleClientDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PosSaleClientDtoImplCopyWith<_$PosSaleClientDtoImpl> get copyWith =>
      __$$PosSaleClientDtoImplCopyWithImpl<_$PosSaleClientDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PosSaleClientDtoImplToJson(
      this,
    );
  }
}

abstract class _PosSaleClientDto implements PosSaleClientDto {
  const factory _PosSaleClientDto(
          {required final int id,
          required final String name,
          @JsonKey(name: 'last_name') final String? lastName}) =
      _$PosSaleClientDtoImpl;

  factory _PosSaleClientDto.fromJson(Map<String, dynamic> json) =
      _$PosSaleClientDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'last_name')
  String? get lastName;

  /// Create a copy of PosSaleClientDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PosSaleClientDtoImplCopyWith<_$PosSaleClientDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PosSaleCreatedByDto _$PosSaleCreatedByDtoFromJson(Map<String, dynamic> json) {
  return _PosSaleCreatedByDto.fromJson(json);
}

/// @nodoc
mixin _$PosSaleCreatedByDto {
  int get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;

  /// Serializes this PosSaleCreatedByDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PosSaleCreatedByDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PosSaleCreatedByDtoCopyWith<PosSaleCreatedByDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PosSaleCreatedByDtoCopyWith<$Res> {
  factory $PosSaleCreatedByDtoCopyWith(
          PosSaleCreatedByDto value, $Res Function(PosSaleCreatedByDto) then) =
      _$PosSaleCreatedByDtoCopyWithImpl<$Res, PosSaleCreatedByDto>;
  @useResult
  $Res call({int id, String username});
}

/// @nodoc
class _$PosSaleCreatedByDtoCopyWithImpl<$Res, $Val extends PosSaleCreatedByDto>
    implements $PosSaleCreatedByDtoCopyWith<$Res> {
  _$PosSaleCreatedByDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PosSaleCreatedByDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PosSaleCreatedByDtoImplCopyWith<$Res>
    implements $PosSaleCreatedByDtoCopyWith<$Res> {
  factory _$$PosSaleCreatedByDtoImplCopyWith(_$PosSaleCreatedByDtoImpl value,
          $Res Function(_$PosSaleCreatedByDtoImpl) then) =
      __$$PosSaleCreatedByDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String username});
}

/// @nodoc
class __$$PosSaleCreatedByDtoImplCopyWithImpl<$Res>
    extends _$PosSaleCreatedByDtoCopyWithImpl<$Res, _$PosSaleCreatedByDtoImpl>
    implements _$$PosSaleCreatedByDtoImplCopyWith<$Res> {
  __$$PosSaleCreatedByDtoImplCopyWithImpl(_$PosSaleCreatedByDtoImpl _value,
      $Res Function(_$PosSaleCreatedByDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PosSaleCreatedByDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
  }) {
    return _then(_$PosSaleCreatedByDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PosSaleCreatedByDtoImpl implements _PosSaleCreatedByDto {
  const _$PosSaleCreatedByDtoImpl({required this.id, required this.username});

  factory _$PosSaleCreatedByDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PosSaleCreatedByDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String username;

  @override
  String toString() {
    return 'PosSaleCreatedByDto(id: $id, username: $username)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PosSaleCreatedByDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, username);

  /// Create a copy of PosSaleCreatedByDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PosSaleCreatedByDtoImplCopyWith<_$PosSaleCreatedByDtoImpl> get copyWith =>
      __$$PosSaleCreatedByDtoImplCopyWithImpl<_$PosSaleCreatedByDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PosSaleCreatedByDtoImplToJson(
      this,
    );
  }
}

abstract class _PosSaleCreatedByDto implements PosSaleCreatedByDto {
  const factory _PosSaleCreatedByDto(
      {required final int id,
      required final String username}) = _$PosSaleCreatedByDtoImpl;

  factory _PosSaleCreatedByDto.fromJson(Map<String, dynamic> json) =
      _$PosSaleCreatedByDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get username;

  /// Create a copy of PosSaleCreatedByDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PosSaleCreatedByDtoImplCopyWith<_$PosSaleCreatedByDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PosSaleDto _$PosSaleDtoFromJson(Map<String, dynamic> json) {
  return _PosSaleDto.fromJson(json);
}

/// @nodoc
mixin _$PosSaleDto {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'sale_code')
  String get saleCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'client_id')
  int get clientId => throw _privateConstructorUsedError;
  @JsonKey(name: 'branch_id')
  int? get branchId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_id')
  int? get createdById => throw _privateConstructorUsedError;
  double get subtotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_type')
  String get discountType => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_value')
  double get discountValue => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_method')
  String get paymentMethod => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  PosSaleClientDto get client => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by')
  PosSaleCreatedByDto? get createdBy => throw _privateConstructorUsedError;

  /// Serializes this PosSaleDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PosSaleDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PosSaleDtoCopyWith<PosSaleDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PosSaleDtoCopyWith<$Res> {
  factory $PosSaleDtoCopyWith(
          PosSaleDto value, $Res Function(PosSaleDto) then) =
      _$PosSaleDtoCopyWithImpl<$Res, PosSaleDto>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'sale_code') String saleCode,
      @JsonKey(name: 'client_id') int clientId,
      @JsonKey(name: 'branch_id') int? branchId,
      @JsonKey(name: 'created_by_id') int? createdById,
      double subtotal,
      @JsonKey(name: 'discount_type') String discountType,
      @JsonKey(name: 'discount_value') double discountValue,
      double total,
      @JsonKey(name: 'payment_method') String paymentMethod,
      String status,
      String? notes,
      @JsonKey(name: 'created_at') DateTime createdAt,
      PosSaleClientDto client,
      @JsonKey(name: 'created_by') PosSaleCreatedByDto? createdBy});

  $PosSaleClientDtoCopyWith<$Res> get client;
  $PosSaleCreatedByDtoCopyWith<$Res>? get createdBy;
}

/// @nodoc
class _$PosSaleDtoCopyWithImpl<$Res, $Val extends PosSaleDto>
    implements $PosSaleDtoCopyWith<$Res> {
  _$PosSaleDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PosSaleDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? saleCode = null,
    Object? clientId = null,
    Object? branchId = freezed,
    Object? createdById = freezed,
    Object? subtotal = null,
    Object? discountType = null,
    Object? discountValue = null,
    Object? total = null,
    Object? paymentMethod = null,
    Object? status = null,
    Object? notes = freezed,
    Object? createdAt = null,
    Object? client = null,
    Object? createdBy = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      saleCode: null == saleCode
          ? _value.saleCode
          : saleCode // ignore: cast_nullable_to_non_nullable
              as String,
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as int,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdById: freezed == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int?,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      discountType: null == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as String,
      discountValue: null == discountValue
          ? _value.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      client: null == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as PosSaleClientDto,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as PosSaleCreatedByDto?,
    ) as $Val);
  }

  /// Create a copy of PosSaleDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PosSaleClientDtoCopyWith<$Res> get client {
    return $PosSaleClientDtoCopyWith<$Res>(_value.client, (value) {
      return _then(_value.copyWith(client: value) as $Val);
    });
  }

  /// Create a copy of PosSaleDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PosSaleCreatedByDtoCopyWith<$Res>? get createdBy {
    if (_value.createdBy == null) {
      return null;
    }

    return $PosSaleCreatedByDtoCopyWith<$Res>(_value.createdBy!, (value) {
      return _then(_value.copyWith(createdBy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PosSaleDtoImplCopyWith<$Res>
    implements $PosSaleDtoCopyWith<$Res> {
  factory _$$PosSaleDtoImplCopyWith(
          _$PosSaleDtoImpl value, $Res Function(_$PosSaleDtoImpl) then) =
      __$$PosSaleDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'sale_code') String saleCode,
      @JsonKey(name: 'client_id') int clientId,
      @JsonKey(name: 'branch_id') int? branchId,
      @JsonKey(name: 'created_by_id') int? createdById,
      double subtotal,
      @JsonKey(name: 'discount_type') String discountType,
      @JsonKey(name: 'discount_value') double discountValue,
      double total,
      @JsonKey(name: 'payment_method') String paymentMethod,
      String status,
      String? notes,
      @JsonKey(name: 'created_at') DateTime createdAt,
      PosSaleClientDto client,
      @JsonKey(name: 'created_by') PosSaleCreatedByDto? createdBy});

  @override
  $PosSaleClientDtoCopyWith<$Res> get client;
  @override
  $PosSaleCreatedByDtoCopyWith<$Res>? get createdBy;
}

/// @nodoc
class __$$PosSaleDtoImplCopyWithImpl<$Res>
    extends _$PosSaleDtoCopyWithImpl<$Res, _$PosSaleDtoImpl>
    implements _$$PosSaleDtoImplCopyWith<$Res> {
  __$$PosSaleDtoImplCopyWithImpl(
      _$PosSaleDtoImpl _value, $Res Function(_$PosSaleDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PosSaleDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? saleCode = null,
    Object? clientId = null,
    Object? branchId = freezed,
    Object? createdById = freezed,
    Object? subtotal = null,
    Object? discountType = null,
    Object? discountValue = null,
    Object? total = null,
    Object? paymentMethod = null,
    Object? status = null,
    Object? notes = freezed,
    Object? createdAt = null,
    Object? client = null,
    Object? createdBy = freezed,
  }) {
    return _then(_$PosSaleDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      saleCode: null == saleCode
          ? _value.saleCode
          : saleCode // ignore: cast_nullable_to_non_nullable
              as String,
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as int,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdById: freezed == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int?,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      discountType: null == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as String,
      discountValue: null == discountValue
          ? _value.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      client: null == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as PosSaleClientDto,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as PosSaleCreatedByDto?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PosSaleDtoImpl implements _PosSaleDto {
  const _$PosSaleDtoImpl(
      {required this.id,
      @JsonKey(name: 'sale_code') required this.saleCode,
      @JsonKey(name: 'client_id') required this.clientId,
      @JsonKey(name: 'branch_id') this.branchId,
      @JsonKey(name: 'created_by_id') this.createdById,
      this.subtotal = 0.0,
      @JsonKey(name: 'discount_type') this.discountType = 'amount',
      @JsonKey(name: 'discount_value') this.discountValue = 0.0,
      this.total = 0.0,
      @JsonKey(name: 'payment_method') this.paymentMethod = 'cash',
      this.status = 'paid',
      this.notes,
      @JsonKey(name: 'created_at') required this.createdAt,
      required this.client,
      @JsonKey(name: 'created_by') this.createdBy});

  factory _$PosSaleDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PosSaleDtoImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'sale_code')
  final String saleCode;
  @override
  @JsonKey(name: 'client_id')
  final int clientId;
  @override
  @JsonKey(name: 'branch_id')
  final int? branchId;
  @override
  @JsonKey(name: 'created_by_id')
  final int? createdById;
  @override
  @JsonKey()
  final double subtotal;
  @override
  @JsonKey(name: 'discount_type')
  final String discountType;
  @override
  @JsonKey(name: 'discount_value')
  final double discountValue;
  @override
  @JsonKey()
  final double total;
  @override
  @JsonKey(name: 'payment_method')
  final String paymentMethod;
  @override
  @JsonKey()
  final String status;
  @override
  final String? notes;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  final PosSaleClientDto client;
  @override
  @JsonKey(name: 'created_by')
  final PosSaleCreatedByDto? createdBy;

  @override
  String toString() {
    return 'PosSaleDto(id: $id, saleCode: $saleCode, clientId: $clientId, branchId: $branchId, createdById: $createdById, subtotal: $subtotal, discountType: $discountType, discountValue: $discountValue, total: $total, paymentMethod: $paymentMethod, status: $status, notes: $notes, createdAt: $createdAt, client: $client, createdBy: $createdBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PosSaleDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.saleCode, saleCode) ||
                other.saleCode == saleCode) &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.branchId, branchId) ||
                other.branchId == branchId) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.discountType, discountType) ||
                other.discountType == discountType) &&
            (identical(other.discountValue, discountValue) ||
                other.discountValue == discountValue) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.client, client) || other.client == client) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      saleCode,
      clientId,
      branchId,
      createdById,
      subtotal,
      discountType,
      discountValue,
      total,
      paymentMethod,
      status,
      notes,
      createdAt,
      client,
      createdBy);

  /// Create a copy of PosSaleDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PosSaleDtoImplCopyWith<_$PosSaleDtoImpl> get copyWith =>
      __$$PosSaleDtoImplCopyWithImpl<_$PosSaleDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PosSaleDtoImplToJson(
      this,
    );
  }
}

abstract class _PosSaleDto implements PosSaleDto {
  const factory _PosSaleDto(
          {required final int id,
          @JsonKey(name: 'sale_code') required final String saleCode,
          @JsonKey(name: 'client_id') required final int clientId,
          @JsonKey(name: 'branch_id') final int? branchId,
          @JsonKey(name: 'created_by_id') final int? createdById,
          final double subtotal,
          @JsonKey(name: 'discount_type') final String discountType,
          @JsonKey(name: 'discount_value') final double discountValue,
          final double total,
          @JsonKey(name: 'payment_method') final String paymentMethod,
          final String status,
          final String? notes,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          required final PosSaleClientDto client,
          @JsonKey(name: 'created_by') final PosSaleCreatedByDto? createdBy}) =
      _$PosSaleDtoImpl;

  factory _PosSaleDto.fromJson(Map<String, dynamic> json) =
      _$PosSaleDtoImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'sale_code')
  String get saleCode;
  @override
  @JsonKey(name: 'client_id')
  int get clientId;
  @override
  @JsonKey(name: 'branch_id')
  int? get branchId;
  @override
  @JsonKey(name: 'created_by_id')
  int? get createdById;
  @override
  double get subtotal;
  @override
  @JsonKey(name: 'discount_type')
  String get discountType;
  @override
  @JsonKey(name: 'discount_value')
  double get discountValue;
  @override
  double get total;
  @override
  @JsonKey(name: 'payment_method')
  String get paymentMethod;
  @override
  String get status;
  @override
  String? get notes;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  PosSaleClientDto get client;
  @override
  @JsonKey(name: 'created_by')
  PosSaleCreatedByDto? get createdBy;

  /// Create a copy of PosSaleDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PosSaleDtoImplCopyWith<_$PosSaleDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PosSaleItemCreateDto _$PosSaleItemCreateDtoFromJson(Map<String, dynamic> json) {
  return _PosSaleItemCreateDto.fromJson(json);
}

/// @nodoc
mixin _$PosSaleItemCreateDto {
  @JsonKey(name: 'service_id')
  int get serviceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'professional_id')
  int? get professionalId => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_ia')
  bool get isIa => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  DateTime get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  DateTime get endTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'branch_id')
  int? get branchId => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;

  /// Serializes this PosSaleItemCreateDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PosSaleItemCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PosSaleItemCreateDtoCopyWith<PosSaleItemCreateDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PosSaleItemCreateDtoCopyWith<$Res> {
  factory $PosSaleItemCreateDtoCopyWith(PosSaleItemCreateDto value,
          $Res Function(PosSaleItemCreateDto) then) =
      _$PosSaleItemCreateDtoCopyWithImpl<$Res, PosSaleItemCreateDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'service_id') int serviceId,
      @JsonKey(name: 'professional_id') int? professionalId,
      @JsonKey(name: 'is_ia') bool isIa,
      @JsonKey(name: 'start_time') DateTime startTime,
      @JsonKey(name: 'end_time') DateTime endTime,
      @JsonKey(name: 'branch_id') int? branchId,
      double? price,
      int? quantity});
}

/// @nodoc
class _$PosSaleItemCreateDtoCopyWithImpl<$Res,
        $Val extends PosSaleItemCreateDto>
    implements $PosSaleItemCreateDtoCopyWith<$Res> {
  _$PosSaleItemCreateDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PosSaleItemCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceId = null,
    Object? professionalId = freezed,
    Object? isIa = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? branchId = freezed,
    Object? price = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_value.copyWith(
      serviceId: null == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as int,
      professionalId: freezed == professionalId
          ? _value.professionalId
          : professionalId // ignore: cast_nullable_to_non_nullable
              as int?,
      isIa: null == isIa
          ? _value.isIa
          : isIa // ignore: cast_nullable_to_non_nullable
              as bool,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PosSaleItemCreateDtoImplCopyWith<$Res>
    implements $PosSaleItemCreateDtoCopyWith<$Res> {
  factory _$$PosSaleItemCreateDtoImplCopyWith(_$PosSaleItemCreateDtoImpl value,
          $Res Function(_$PosSaleItemCreateDtoImpl) then) =
      __$$PosSaleItemCreateDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'service_id') int serviceId,
      @JsonKey(name: 'professional_id') int? professionalId,
      @JsonKey(name: 'is_ia') bool isIa,
      @JsonKey(name: 'start_time') DateTime startTime,
      @JsonKey(name: 'end_time') DateTime endTime,
      @JsonKey(name: 'branch_id') int? branchId,
      double? price,
      int? quantity});
}

/// @nodoc
class __$$PosSaleItemCreateDtoImplCopyWithImpl<$Res>
    extends _$PosSaleItemCreateDtoCopyWithImpl<$Res, _$PosSaleItemCreateDtoImpl>
    implements _$$PosSaleItemCreateDtoImplCopyWith<$Res> {
  __$$PosSaleItemCreateDtoImplCopyWithImpl(_$PosSaleItemCreateDtoImpl _value,
      $Res Function(_$PosSaleItemCreateDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PosSaleItemCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceId = null,
    Object? professionalId = freezed,
    Object? isIa = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? branchId = freezed,
    Object? price = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_$PosSaleItemCreateDtoImpl(
      serviceId: null == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as int,
      professionalId: freezed == professionalId
          ? _value.professionalId
          : professionalId // ignore: cast_nullable_to_non_nullable
              as int?,
      isIa: null == isIa
          ? _value.isIa
          : isIa // ignore: cast_nullable_to_non_nullable
              as bool,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PosSaleItemCreateDtoImpl implements _PosSaleItemCreateDto {
  const _$PosSaleItemCreateDtoImpl(
      {@JsonKey(name: 'service_id') required this.serviceId,
      @JsonKey(name: 'professional_id') this.professionalId,
      @JsonKey(name: 'is_ia') this.isIa = false,
      @JsonKey(name: 'start_time') required this.startTime,
      @JsonKey(name: 'end_time') required this.endTime,
      @JsonKey(name: 'branch_id') this.branchId,
      this.price,
      this.quantity});

  factory _$PosSaleItemCreateDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PosSaleItemCreateDtoImplFromJson(json);

  @override
  @JsonKey(name: 'service_id')
  final int serviceId;
  @override
  @JsonKey(name: 'professional_id')
  final int? professionalId;
  @override
  @JsonKey(name: 'is_ia')
  final bool isIa;
  @override
  @JsonKey(name: 'start_time')
  final DateTime startTime;
  @override
  @JsonKey(name: 'end_time')
  final DateTime endTime;
  @override
  @JsonKey(name: 'branch_id')
  final int? branchId;
  @override
  final double? price;
  @override
  final int? quantity;

  @override
  String toString() {
    return 'PosSaleItemCreateDto(serviceId: $serviceId, professionalId: $professionalId, isIa: $isIa, startTime: $startTime, endTime: $endTime, branchId: $branchId, price: $price, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PosSaleItemCreateDtoImpl &&
            (identical(other.serviceId, serviceId) ||
                other.serviceId == serviceId) &&
            (identical(other.professionalId, professionalId) ||
                other.professionalId == professionalId) &&
            (identical(other.isIa, isIa) || other.isIa == isIa) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.branchId, branchId) ||
                other.branchId == branchId) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, serviceId, professionalId, isIa,
      startTime, endTime, branchId, price, quantity);

  /// Create a copy of PosSaleItemCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PosSaleItemCreateDtoImplCopyWith<_$PosSaleItemCreateDtoImpl>
      get copyWith =>
          __$$PosSaleItemCreateDtoImplCopyWithImpl<_$PosSaleItemCreateDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PosSaleItemCreateDtoImplToJson(
      this,
    );
  }
}

abstract class _PosSaleItemCreateDto implements PosSaleItemCreateDto {
  const factory _PosSaleItemCreateDto(
      {@JsonKey(name: 'service_id') required final int serviceId,
      @JsonKey(name: 'professional_id') final int? professionalId,
      @JsonKey(name: 'is_ia') final bool isIa,
      @JsonKey(name: 'start_time') required final DateTime startTime,
      @JsonKey(name: 'end_time') required final DateTime endTime,
      @JsonKey(name: 'branch_id') final int? branchId,
      final double? price,
      final int? quantity}) = _$PosSaleItemCreateDtoImpl;

  factory _PosSaleItemCreateDto.fromJson(Map<String, dynamic> json) =
      _$PosSaleItemCreateDtoImpl.fromJson;

  @override
  @JsonKey(name: 'service_id')
  int get serviceId;
  @override
  @JsonKey(name: 'professional_id')
  int? get professionalId;
  @override
  @JsonKey(name: 'is_ia')
  bool get isIa;
  @override
  @JsonKey(name: 'start_time')
  DateTime get startTime;
  @override
  @JsonKey(name: 'end_time')
  DateTime get endTime;
  @override
  @JsonKey(name: 'branch_id')
  int? get branchId;
  @override
  double? get price;
  @override
  int? get quantity;

  /// Create a copy of PosSaleItemCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PosSaleItemCreateDtoImplCopyWith<_$PosSaleItemCreateDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PosSaleCreateDto _$PosSaleCreateDtoFromJson(Map<String, dynamic> json) {
  return _PosSaleCreateDto.fromJson(json);
}

/// @nodoc
mixin _$PosSaleCreateDto {
  @JsonKey(name: 'client_id')
  int get clientId => throw _privateConstructorUsedError;
  @JsonKey(name: 'branch_id')
  int? get branchId => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_method')
  String get paymentMethod => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_type')
  String get discountType => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_value')
  double get discountValue => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  List<PosSaleItemCreateDto> get items => throw _privateConstructorUsedError;
  @JsonKey(name: 'link_appointment_id')
  int? get linkAppointmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'sale_without_appointments')
  bool get saleWithoutAppointments => throw _privateConstructorUsedError;

  /// Serializes this PosSaleCreateDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PosSaleCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PosSaleCreateDtoCopyWith<PosSaleCreateDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PosSaleCreateDtoCopyWith<$Res> {
  factory $PosSaleCreateDtoCopyWith(
          PosSaleCreateDto value, $Res Function(PosSaleCreateDto) then) =
      _$PosSaleCreateDtoCopyWithImpl<$Res, PosSaleCreateDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'client_id') int clientId,
      @JsonKey(name: 'branch_id') int? branchId,
      @JsonKey(name: 'payment_method') String paymentMethod,
      @JsonKey(name: 'discount_type') String discountType,
      @JsonKey(name: 'discount_value') double discountValue,
      String? notes,
      List<PosSaleItemCreateDto> items,
      @JsonKey(name: 'link_appointment_id') int? linkAppointmentId,
      @JsonKey(name: 'sale_without_appointments')
      bool saleWithoutAppointments});
}

/// @nodoc
class _$PosSaleCreateDtoCopyWithImpl<$Res, $Val extends PosSaleCreateDto>
    implements $PosSaleCreateDtoCopyWith<$Res> {
  _$PosSaleCreateDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PosSaleCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientId = null,
    Object? branchId = freezed,
    Object? paymentMethod = null,
    Object? discountType = null,
    Object? discountValue = null,
    Object? notes = freezed,
    Object? items = null,
    Object? linkAppointmentId = freezed,
    Object? saleWithoutAppointments = null,
  }) {
    return _then(_value.copyWith(
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as int,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      discountType: null == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as String,
      discountValue: null == discountValue
          ? _value.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as double,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PosSaleItemCreateDto>,
      linkAppointmentId: freezed == linkAppointmentId
          ? _value.linkAppointmentId
          : linkAppointmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      saleWithoutAppointments: null == saleWithoutAppointments
          ? _value.saleWithoutAppointments
          : saleWithoutAppointments // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PosSaleCreateDtoImplCopyWith<$Res>
    implements $PosSaleCreateDtoCopyWith<$Res> {
  factory _$$PosSaleCreateDtoImplCopyWith(_$PosSaleCreateDtoImpl value,
          $Res Function(_$PosSaleCreateDtoImpl) then) =
      __$$PosSaleCreateDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'client_id') int clientId,
      @JsonKey(name: 'branch_id') int? branchId,
      @JsonKey(name: 'payment_method') String paymentMethod,
      @JsonKey(name: 'discount_type') String discountType,
      @JsonKey(name: 'discount_value') double discountValue,
      String? notes,
      List<PosSaleItemCreateDto> items,
      @JsonKey(name: 'link_appointment_id') int? linkAppointmentId,
      @JsonKey(name: 'sale_without_appointments')
      bool saleWithoutAppointments});
}

/// @nodoc
class __$$PosSaleCreateDtoImplCopyWithImpl<$Res>
    extends _$PosSaleCreateDtoCopyWithImpl<$Res, _$PosSaleCreateDtoImpl>
    implements _$$PosSaleCreateDtoImplCopyWith<$Res> {
  __$$PosSaleCreateDtoImplCopyWithImpl(_$PosSaleCreateDtoImpl _value,
      $Res Function(_$PosSaleCreateDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PosSaleCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientId = null,
    Object? branchId = freezed,
    Object? paymentMethod = null,
    Object? discountType = null,
    Object? discountValue = null,
    Object? notes = freezed,
    Object? items = null,
    Object? linkAppointmentId = freezed,
    Object? saleWithoutAppointments = null,
  }) {
    return _then(_$PosSaleCreateDtoImpl(
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as int,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      discountType: null == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as String,
      discountValue: null == discountValue
          ? _value.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as double,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PosSaleItemCreateDto>,
      linkAppointmentId: freezed == linkAppointmentId
          ? _value.linkAppointmentId
          : linkAppointmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      saleWithoutAppointments: null == saleWithoutAppointments
          ? _value.saleWithoutAppointments
          : saleWithoutAppointments // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PosSaleCreateDtoImpl implements _PosSaleCreateDto {
  const _$PosSaleCreateDtoImpl(
      {@JsonKey(name: 'client_id') required this.clientId,
      @JsonKey(name: 'branch_id') this.branchId,
      @JsonKey(name: 'payment_method') this.paymentMethod = 'cash',
      @JsonKey(name: 'discount_type') this.discountType = 'amount',
      @JsonKey(name: 'discount_value') this.discountValue = 0.0,
      this.notes,
      required final List<PosSaleItemCreateDto> items,
      @JsonKey(name: 'link_appointment_id') this.linkAppointmentId,
      @JsonKey(name: 'sale_without_appointments')
      this.saleWithoutAppointments = false})
      : _items = items;

  factory _$PosSaleCreateDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PosSaleCreateDtoImplFromJson(json);

  @override
  @JsonKey(name: 'client_id')
  final int clientId;
  @override
  @JsonKey(name: 'branch_id')
  final int? branchId;
  @override
  @JsonKey(name: 'payment_method')
  final String paymentMethod;
  @override
  @JsonKey(name: 'discount_type')
  final String discountType;
  @override
  @JsonKey(name: 'discount_value')
  final double discountValue;
  @override
  final String? notes;
  final List<PosSaleItemCreateDto> _items;
  @override
  List<PosSaleItemCreateDto> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey(name: 'link_appointment_id')
  final int? linkAppointmentId;
  @override
  @JsonKey(name: 'sale_without_appointments')
  final bool saleWithoutAppointments;

  @override
  String toString() {
    return 'PosSaleCreateDto(clientId: $clientId, branchId: $branchId, paymentMethod: $paymentMethod, discountType: $discountType, discountValue: $discountValue, notes: $notes, items: $items, linkAppointmentId: $linkAppointmentId, saleWithoutAppointments: $saleWithoutAppointments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PosSaleCreateDtoImpl &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.branchId, branchId) ||
                other.branchId == branchId) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.discountType, discountType) ||
                other.discountType == discountType) &&
            (identical(other.discountValue, discountValue) ||
                other.discountValue == discountValue) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.linkAppointmentId, linkAppointmentId) ||
                other.linkAppointmentId == linkAppointmentId) &&
            (identical(
                    other.saleWithoutAppointments, saleWithoutAppointments) ||
                other.saleWithoutAppointments == saleWithoutAppointments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      clientId,
      branchId,
      paymentMethod,
      discountType,
      discountValue,
      notes,
      const DeepCollectionEquality().hash(_items),
      linkAppointmentId,
      saleWithoutAppointments);

  /// Create a copy of PosSaleCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PosSaleCreateDtoImplCopyWith<_$PosSaleCreateDtoImpl> get copyWith =>
      __$$PosSaleCreateDtoImplCopyWithImpl<_$PosSaleCreateDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PosSaleCreateDtoImplToJson(
      this,
    );
  }
}

abstract class _PosSaleCreateDto implements PosSaleCreateDto {
  const factory _PosSaleCreateDto(
      {@JsonKey(name: 'client_id') required final int clientId,
      @JsonKey(name: 'branch_id') final int? branchId,
      @JsonKey(name: 'payment_method') final String paymentMethod,
      @JsonKey(name: 'discount_type') final String discountType,
      @JsonKey(name: 'discount_value') final double discountValue,
      final String? notes,
      required final List<PosSaleItemCreateDto> items,
      @JsonKey(name: 'link_appointment_id') final int? linkAppointmentId,
      @JsonKey(name: 'sale_without_appointments')
      final bool saleWithoutAppointments}) = _$PosSaleCreateDtoImpl;

  factory _PosSaleCreateDto.fromJson(Map<String, dynamic> json) =
      _$PosSaleCreateDtoImpl.fromJson;

  @override
  @JsonKey(name: 'client_id')
  int get clientId;
  @override
  @JsonKey(name: 'branch_id')
  int? get branchId;
  @override
  @JsonKey(name: 'payment_method')
  String get paymentMethod;
  @override
  @JsonKey(name: 'discount_type')
  String get discountType;
  @override
  @JsonKey(name: 'discount_value')
  double get discountValue;
  @override
  String? get notes;
  @override
  List<PosSaleItemCreateDto> get items;
  @override
  @JsonKey(name: 'link_appointment_id')
  int? get linkAppointmentId;
  @override
  @JsonKey(name: 'sale_without_appointments')
  bool get saleWithoutAppointments;

  /// Create a copy of PosSaleCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PosSaleCreateDtoImplCopyWith<_$PosSaleCreateDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

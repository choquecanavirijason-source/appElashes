// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentClientDto _$PaymentClientDtoFromJson(Map<String, dynamic> json) {
  return _PaymentClientDto.fromJson(json);
}

/// @nodoc
mixin _$PaymentClientDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;

  /// Serializes this PaymentClientDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentClientDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentClientDtoCopyWith<PaymentClientDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentClientDtoCopyWith<$Res> {
  factory $PaymentClientDtoCopyWith(
          PaymentClientDto value, $Res Function(PaymentClientDto) then) =
      _$PaymentClientDtoCopyWithImpl<$Res, PaymentClientDto>;
  @useResult
  $Res call(
      {int id, String name, @JsonKey(name: 'last_name') String? lastName});
}

/// @nodoc
class _$PaymentClientDtoCopyWithImpl<$Res, $Val extends PaymentClientDto>
    implements $PaymentClientDtoCopyWith<$Res> {
  _$PaymentClientDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentClientDto
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
abstract class _$$PaymentClientDtoImplCopyWith<$Res>
    implements $PaymentClientDtoCopyWith<$Res> {
  factory _$$PaymentClientDtoImplCopyWith(_$PaymentClientDtoImpl value,
          $Res Function(_$PaymentClientDtoImpl) then) =
      __$$PaymentClientDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, String name, @JsonKey(name: 'last_name') String? lastName});
}

/// @nodoc
class __$$PaymentClientDtoImplCopyWithImpl<$Res>
    extends _$PaymentClientDtoCopyWithImpl<$Res, _$PaymentClientDtoImpl>
    implements _$$PaymentClientDtoImplCopyWith<$Res> {
  __$$PaymentClientDtoImplCopyWithImpl(_$PaymentClientDtoImpl _value,
      $Res Function(_$PaymentClientDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentClientDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? lastName = freezed,
  }) {
    return _then(_$PaymentClientDtoImpl(
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
class _$PaymentClientDtoImpl implements _PaymentClientDto {
  const _$PaymentClientDtoImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'last_name') this.lastName});

  factory _$PaymentClientDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentClientDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: 'last_name')
  final String? lastName;

  @override
  String toString() {
    return 'PaymentClientDto(id: $id, name: $name, lastName: $lastName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentClientDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, lastName);

  /// Create a copy of PaymentClientDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentClientDtoImplCopyWith<_$PaymentClientDtoImpl> get copyWith =>
      __$$PaymentClientDtoImplCopyWithImpl<_$PaymentClientDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentClientDtoImplToJson(
      this,
    );
  }
}

abstract class _PaymentClientDto implements PaymentClientDto {
  const factory _PaymentClientDto(
          {required final int id,
          required final String name,
          @JsonKey(name: 'last_name') final String? lastName}) =
      _$PaymentClientDtoImpl;

  factory _PaymentClientDto.fromJson(Map<String, dynamic> json) =
      _$PaymentClientDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'last_name')
  String? get lastName;

  /// Create a copy of PaymentClientDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentClientDtoImplCopyWith<_$PaymentClientDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentDto _$PaymentDtoFromJson(Map<String, dynamic> json) {
  return _PaymentDto.fromJson(json);
}

/// @nodoc
mixin _$PaymentDto {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'client_id')
  int get clientId => throw _privateConstructorUsedError;
  @JsonKey(name: 'branch_id')
  int? get branchId => throw _privateConstructorUsedError;
  @JsonKey(name: 'appointment_id')
  int? get appointmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'sale_id')
  int? get saleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'registered_by_id')
  int? get registeredById => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get method => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get reference => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'paid_at')
  DateTime get paidAt => throw _privateConstructorUsedError;
  PaymentClientDto get client => throw _privateConstructorUsedError;

  /// Serializes this PaymentDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentDtoCopyWith<PaymentDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentDtoCopyWith<$Res> {
  factory $PaymentDtoCopyWith(
          PaymentDto value, $Res Function(PaymentDto) then) =
      _$PaymentDtoCopyWithImpl<$Res, PaymentDto>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'client_id') int clientId,
      @JsonKey(name: 'branch_id') int? branchId,
      @JsonKey(name: 'appointment_id') int? appointmentId,
      @JsonKey(name: 'sale_id') int? saleId,
      @JsonKey(name: 'registered_by_id') int? registeredById,
      double amount,
      String method,
      String status,
      String? reference,
      String? notes,
      @JsonKey(name: 'paid_at') DateTime paidAt,
      PaymentClientDto client});

  $PaymentClientDtoCopyWith<$Res> get client;
}

/// @nodoc
class _$PaymentDtoCopyWithImpl<$Res, $Val extends PaymentDto>
    implements $PaymentDtoCopyWith<$Res> {
  _$PaymentDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? clientId = null,
    Object? branchId = freezed,
    Object? appointmentId = freezed,
    Object? saleId = freezed,
    Object? registeredById = freezed,
    Object? amount = null,
    Object? method = null,
    Object? status = null,
    Object? reference = freezed,
    Object? notes = freezed,
    Object? paidAt = null,
    Object? client = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as int,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
      appointmentId: freezed == appointmentId
          ? _value.appointmentId
          : appointmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      saleId: freezed == saleId
          ? _value.saleId
          : saleId // ignore: cast_nullable_to_non_nullable
              as int?,
      registeredById: freezed == registeredById
          ? _value.registeredById
          : registeredById // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      paidAt: null == paidAt
          ? _value.paidAt
          : paidAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      client: null == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as PaymentClientDto,
    ) as $Val);
  }

  /// Create a copy of PaymentDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentClientDtoCopyWith<$Res> get client {
    return $PaymentClientDtoCopyWith<$Res>(_value.client, (value) {
      return _then(_value.copyWith(client: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaymentDtoImplCopyWith<$Res>
    implements $PaymentDtoCopyWith<$Res> {
  factory _$$PaymentDtoImplCopyWith(
          _$PaymentDtoImpl value, $Res Function(_$PaymentDtoImpl) then) =
      __$$PaymentDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'client_id') int clientId,
      @JsonKey(name: 'branch_id') int? branchId,
      @JsonKey(name: 'appointment_id') int? appointmentId,
      @JsonKey(name: 'sale_id') int? saleId,
      @JsonKey(name: 'registered_by_id') int? registeredById,
      double amount,
      String method,
      String status,
      String? reference,
      String? notes,
      @JsonKey(name: 'paid_at') DateTime paidAt,
      PaymentClientDto client});

  @override
  $PaymentClientDtoCopyWith<$Res> get client;
}

/// @nodoc
class __$$PaymentDtoImplCopyWithImpl<$Res>
    extends _$PaymentDtoCopyWithImpl<$Res, _$PaymentDtoImpl>
    implements _$$PaymentDtoImplCopyWith<$Res> {
  __$$PaymentDtoImplCopyWithImpl(
      _$PaymentDtoImpl _value, $Res Function(_$PaymentDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? clientId = null,
    Object? branchId = freezed,
    Object? appointmentId = freezed,
    Object? saleId = freezed,
    Object? registeredById = freezed,
    Object? amount = null,
    Object? method = null,
    Object? status = null,
    Object? reference = freezed,
    Object? notes = freezed,
    Object? paidAt = null,
    Object? client = null,
  }) {
    return _then(_$PaymentDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as int,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
      appointmentId: freezed == appointmentId
          ? _value.appointmentId
          : appointmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      saleId: freezed == saleId
          ? _value.saleId
          : saleId // ignore: cast_nullable_to_non_nullable
              as int?,
      registeredById: freezed == registeredById
          ? _value.registeredById
          : registeredById // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      paidAt: null == paidAt
          ? _value.paidAt
          : paidAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      client: null == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as PaymentClientDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentDtoImpl implements _PaymentDto {
  const _$PaymentDtoImpl(
      {required this.id,
      @JsonKey(name: 'client_id') required this.clientId,
      @JsonKey(name: 'branch_id') this.branchId,
      @JsonKey(name: 'appointment_id') this.appointmentId,
      @JsonKey(name: 'sale_id') this.saleId,
      @JsonKey(name: 'registered_by_id') this.registeredById,
      required this.amount,
      required this.method,
      this.status = 'paid',
      this.reference,
      this.notes,
      @JsonKey(name: 'paid_at') required this.paidAt,
      required this.client});

  factory _$PaymentDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentDtoImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'client_id')
  final int clientId;
  @override
  @JsonKey(name: 'branch_id')
  final int? branchId;
  @override
  @JsonKey(name: 'appointment_id')
  final int? appointmentId;
  @override
  @JsonKey(name: 'sale_id')
  final int? saleId;
  @override
  @JsonKey(name: 'registered_by_id')
  final int? registeredById;
  @override
  final double amount;
  @override
  final String method;
  @override
  @JsonKey()
  final String status;
  @override
  final String? reference;
  @override
  final String? notes;
  @override
  @JsonKey(name: 'paid_at')
  final DateTime paidAt;
  @override
  final PaymentClientDto client;

  @override
  String toString() {
    return 'PaymentDto(id: $id, clientId: $clientId, branchId: $branchId, appointmentId: $appointmentId, saleId: $saleId, registeredById: $registeredById, amount: $amount, method: $method, status: $status, reference: $reference, notes: $notes, paidAt: $paidAt, client: $client)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.branchId, branchId) ||
                other.branchId == branchId) &&
            (identical(other.appointmentId, appointmentId) ||
                other.appointmentId == appointmentId) &&
            (identical(other.saleId, saleId) || other.saleId == saleId) &&
            (identical(other.registeredById, registeredById) ||
                other.registeredById == registeredById) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.paidAt, paidAt) || other.paidAt == paidAt) &&
            (identical(other.client, client) || other.client == client));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      clientId,
      branchId,
      appointmentId,
      saleId,
      registeredById,
      amount,
      method,
      status,
      reference,
      notes,
      paidAt,
      client);

  /// Create a copy of PaymentDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentDtoImplCopyWith<_$PaymentDtoImpl> get copyWith =>
      __$$PaymentDtoImplCopyWithImpl<_$PaymentDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentDtoImplToJson(
      this,
    );
  }
}

abstract class _PaymentDto implements PaymentDto {
  const factory _PaymentDto(
      {required final int id,
      @JsonKey(name: 'client_id') required final int clientId,
      @JsonKey(name: 'branch_id') final int? branchId,
      @JsonKey(name: 'appointment_id') final int? appointmentId,
      @JsonKey(name: 'sale_id') final int? saleId,
      @JsonKey(name: 'registered_by_id') final int? registeredById,
      required final double amount,
      required final String method,
      final String status,
      final String? reference,
      final String? notes,
      @JsonKey(name: 'paid_at') required final DateTime paidAt,
      required final PaymentClientDto client}) = _$PaymentDtoImpl;

  factory _PaymentDto.fromJson(Map<String, dynamic> json) =
      _$PaymentDtoImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'client_id')
  int get clientId;
  @override
  @JsonKey(name: 'branch_id')
  int? get branchId;
  @override
  @JsonKey(name: 'appointment_id')
  int? get appointmentId;
  @override
  @JsonKey(name: 'sale_id')
  int? get saleId;
  @override
  @JsonKey(name: 'registered_by_id')
  int? get registeredById;
  @override
  double get amount;
  @override
  String get method;
  @override
  String get status;
  @override
  String? get reference;
  @override
  String? get notes;
  @override
  @JsonKey(name: 'paid_at')
  DateTime get paidAt;
  @override
  PaymentClientDto get client;

  /// Create a copy of PaymentDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentDtoImplCopyWith<_$PaymentDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentCreateDto _$PaymentCreateDtoFromJson(Map<String, dynamic> json) {
  return _PaymentCreateDto.fromJson(json);
}

/// @nodoc
mixin _$PaymentCreateDto {
  @JsonKey(name: 'client_id')
  int get clientId => throw _privateConstructorUsedError;
  @JsonKey(name: 'branch_id')
  int? get branchId => throw _privateConstructorUsedError;
  @JsonKey(name: 'appointment_id')
  int? get appointmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'sale_id')
  int? get saleId => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get method => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get reference => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this PaymentCreateDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentCreateDtoCopyWith<PaymentCreateDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentCreateDtoCopyWith<$Res> {
  factory $PaymentCreateDtoCopyWith(
          PaymentCreateDto value, $Res Function(PaymentCreateDto) then) =
      _$PaymentCreateDtoCopyWithImpl<$Res, PaymentCreateDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'client_id') int clientId,
      @JsonKey(name: 'branch_id') int? branchId,
      @JsonKey(name: 'appointment_id') int? appointmentId,
      @JsonKey(name: 'sale_id') int? saleId,
      double amount,
      String method,
      String status,
      String? reference,
      String? notes});
}

/// @nodoc
class _$PaymentCreateDtoCopyWithImpl<$Res, $Val extends PaymentCreateDto>
    implements $PaymentCreateDtoCopyWith<$Res> {
  _$PaymentCreateDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientId = null,
    Object? branchId = freezed,
    Object? appointmentId = freezed,
    Object? saleId = freezed,
    Object? amount = null,
    Object? method = null,
    Object? status = null,
    Object? reference = freezed,
    Object? notes = freezed,
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
      appointmentId: freezed == appointmentId
          ? _value.appointmentId
          : appointmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      saleId: freezed == saleId
          ? _value.saleId
          : saleId // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentCreateDtoImplCopyWith<$Res>
    implements $PaymentCreateDtoCopyWith<$Res> {
  factory _$$PaymentCreateDtoImplCopyWith(_$PaymentCreateDtoImpl value,
          $Res Function(_$PaymentCreateDtoImpl) then) =
      __$$PaymentCreateDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'client_id') int clientId,
      @JsonKey(name: 'branch_id') int? branchId,
      @JsonKey(name: 'appointment_id') int? appointmentId,
      @JsonKey(name: 'sale_id') int? saleId,
      double amount,
      String method,
      String status,
      String? reference,
      String? notes});
}

/// @nodoc
class __$$PaymentCreateDtoImplCopyWithImpl<$Res>
    extends _$PaymentCreateDtoCopyWithImpl<$Res, _$PaymentCreateDtoImpl>
    implements _$$PaymentCreateDtoImplCopyWith<$Res> {
  __$$PaymentCreateDtoImplCopyWithImpl(_$PaymentCreateDtoImpl _value,
      $Res Function(_$PaymentCreateDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientId = null,
    Object? branchId = freezed,
    Object? appointmentId = freezed,
    Object? saleId = freezed,
    Object? amount = null,
    Object? method = null,
    Object? status = null,
    Object? reference = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$PaymentCreateDtoImpl(
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as int,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
      appointmentId: freezed == appointmentId
          ? _value.appointmentId
          : appointmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      saleId: freezed == saleId
          ? _value.saleId
          : saleId // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentCreateDtoImpl implements _PaymentCreateDto {
  const _$PaymentCreateDtoImpl(
      {@JsonKey(name: 'client_id') required this.clientId,
      @JsonKey(name: 'branch_id') this.branchId,
      @JsonKey(name: 'appointment_id') this.appointmentId,
      @JsonKey(name: 'sale_id') this.saleId,
      required this.amount,
      this.method = 'cash',
      this.status = 'paid',
      this.reference,
      this.notes});

  factory _$PaymentCreateDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentCreateDtoImplFromJson(json);

  @override
  @JsonKey(name: 'client_id')
  final int clientId;
  @override
  @JsonKey(name: 'branch_id')
  final int? branchId;
  @override
  @JsonKey(name: 'appointment_id')
  final int? appointmentId;
  @override
  @JsonKey(name: 'sale_id')
  final int? saleId;
  @override
  final double amount;
  @override
  @JsonKey()
  final String method;
  @override
  @JsonKey()
  final String status;
  @override
  final String? reference;
  @override
  final String? notes;

  @override
  String toString() {
    return 'PaymentCreateDto(clientId: $clientId, branchId: $branchId, appointmentId: $appointmentId, saleId: $saleId, amount: $amount, method: $method, status: $status, reference: $reference, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentCreateDtoImpl &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.branchId, branchId) ||
                other.branchId == branchId) &&
            (identical(other.appointmentId, appointmentId) ||
                other.appointmentId == appointmentId) &&
            (identical(other.saleId, saleId) || other.saleId == saleId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, clientId, branchId,
      appointmentId, saleId, amount, method, status, reference, notes);

  /// Create a copy of PaymentCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentCreateDtoImplCopyWith<_$PaymentCreateDtoImpl> get copyWith =>
      __$$PaymentCreateDtoImplCopyWithImpl<_$PaymentCreateDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentCreateDtoImplToJson(
      this,
    );
  }
}

abstract class _PaymentCreateDto implements PaymentCreateDto {
  const factory _PaymentCreateDto(
      {@JsonKey(name: 'client_id') required final int clientId,
      @JsonKey(name: 'branch_id') final int? branchId,
      @JsonKey(name: 'appointment_id') final int? appointmentId,
      @JsonKey(name: 'sale_id') final int? saleId,
      required final double amount,
      final String method,
      final String status,
      final String? reference,
      final String? notes}) = _$PaymentCreateDtoImpl;

  factory _PaymentCreateDto.fromJson(Map<String, dynamic> json) =
      _$PaymentCreateDtoImpl.fromJson;

  @override
  @JsonKey(name: 'client_id')
  int get clientId;
  @override
  @JsonKey(name: 'branch_id')
  int? get branchId;
  @override
  @JsonKey(name: 'appointment_id')
  int? get appointmentId;
  @override
  @JsonKey(name: 'sale_id')
  int? get saleId;
  @override
  double get amount;
  @override
  String get method;
  @override
  String get status;
  @override
  String? get reference;
  @override
  String? get notes;

  /// Create a copy of PaymentCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentCreateDtoImplCopyWith<_$PaymentCreateDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

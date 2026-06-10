// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EyeTypeSummaryDto _$EyeTypeSummaryDtoFromJson(Map<String, dynamic> json) {
  return _EyeTypeSummaryDto.fromJson(json);
}

/// @nodoc
mixin _$EyeTypeSummaryDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this EyeTypeSummaryDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EyeTypeSummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EyeTypeSummaryDtoCopyWith<EyeTypeSummaryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EyeTypeSummaryDtoCopyWith<$Res> {
  factory $EyeTypeSummaryDtoCopyWith(
          EyeTypeSummaryDto value, $Res Function(EyeTypeSummaryDto) then) =
      _$EyeTypeSummaryDtoCopyWithImpl<$Res, EyeTypeSummaryDto>;
  @useResult
  $Res call({int id, String name, String? description});
}

/// @nodoc
class _$EyeTypeSummaryDtoCopyWithImpl<$Res, $Val extends EyeTypeSummaryDto>
    implements $EyeTypeSummaryDtoCopyWith<$Res> {
  _$EyeTypeSummaryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EyeTypeSummaryDto
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
abstract class _$$EyeTypeSummaryDtoImplCopyWith<$Res>
    implements $EyeTypeSummaryDtoCopyWith<$Res> {
  factory _$$EyeTypeSummaryDtoImplCopyWith(_$EyeTypeSummaryDtoImpl value,
          $Res Function(_$EyeTypeSummaryDtoImpl) then) =
      __$$EyeTypeSummaryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String? description});
}

/// @nodoc
class __$$EyeTypeSummaryDtoImplCopyWithImpl<$Res>
    extends _$EyeTypeSummaryDtoCopyWithImpl<$Res, _$EyeTypeSummaryDtoImpl>
    implements _$$EyeTypeSummaryDtoImplCopyWith<$Res> {
  __$$EyeTypeSummaryDtoImplCopyWithImpl(_$EyeTypeSummaryDtoImpl _value,
      $Res Function(_$EyeTypeSummaryDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of EyeTypeSummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
  }) {
    return _then(_$EyeTypeSummaryDtoImpl(
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
class _$EyeTypeSummaryDtoImpl implements _EyeTypeSummaryDto {
  const _$EyeTypeSummaryDtoImpl(
      {required this.id, required this.name, this.description});

  factory _$EyeTypeSummaryDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$EyeTypeSummaryDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? description;

  @override
  String toString() {
    return 'EyeTypeSummaryDto(id: $id, name: $name, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EyeTypeSummaryDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description);

  /// Create a copy of EyeTypeSummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EyeTypeSummaryDtoImplCopyWith<_$EyeTypeSummaryDtoImpl> get copyWith =>
      __$$EyeTypeSummaryDtoImplCopyWithImpl<_$EyeTypeSummaryDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EyeTypeSummaryDtoImplToJson(
      this,
    );
  }
}

abstract class _EyeTypeSummaryDto implements EyeTypeSummaryDto {
  const factory _EyeTypeSummaryDto(
      {required final int id,
      required final String name,
      final String? description}) = _$EyeTypeSummaryDtoImpl;

  factory _EyeTypeSummaryDto.fromJson(Map<String, dynamic> json) =
      _$EyeTypeSummaryDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get description;

  /// Create a copy of EyeTypeSummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EyeTypeSummaryDtoImplCopyWith<_$EyeTypeSummaryDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClientDto _$ClientDtoFromJson(Map<String, dynamic> json) {
  return _ClientDto.fromJson(json);
}

/// @nodoc
mixin _$ClientDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String get lastName => throw _privateConstructorUsedError;
  int? get age => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'branch_id')
  int? get branchId => throw _privateConstructorUsedError;
  @JsonKey(name: 'eye_type_id')
  int? get eyeTypeId => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_activity_at')
  DateTime? get lastActivityAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'eye_type')
  EyeTypeSummaryDto? get eyeType => throw _privateConstructorUsedError;

  /// Serializes this ClientDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClientDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClientDtoCopyWith<ClientDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientDtoCopyWith<$Res> {
  factory $ClientDtoCopyWith(ClientDto value, $Res Function(ClientDto) then) =
      _$ClientDtoCopyWithImpl<$Res, ClientDto>;
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'last_name') String lastName,
      int? age,
      String? phone,
      String? email,
      @JsonKey(name: 'branch_id') int? branchId,
      @JsonKey(name: 'eye_type_id') int? eyeTypeId,
      String status,
      @JsonKey(name: 'last_activity_at') DateTime? lastActivityAt,
      @JsonKey(name: 'eye_type') EyeTypeSummaryDto? eyeType});

  $EyeTypeSummaryDtoCopyWith<$Res>? get eyeType;
}

/// @nodoc
class _$ClientDtoCopyWithImpl<$Res, $Val extends ClientDto>
    implements $ClientDtoCopyWith<$Res> {
  _$ClientDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClientDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? lastName = null,
    Object? age = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? branchId = freezed,
    Object? eyeTypeId = freezed,
    Object? status = null,
    Object? lastActivityAt = freezed,
    Object? eyeType = freezed,
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
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
      eyeTypeId: freezed == eyeTypeId
          ? _value.eyeTypeId
          : eyeTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      lastActivityAt: freezed == lastActivityAt
          ? _value.lastActivityAt
          : lastActivityAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      eyeType: freezed == eyeType
          ? _value.eyeType
          : eyeType // ignore: cast_nullable_to_non_nullable
              as EyeTypeSummaryDto?,
    ) as $Val);
  }

  /// Create a copy of ClientDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EyeTypeSummaryDtoCopyWith<$Res>? get eyeType {
    if (_value.eyeType == null) {
      return null;
    }

    return $EyeTypeSummaryDtoCopyWith<$Res>(_value.eyeType!, (value) {
      return _then(_value.copyWith(eyeType: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ClientDtoImplCopyWith<$Res>
    implements $ClientDtoCopyWith<$Res> {
  factory _$$ClientDtoImplCopyWith(
          _$ClientDtoImpl value, $Res Function(_$ClientDtoImpl) then) =
      __$$ClientDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'last_name') String lastName,
      int? age,
      String? phone,
      String? email,
      @JsonKey(name: 'branch_id') int? branchId,
      @JsonKey(name: 'eye_type_id') int? eyeTypeId,
      String status,
      @JsonKey(name: 'last_activity_at') DateTime? lastActivityAt,
      @JsonKey(name: 'eye_type') EyeTypeSummaryDto? eyeType});

  @override
  $EyeTypeSummaryDtoCopyWith<$Res>? get eyeType;
}

/// @nodoc
class __$$ClientDtoImplCopyWithImpl<$Res>
    extends _$ClientDtoCopyWithImpl<$Res, _$ClientDtoImpl>
    implements _$$ClientDtoImplCopyWith<$Res> {
  __$$ClientDtoImplCopyWithImpl(
      _$ClientDtoImpl _value, $Res Function(_$ClientDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClientDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? lastName = null,
    Object? age = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? branchId = freezed,
    Object? eyeTypeId = freezed,
    Object? status = null,
    Object? lastActivityAt = freezed,
    Object? eyeType = freezed,
  }) {
    return _then(_$ClientDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
      eyeTypeId: freezed == eyeTypeId
          ? _value.eyeTypeId
          : eyeTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      lastActivityAt: freezed == lastActivityAt
          ? _value.lastActivityAt
          : lastActivityAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      eyeType: freezed == eyeType
          ? _value.eyeType
          : eyeType // ignore: cast_nullable_to_non_nullable
              as EyeTypeSummaryDto?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClientDtoImpl implements _ClientDto {
  const _$ClientDtoImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'last_name') required this.lastName,
      this.age,
      this.phone,
      this.email,
      @JsonKey(name: 'branch_id') this.branchId,
      @JsonKey(name: 'eye_type_id') this.eyeTypeId,
      this.status = 'sin_estado',
      @JsonKey(name: 'last_activity_at') this.lastActivityAt,
      @JsonKey(name: 'eye_type') this.eyeType});

  factory _$ClientDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClientDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: 'last_name')
  final String lastName;
  @override
  final int? age;
  @override
  final String? phone;
  @override
  final String? email;
  @override
  @JsonKey(name: 'branch_id')
  final int? branchId;
  @override
  @JsonKey(name: 'eye_type_id')
  final int? eyeTypeId;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey(name: 'last_activity_at')
  final DateTime? lastActivityAt;
  @override
  @JsonKey(name: 'eye_type')
  final EyeTypeSummaryDto? eyeType;

  @override
  String toString() {
    return 'ClientDto(id: $id, name: $name, lastName: $lastName, age: $age, phone: $phone, email: $email, branchId: $branchId, eyeTypeId: $eyeTypeId, status: $status, lastActivityAt: $lastActivityAt, eyeType: $eyeType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.branchId, branchId) ||
                other.branchId == branchId) &&
            (identical(other.eyeTypeId, eyeTypeId) ||
                other.eyeTypeId == eyeTypeId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.lastActivityAt, lastActivityAt) ||
                other.lastActivityAt == lastActivityAt) &&
            (identical(other.eyeType, eyeType) || other.eyeType == eyeType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, lastName, age, phone,
      email, branchId, eyeTypeId, status, lastActivityAt, eyeType);

  /// Create a copy of ClientDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClientDtoImplCopyWith<_$ClientDtoImpl> get copyWith =>
      __$$ClientDtoImplCopyWithImpl<_$ClientDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClientDtoImplToJson(
      this,
    );
  }
}

abstract class _ClientDto implements ClientDto {
  const factory _ClientDto(
          {required final int id,
          required final String name,
          @JsonKey(name: 'last_name') required final String lastName,
          final int? age,
          final String? phone,
          final String? email,
          @JsonKey(name: 'branch_id') final int? branchId,
          @JsonKey(name: 'eye_type_id') final int? eyeTypeId,
          final String status,
          @JsonKey(name: 'last_activity_at') final DateTime? lastActivityAt,
          @JsonKey(name: 'eye_type') final EyeTypeSummaryDto? eyeType}) =
      _$ClientDtoImpl;

  factory _ClientDto.fromJson(Map<String, dynamic> json) =
      _$ClientDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'last_name')
  String get lastName;
  @override
  int? get age;
  @override
  String? get phone;
  @override
  String? get email;
  @override
  @JsonKey(name: 'branch_id')
  int? get branchId;
  @override
  @JsonKey(name: 'eye_type_id')
  int? get eyeTypeId;
  @override
  String get status;
  @override
  @JsonKey(name: 'last_activity_at')
  DateTime? get lastActivityAt;
  @override
  @JsonKey(name: 'eye_type')
  EyeTypeSummaryDto? get eyeType;

  /// Create a copy of ClientDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClientDtoImplCopyWith<_$ClientDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClientCreateDto _$ClientCreateDtoFromJson(Map<String, dynamic> json) {
  return _ClientCreateDto.fromJson(json);
}

/// @nodoc
mixin _$ClientCreateDto {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String get lastName => throw _privateConstructorUsedError;
  int? get age => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'branch_id')
  int? get branchId => throw _privateConstructorUsedError;
  @JsonKey(name: 'eye_type_id')
  int? get eyeTypeId => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this ClientCreateDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClientCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClientCreateDtoCopyWith<ClientCreateDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientCreateDtoCopyWith<$Res> {
  factory $ClientCreateDtoCopyWith(
          ClientCreateDto value, $Res Function(ClientCreateDto) then) =
      _$ClientCreateDtoCopyWithImpl<$Res, ClientCreateDto>;
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'last_name') String lastName,
      int? age,
      String? phone,
      String? email,
      @JsonKey(name: 'branch_id') int? branchId,
      @JsonKey(name: 'eye_type_id') int? eyeTypeId,
      String status});
}

/// @nodoc
class _$ClientCreateDtoCopyWithImpl<$Res, $Val extends ClientCreateDto>
    implements $ClientCreateDtoCopyWith<$Res> {
  _$ClientCreateDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClientCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? lastName = null,
    Object? age = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? branchId = freezed,
    Object? eyeTypeId = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
      eyeTypeId: freezed == eyeTypeId
          ? _value.eyeTypeId
          : eyeTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClientCreateDtoImplCopyWith<$Res>
    implements $ClientCreateDtoCopyWith<$Res> {
  factory _$$ClientCreateDtoImplCopyWith(_$ClientCreateDtoImpl value,
          $Res Function(_$ClientCreateDtoImpl) then) =
      __$$ClientCreateDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'last_name') String lastName,
      int? age,
      String? phone,
      String? email,
      @JsonKey(name: 'branch_id') int? branchId,
      @JsonKey(name: 'eye_type_id') int? eyeTypeId,
      String status});
}

/// @nodoc
class __$$ClientCreateDtoImplCopyWithImpl<$Res>
    extends _$ClientCreateDtoCopyWithImpl<$Res, _$ClientCreateDtoImpl>
    implements _$$ClientCreateDtoImplCopyWith<$Res> {
  __$$ClientCreateDtoImplCopyWithImpl(
      _$ClientCreateDtoImpl _value, $Res Function(_$ClientCreateDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClientCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? lastName = null,
    Object? age = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? branchId = freezed,
    Object? eyeTypeId = freezed,
    Object? status = null,
  }) {
    return _then(_$ClientCreateDtoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
      eyeTypeId: freezed == eyeTypeId
          ? _value.eyeTypeId
          : eyeTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClientCreateDtoImpl implements _ClientCreateDto {
  const _$ClientCreateDtoImpl(
      {required this.name,
      @JsonKey(name: 'last_name') required this.lastName,
      this.age,
      this.phone,
      this.email,
      @JsonKey(name: 'branch_id') this.branchId,
      @JsonKey(name: 'eye_type_id') this.eyeTypeId,
      this.status = 'en_espera'});

  factory _$ClientCreateDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClientCreateDtoImplFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(name: 'last_name')
  final String lastName;
  @override
  final int? age;
  @override
  final String? phone;
  @override
  final String? email;
  @override
  @JsonKey(name: 'branch_id')
  final int? branchId;
  @override
  @JsonKey(name: 'eye_type_id')
  final int? eyeTypeId;
  @override
  @JsonKey()
  final String status;

  @override
  String toString() {
    return 'ClientCreateDto(name: $name, lastName: $lastName, age: $age, phone: $phone, email: $email, branchId: $branchId, eyeTypeId: $eyeTypeId, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientCreateDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.branchId, branchId) ||
                other.branchId == branchId) &&
            (identical(other.eyeTypeId, eyeTypeId) ||
                other.eyeTypeId == eyeTypeId) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, lastName, age, phone,
      email, branchId, eyeTypeId, status);

  /// Create a copy of ClientCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClientCreateDtoImplCopyWith<_$ClientCreateDtoImpl> get copyWith =>
      __$$ClientCreateDtoImplCopyWithImpl<_$ClientCreateDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClientCreateDtoImplToJson(
      this,
    );
  }
}

abstract class _ClientCreateDto implements ClientCreateDto {
  const factory _ClientCreateDto(
      {required final String name,
      @JsonKey(name: 'last_name') required final String lastName,
      final int? age,
      final String? phone,
      final String? email,
      @JsonKey(name: 'branch_id') final int? branchId,
      @JsonKey(name: 'eye_type_id') final int? eyeTypeId,
      final String status}) = _$ClientCreateDtoImpl;

  factory _ClientCreateDto.fromJson(Map<String, dynamic> json) =
      _$ClientCreateDtoImpl.fromJson;

  @override
  String get name;
  @override
  @JsonKey(name: 'last_name')
  String get lastName;
  @override
  int? get age;
  @override
  String? get phone;
  @override
  String? get email;
  @override
  @JsonKey(name: 'branch_id')
  int? get branchId;
  @override
  @JsonKey(name: 'eye_type_id')
  int? get eyeTypeId;
  @override
  String get status;

  /// Create a copy of ClientCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClientCreateDtoImplCopyWith<_$ClientCreateDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClientUpdateDto _$ClientUpdateDtoFromJson(Map<String, dynamic> json) {
  return _ClientUpdateDto.fromJson(json);
}

/// @nodoc
mixin _$ClientUpdateDto {
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;
  int? get age => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'branch_id')
  int? get branchId => throw _privateConstructorUsedError;
  @JsonKey(name: 'eye_type_id')
  int? get eyeTypeId => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  /// Serializes this ClientUpdateDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClientUpdateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClientUpdateDtoCopyWith<ClientUpdateDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientUpdateDtoCopyWith<$Res> {
  factory $ClientUpdateDtoCopyWith(
          ClientUpdateDto value, $Res Function(ClientUpdateDto) then) =
      _$ClientUpdateDtoCopyWithImpl<$Res, ClientUpdateDto>;
  @useResult
  $Res call(
      {String? name,
      @JsonKey(name: 'last_name') String? lastName,
      int? age,
      String? phone,
      String? email,
      @JsonKey(name: 'branch_id') int? branchId,
      @JsonKey(name: 'eye_type_id') int? eyeTypeId,
      String? status});
}

/// @nodoc
class _$ClientUpdateDtoCopyWithImpl<$Res, $Val extends ClientUpdateDto>
    implements $ClientUpdateDtoCopyWith<$Res> {
  _$ClientUpdateDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClientUpdateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? lastName = freezed,
    Object? age = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? branchId = freezed,
    Object? eyeTypeId = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
      eyeTypeId: freezed == eyeTypeId
          ? _value.eyeTypeId
          : eyeTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClientUpdateDtoImplCopyWith<$Res>
    implements $ClientUpdateDtoCopyWith<$Res> {
  factory _$$ClientUpdateDtoImplCopyWith(_$ClientUpdateDtoImpl value,
          $Res Function(_$ClientUpdateDtoImpl) then) =
      __$$ClientUpdateDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      @JsonKey(name: 'last_name') String? lastName,
      int? age,
      String? phone,
      String? email,
      @JsonKey(name: 'branch_id') int? branchId,
      @JsonKey(name: 'eye_type_id') int? eyeTypeId,
      String? status});
}

/// @nodoc
class __$$ClientUpdateDtoImplCopyWithImpl<$Res>
    extends _$ClientUpdateDtoCopyWithImpl<$Res, _$ClientUpdateDtoImpl>
    implements _$$ClientUpdateDtoImplCopyWith<$Res> {
  __$$ClientUpdateDtoImplCopyWithImpl(
      _$ClientUpdateDtoImpl _value, $Res Function(_$ClientUpdateDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClientUpdateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? lastName = freezed,
    Object? age = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? branchId = freezed,
    Object? eyeTypeId = freezed,
    Object? status = freezed,
  }) {
    return _then(_$ClientUpdateDtoImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
      eyeTypeId: freezed == eyeTypeId
          ? _value.eyeTypeId
          : eyeTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClientUpdateDtoImpl implements _ClientUpdateDto {
  const _$ClientUpdateDtoImpl(
      {this.name,
      @JsonKey(name: 'last_name') this.lastName,
      this.age,
      this.phone,
      this.email,
      @JsonKey(name: 'branch_id') this.branchId,
      @JsonKey(name: 'eye_type_id') this.eyeTypeId,
      this.status});

  factory _$ClientUpdateDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClientUpdateDtoImplFromJson(json);

  @override
  final String? name;
  @override
  @JsonKey(name: 'last_name')
  final String? lastName;
  @override
  final int? age;
  @override
  final String? phone;
  @override
  final String? email;
  @override
  @JsonKey(name: 'branch_id')
  final int? branchId;
  @override
  @JsonKey(name: 'eye_type_id')
  final int? eyeTypeId;
  @override
  final String? status;

  @override
  String toString() {
    return 'ClientUpdateDto(name: $name, lastName: $lastName, age: $age, phone: $phone, email: $email, branchId: $branchId, eyeTypeId: $eyeTypeId, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientUpdateDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.branchId, branchId) ||
                other.branchId == branchId) &&
            (identical(other.eyeTypeId, eyeTypeId) ||
                other.eyeTypeId == eyeTypeId) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, lastName, age, phone,
      email, branchId, eyeTypeId, status);

  /// Create a copy of ClientUpdateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClientUpdateDtoImplCopyWith<_$ClientUpdateDtoImpl> get copyWith =>
      __$$ClientUpdateDtoImplCopyWithImpl<_$ClientUpdateDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClientUpdateDtoImplToJson(
      this,
    );
  }
}

abstract class _ClientUpdateDto implements ClientUpdateDto {
  const factory _ClientUpdateDto(
      {final String? name,
      @JsonKey(name: 'last_name') final String? lastName,
      final int? age,
      final String? phone,
      final String? email,
      @JsonKey(name: 'branch_id') final int? branchId,
      @JsonKey(name: 'eye_type_id') final int? eyeTypeId,
      final String? status}) = _$ClientUpdateDtoImpl;

  factory _ClientUpdateDto.fromJson(Map<String, dynamic> json) =
      _$ClientUpdateDtoImpl.fromJson;

  @override
  String? get name;
  @override
  @JsonKey(name: 'last_name')
  String? get lastName;
  @override
  int? get age;
  @override
  String? get phone;
  @override
  String? get email;
  @override
  @JsonKey(name: 'branch_id')
  int? get branchId;
  @override
  @JsonKey(name: 'eye_type_id')
  int? get eyeTypeId;
  @override
  String? get status;

  /// Create a copy of ClientUpdateDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClientUpdateDtoImplCopyWith<_$ClientUpdateDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

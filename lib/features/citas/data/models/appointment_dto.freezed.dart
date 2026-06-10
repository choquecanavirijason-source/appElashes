// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'appointment_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClientSummaryDto _$ClientSummaryDtoFromJson(Map<String, dynamic> json) {
  return _ClientSummaryDto.fromJson(json);
}

/// @nodoc
mixin _$ClientSummaryDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;
  int? get age => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;

  /// Serializes this ClientSummaryDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClientSummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClientSummaryDtoCopyWith<ClientSummaryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientSummaryDtoCopyWith<$Res> {
  factory $ClientSummaryDtoCopyWith(
          ClientSummaryDto value, $Res Function(ClientSummaryDto) then) =
      _$ClientSummaryDtoCopyWithImpl<$Res, ClientSummaryDto>;
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'last_name') String? lastName,
      int? age,
      String? phone,
      String? email});
}

/// @nodoc
class _$ClientSummaryDtoCopyWithImpl<$Res, $Val extends ClientSummaryDto>
    implements $ClientSummaryDtoCopyWith<$Res> {
  _$ClientSummaryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClientSummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? lastName = freezed,
    Object? age = freezed,
    Object? phone = freezed,
    Object? email = freezed,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClientSummaryDtoImplCopyWith<$Res>
    implements $ClientSummaryDtoCopyWith<$Res> {
  factory _$$ClientSummaryDtoImplCopyWith(_$ClientSummaryDtoImpl value,
          $Res Function(_$ClientSummaryDtoImpl) then) =
      __$$ClientSummaryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'last_name') String? lastName,
      int? age,
      String? phone,
      String? email});
}

/// @nodoc
class __$$ClientSummaryDtoImplCopyWithImpl<$Res>
    extends _$ClientSummaryDtoCopyWithImpl<$Res, _$ClientSummaryDtoImpl>
    implements _$$ClientSummaryDtoImplCopyWith<$Res> {
  __$$ClientSummaryDtoImplCopyWithImpl(_$ClientSummaryDtoImpl _value,
      $Res Function(_$ClientSummaryDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClientSummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? lastName = freezed,
    Object? age = freezed,
    Object? phone = freezed,
    Object? email = freezed,
  }) {
    return _then(_$ClientSummaryDtoImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClientSummaryDtoImpl implements _ClientSummaryDto {
  const _$ClientSummaryDtoImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'last_name') this.lastName,
      this.age,
      this.phone,
      this.email});

  factory _$ClientSummaryDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClientSummaryDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
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
  String toString() {
    return 'ClientSummaryDto(id: $id, name: $name, lastName: $lastName, age: $age, phone: $phone, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientSummaryDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, lastName, age, phone, email);

  /// Create a copy of ClientSummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClientSummaryDtoImplCopyWith<_$ClientSummaryDtoImpl> get copyWith =>
      __$$ClientSummaryDtoImplCopyWithImpl<_$ClientSummaryDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClientSummaryDtoImplToJson(
      this,
    );
  }
}

abstract class _ClientSummaryDto implements ClientSummaryDto {
  const factory _ClientSummaryDto(
      {required final int id,
      required final String name,
      @JsonKey(name: 'last_name') final String? lastName,
      final int? age,
      final String? phone,
      final String? email}) = _$ClientSummaryDtoImpl;

  factory _ClientSummaryDto.fromJson(Map<String, dynamic> json) =
      _$ClientSummaryDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'last_name')
  String? get lastName;
  @override
  int? get age;
  @override
  String? get phone;
  @override
  String? get email;

  /// Create a copy of ClientSummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClientSummaryDtoImplCopyWith<_$ClientSummaryDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserSummaryDto _$UserSummaryDtoFromJson(Map<String, dynamic> json) {
  return _UserSummaryDto.fromJson(json);
}

/// @nodoc
mixin _$UserSummaryDto {
  int get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;

  /// Serializes this UserSummaryDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserSummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserSummaryDtoCopyWith<UserSummaryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSummaryDtoCopyWith<$Res> {
  factory $UserSummaryDtoCopyWith(
          UserSummaryDto value, $Res Function(UserSummaryDto) then) =
      _$UserSummaryDtoCopyWithImpl<$Res, UserSummaryDto>;
  @useResult
  $Res call(
      {int id,
      String username,
      String email,
      String? phone,
      @JsonKey(name: 'is_active') bool isActive});
}

/// @nodoc
class _$UserSummaryDtoCopyWithImpl<$Res, $Val extends UserSummaryDto>
    implements $UserSummaryDtoCopyWith<$Res> {
  _$UserSummaryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserSummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? email = null,
    Object? phone = freezed,
    Object? isActive = null,
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
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserSummaryDtoImplCopyWith<$Res>
    implements $UserSummaryDtoCopyWith<$Res> {
  factory _$$UserSummaryDtoImplCopyWith(_$UserSummaryDtoImpl value,
          $Res Function(_$UserSummaryDtoImpl) then) =
      __$$UserSummaryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String username,
      String email,
      String? phone,
      @JsonKey(name: 'is_active') bool isActive});
}

/// @nodoc
class __$$UserSummaryDtoImplCopyWithImpl<$Res>
    extends _$UserSummaryDtoCopyWithImpl<$Res, _$UserSummaryDtoImpl>
    implements _$$UserSummaryDtoImplCopyWith<$Res> {
  __$$UserSummaryDtoImplCopyWithImpl(
      _$UserSummaryDtoImpl _value, $Res Function(_$UserSummaryDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserSummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? email = null,
    Object? phone = freezed,
    Object? isActive = null,
  }) {
    return _then(_$UserSummaryDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserSummaryDtoImpl implements _UserSummaryDto {
  const _$UserSummaryDtoImpl(
      {required this.id,
      required this.username,
      required this.email,
      this.phone,
      @JsonKey(name: 'is_active') this.isActive = true});

  factory _$UserSummaryDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserSummaryDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String username;
  @override
  final String email;
  @override
  final String? phone;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;

  @override
  String toString() {
    return 'UserSummaryDto(id: $id, username: $username, email: $email, phone: $phone, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSummaryDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, username, email, phone, isActive);

  /// Create a copy of UserSummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSummaryDtoImplCopyWith<_$UserSummaryDtoImpl> get copyWith =>
      __$$UserSummaryDtoImplCopyWithImpl<_$UserSummaryDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserSummaryDtoImplToJson(
      this,
    );
  }
}

abstract class _UserSummaryDto implements UserSummaryDto {
  const factory _UserSummaryDto(
      {required final int id,
      required final String username,
      required final String email,
      final String? phone,
      @JsonKey(name: 'is_active') final bool isActive}) = _$UserSummaryDtoImpl;

  factory _UserSummaryDto.fromJson(Map<String, dynamic> json) =
      _$UserSummaryDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get username;
  @override
  String get email;
  @override
  String? get phone;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;

  /// Create a copy of UserSummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserSummaryDtoImplCopyWith<_$UserSummaryDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AppointmentServiceDto _$AppointmentServiceDtoFromJson(
    Map<String, dynamic> json) {
  return _AppointmentServiceDto.fromJson(json);
}

/// @nodoc
mixin _$AppointmentServiceDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration_minutes')
  int get durationMinutes => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this AppointmentServiceDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppointmentServiceDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppointmentServiceDtoCopyWith<AppointmentServiceDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentServiceDtoCopyWith<$Res> {
  factory $AppointmentServiceDtoCopyWith(AppointmentServiceDto value,
          $Res Function(AppointmentServiceDto) then) =
      _$AppointmentServiceDtoCopyWithImpl<$Res, AppointmentServiceDto>;
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'duration_minutes') int durationMinutes,
      double price,
      String? description});
}

/// @nodoc
class _$AppointmentServiceDtoCopyWithImpl<$Res,
        $Val extends AppointmentServiceDto>
    implements $AppointmentServiceDtoCopyWith<$Res> {
  _$AppointmentServiceDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppointmentServiceDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? durationMinutes = null,
    Object? price = null,
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
      durationMinutes: null == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppointmentServiceDtoImplCopyWith<$Res>
    implements $AppointmentServiceDtoCopyWith<$Res> {
  factory _$$AppointmentServiceDtoImplCopyWith(
          _$AppointmentServiceDtoImpl value,
          $Res Function(_$AppointmentServiceDtoImpl) then) =
      __$$AppointmentServiceDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'duration_minutes') int durationMinutes,
      double price,
      String? description});
}

/// @nodoc
class __$$AppointmentServiceDtoImplCopyWithImpl<$Res>
    extends _$AppointmentServiceDtoCopyWithImpl<$Res,
        _$AppointmentServiceDtoImpl>
    implements _$$AppointmentServiceDtoImplCopyWith<$Res> {
  __$$AppointmentServiceDtoImplCopyWithImpl(_$AppointmentServiceDtoImpl _value,
      $Res Function(_$AppointmentServiceDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppointmentServiceDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? durationMinutes = null,
    Object? price = null,
    Object? description = freezed,
  }) {
    return _then(_$AppointmentServiceDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      durationMinutes: null == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppointmentServiceDtoImpl implements _AppointmentServiceDto {
  const _$AppointmentServiceDtoImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'duration_minutes') required this.durationMinutes,
      required this.price,
      this.description});

  factory _$AppointmentServiceDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppointmentServiceDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: 'duration_minutes')
  final int durationMinutes;
  @override
  final double price;
  @override
  final String? description;

  @override
  String toString() {
    return 'AppointmentServiceDto(id: $id, name: $name, durationMinutes: $durationMinutes, price: $price, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppointmentServiceDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, durationMinutes, price, description);

  /// Create a copy of AppointmentServiceDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppointmentServiceDtoImplCopyWith<_$AppointmentServiceDtoImpl>
      get copyWith => __$$AppointmentServiceDtoImplCopyWithImpl<
          _$AppointmentServiceDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppointmentServiceDtoImplToJson(
      this,
    );
  }
}

abstract class _AppointmentServiceDto implements AppointmentServiceDto {
  const factory _AppointmentServiceDto(
      {required final int id,
      required final String name,
      @JsonKey(name: 'duration_minutes') required final int durationMinutes,
      required final double price,
      final String? description}) = _$AppointmentServiceDtoImpl;

  factory _AppointmentServiceDto.fromJson(Map<String, dynamic> json) =
      _$AppointmentServiceDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'duration_minutes')
  int get durationMinutes;
  @override
  double get price;
  @override
  String? get description;

  /// Create a copy of AppointmentServiceDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppointmentServiceDtoImplCopyWith<_$AppointmentServiceDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AppointmentDto _$AppointmentDtoFromJson(Map<String, dynamic> json) {
  return _AppointmentDto.fromJson(json);
}

/// @nodoc
mixin _$AppointmentDto {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'ticket_code')
  String? get ticketCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'client_id')
  int get clientId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_id')
  int? get createdById => throw _privateConstructorUsedError;
  @JsonKey(name: 'professional_id')
  int? get professionalId => throw _privateConstructorUsedError;
  @JsonKey(name: 'service_id')
  int? get serviceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'service_ids')
  List<int>? get serviceIds => throw _privateConstructorUsedError;
  @JsonKey(name: 'branch_id')
  int? get branchId => throw _privateConstructorUsedError;
  @JsonKey(name: 'sale_id')
  int? get saleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_ia')
  bool get isIa => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  DateTime get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  DateTime get endTime => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'advance_payment_amount')
  double get advancePaymentAmount => throw _privateConstructorUsedError;
  ClientSummaryDto get client => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by')
  UserSummaryDto? get createdBy => throw _privateConstructorUsedError;
  UserSummaryDto? get professional => throw _privateConstructorUsedError;
  AppointmentServiceDto? get service => throw _privateConstructorUsedError;
  List<AppointmentServiceDto>? get services =>
      throw _privateConstructorUsedError;

  /// Serializes this AppointmentDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppointmentDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppointmentDtoCopyWith<AppointmentDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentDtoCopyWith<$Res> {
  factory $AppointmentDtoCopyWith(
          AppointmentDto value, $Res Function(AppointmentDto) then) =
      _$AppointmentDtoCopyWithImpl<$Res, AppointmentDto>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'ticket_code') String? ticketCode,
      @JsonKey(name: 'client_id') int clientId,
      @JsonKey(name: 'created_by_id') int? createdById,
      @JsonKey(name: 'professional_id') int? professionalId,
      @JsonKey(name: 'service_id') int? serviceId,
      @JsonKey(name: 'service_ids') List<int>? serviceIds,
      @JsonKey(name: 'branch_id') int? branchId,
      @JsonKey(name: 'sale_id') int? saleId,
      @JsonKey(name: 'is_ia') bool isIa,
      @JsonKey(name: 'start_time') DateTime startTime,
      @JsonKey(name: 'end_time') DateTime endTime,
      String status,
      @JsonKey(name: 'advance_payment_amount') double advancePaymentAmount,
      ClientSummaryDto client,
      @JsonKey(name: 'created_by') UserSummaryDto? createdBy,
      UserSummaryDto? professional,
      AppointmentServiceDto? service,
      List<AppointmentServiceDto>? services});

  $ClientSummaryDtoCopyWith<$Res> get client;
  $UserSummaryDtoCopyWith<$Res>? get createdBy;
  $UserSummaryDtoCopyWith<$Res>? get professional;
  $AppointmentServiceDtoCopyWith<$Res>? get service;
}

/// @nodoc
class _$AppointmentDtoCopyWithImpl<$Res, $Val extends AppointmentDto>
    implements $AppointmentDtoCopyWith<$Res> {
  _$AppointmentDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppointmentDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ticketCode = freezed,
    Object? clientId = null,
    Object? createdById = freezed,
    Object? professionalId = freezed,
    Object? serviceId = freezed,
    Object? serviceIds = freezed,
    Object? branchId = freezed,
    Object? saleId = freezed,
    Object? isIa = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? status = null,
    Object? advancePaymentAmount = null,
    Object? client = null,
    Object? createdBy = freezed,
    Object? professional = freezed,
    Object? service = freezed,
    Object? services = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      ticketCode: freezed == ticketCode
          ? _value.ticketCode
          : ticketCode // ignore: cast_nullable_to_non_nullable
              as String?,
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as int,
      createdById: freezed == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int?,
      professionalId: freezed == professionalId
          ? _value.professionalId
          : professionalId // ignore: cast_nullable_to_non_nullable
              as int?,
      serviceId: freezed == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as int?,
      serviceIds: freezed == serviceIds
          ? _value.serviceIds
          : serviceIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
      saleId: freezed == saleId
          ? _value.saleId
          : saleId // ignore: cast_nullable_to_non_nullable
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      advancePaymentAmount: null == advancePaymentAmount
          ? _value.advancePaymentAmount
          : advancePaymentAmount // ignore: cast_nullable_to_non_nullable
              as double,
      client: null == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as ClientSummaryDto,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as UserSummaryDto?,
      professional: freezed == professional
          ? _value.professional
          : professional // ignore: cast_nullable_to_non_nullable
              as UserSummaryDto?,
      service: freezed == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as AppointmentServiceDto?,
      services: freezed == services
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<AppointmentServiceDto>?,
    ) as $Val);
  }

  /// Create a copy of AppointmentDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClientSummaryDtoCopyWith<$Res> get client {
    return $ClientSummaryDtoCopyWith<$Res>(_value.client, (value) {
      return _then(_value.copyWith(client: value) as $Val);
    });
  }

  /// Create a copy of AppointmentDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserSummaryDtoCopyWith<$Res>? get createdBy {
    if (_value.createdBy == null) {
      return null;
    }

    return $UserSummaryDtoCopyWith<$Res>(_value.createdBy!, (value) {
      return _then(_value.copyWith(createdBy: value) as $Val);
    });
  }

  /// Create a copy of AppointmentDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserSummaryDtoCopyWith<$Res>? get professional {
    if (_value.professional == null) {
      return null;
    }

    return $UserSummaryDtoCopyWith<$Res>(_value.professional!, (value) {
      return _then(_value.copyWith(professional: value) as $Val);
    });
  }

  /// Create a copy of AppointmentDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppointmentServiceDtoCopyWith<$Res>? get service {
    if (_value.service == null) {
      return null;
    }

    return $AppointmentServiceDtoCopyWith<$Res>(_value.service!, (value) {
      return _then(_value.copyWith(service: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppointmentDtoImplCopyWith<$Res>
    implements $AppointmentDtoCopyWith<$Res> {
  factory _$$AppointmentDtoImplCopyWith(_$AppointmentDtoImpl value,
          $Res Function(_$AppointmentDtoImpl) then) =
      __$$AppointmentDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'ticket_code') String? ticketCode,
      @JsonKey(name: 'client_id') int clientId,
      @JsonKey(name: 'created_by_id') int? createdById,
      @JsonKey(name: 'professional_id') int? professionalId,
      @JsonKey(name: 'service_id') int? serviceId,
      @JsonKey(name: 'service_ids') List<int>? serviceIds,
      @JsonKey(name: 'branch_id') int? branchId,
      @JsonKey(name: 'sale_id') int? saleId,
      @JsonKey(name: 'is_ia') bool isIa,
      @JsonKey(name: 'start_time') DateTime startTime,
      @JsonKey(name: 'end_time') DateTime endTime,
      String status,
      @JsonKey(name: 'advance_payment_amount') double advancePaymentAmount,
      ClientSummaryDto client,
      @JsonKey(name: 'created_by') UserSummaryDto? createdBy,
      UserSummaryDto? professional,
      AppointmentServiceDto? service,
      List<AppointmentServiceDto>? services});

  @override
  $ClientSummaryDtoCopyWith<$Res> get client;
  @override
  $UserSummaryDtoCopyWith<$Res>? get createdBy;
  @override
  $UserSummaryDtoCopyWith<$Res>? get professional;
  @override
  $AppointmentServiceDtoCopyWith<$Res>? get service;
}

/// @nodoc
class __$$AppointmentDtoImplCopyWithImpl<$Res>
    extends _$AppointmentDtoCopyWithImpl<$Res, _$AppointmentDtoImpl>
    implements _$$AppointmentDtoImplCopyWith<$Res> {
  __$$AppointmentDtoImplCopyWithImpl(
      _$AppointmentDtoImpl _value, $Res Function(_$AppointmentDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppointmentDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ticketCode = freezed,
    Object? clientId = null,
    Object? createdById = freezed,
    Object? professionalId = freezed,
    Object? serviceId = freezed,
    Object? serviceIds = freezed,
    Object? branchId = freezed,
    Object? saleId = freezed,
    Object? isIa = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? status = null,
    Object? advancePaymentAmount = null,
    Object? client = null,
    Object? createdBy = freezed,
    Object? professional = freezed,
    Object? service = freezed,
    Object? services = freezed,
  }) {
    return _then(_$AppointmentDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      ticketCode: freezed == ticketCode
          ? _value.ticketCode
          : ticketCode // ignore: cast_nullable_to_non_nullable
              as String?,
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as int,
      createdById: freezed == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int?,
      professionalId: freezed == professionalId
          ? _value.professionalId
          : professionalId // ignore: cast_nullable_to_non_nullable
              as int?,
      serviceId: freezed == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as int?,
      serviceIds: freezed == serviceIds
          ? _value._serviceIds
          : serviceIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
      saleId: freezed == saleId
          ? _value.saleId
          : saleId // ignore: cast_nullable_to_non_nullable
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      advancePaymentAmount: null == advancePaymentAmount
          ? _value.advancePaymentAmount
          : advancePaymentAmount // ignore: cast_nullable_to_non_nullable
              as double,
      client: null == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as ClientSummaryDto,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as UserSummaryDto?,
      professional: freezed == professional
          ? _value.professional
          : professional // ignore: cast_nullable_to_non_nullable
              as UserSummaryDto?,
      service: freezed == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as AppointmentServiceDto?,
      services: freezed == services
          ? _value._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<AppointmentServiceDto>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppointmentDtoImpl implements _AppointmentDto {
  const _$AppointmentDtoImpl(
      {required this.id,
      @JsonKey(name: 'ticket_code') this.ticketCode,
      @JsonKey(name: 'client_id') required this.clientId,
      @JsonKey(name: 'created_by_id') this.createdById,
      @JsonKey(name: 'professional_id') this.professionalId,
      @JsonKey(name: 'service_id') this.serviceId,
      @JsonKey(name: 'service_ids') final List<int>? serviceIds,
      @JsonKey(name: 'branch_id') this.branchId,
      @JsonKey(name: 'sale_id') this.saleId,
      @JsonKey(name: 'is_ia') this.isIa = false,
      @JsonKey(name: 'start_time') required this.startTime,
      @JsonKey(name: 'end_time') required this.endTime,
      this.status = 'pending',
      @JsonKey(name: 'advance_payment_amount') this.advancePaymentAmount = 0.0,
      required this.client,
      @JsonKey(name: 'created_by') this.createdBy,
      this.professional,
      this.service,
      final List<AppointmentServiceDto>? services})
      : _serviceIds = serviceIds,
        _services = services;

  factory _$AppointmentDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppointmentDtoImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'ticket_code')
  final String? ticketCode;
  @override
  @JsonKey(name: 'client_id')
  final int clientId;
  @override
  @JsonKey(name: 'created_by_id')
  final int? createdById;
  @override
  @JsonKey(name: 'professional_id')
  final int? professionalId;
  @override
  @JsonKey(name: 'service_id')
  final int? serviceId;
  final List<int>? _serviceIds;
  @override
  @JsonKey(name: 'service_ids')
  List<int>? get serviceIds {
    final value = _serviceIds;
    if (value == null) return null;
    if (_serviceIds is EqualUnmodifiableListView) return _serviceIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'branch_id')
  final int? branchId;
  @override
  @JsonKey(name: 'sale_id')
  final int? saleId;
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
  @JsonKey()
  final String status;
  @override
  @JsonKey(name: 'advance_payment_amount')
  final double advancePaymentAmount;
  @override
  final ClientSummaryDto client;
  @override
  @JsonKey(name: 'created_by')
  final UserSummaryDto? createdBy;
  @override
  final UserSummaryDto? professional;
  @override
  final AppointmentServiceDto? service;
  final List<AppointmentServiceDto>? _services;
  @override
  List<AppointmentServiceDto>? get services {
    final value = _services;
    if (value == null) return null;
    if (_services is EqualUnmodifiableListView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AppointmentDto(id: $id, ticketCode: $ticketCode, clientId: $clientId, createdById: $createdById, professionalId: $professionalId, serviceId: $serviceId, serviceIds: $serviceIds, branchId: $branchId, saleId: $saleId, isIa: $isIa, startTime: $startTime, endTime: $endTime, status: $status, advancePaymentAmount: $advancePaymentAmount, client: $client, createdBy: $createdBy, professional: $professional, service: $service, services: $services)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppointmentDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ticketCode, ticketCode) ||
                other.ticketCode == ticketCode) &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.professionalId, professionalId) ||
                other.professionalId == professionalId) &&
            (identical(other.serviceId, serviceId) ||
                other.serviceId == serviceId) &&
            const DeepCollectionEquality()
                .equals(other._serviceIds, _serviceIds) &&
            (identical(other.branchId, branchId) ||
                other.branchId == branchId) &&
            (identical(other.saleId, saleId) || other.saleId == saleId) &&
            (identical(other.isIa, isIa) || other.isIa == isIa) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.advancePaymentAmount, advancePaymentAmount) ||
                other.advancePaymentAmount == advancePaymentAmount) &&
            (identical(other.client, client) || other.client == client) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.professional, professional) ||
                other.professional == professional) &&
            (identical(other.service, service) || other.service == service) &&
            const DeepCollectionEquality().equals(other._services, _services));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        ticketCode,
        clientId,
        createdById,
        professionalId,
        serviceId,
        const DeepCollectionEquality().hash(_serviceIds),
        branchId,
        saleId,
        isIa,
        startTime,
        endTime,
        status,
        advancePaymentAmount,
        client,
        createdBy,
        professional,
        service,
        const DeepCollectionEquality().hash(_services)
      ]);

  /// Create a copy of AppointmentDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppointmentDtoImplCopyWith<_$AppointmentDtoImpl> get copyWith =>
      __$$AppointmentDtoImplCopyWithImpl<_$AppointmentDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppointmentDtoImplToJson(
      this,
    );
  }
}

abstract class _AppointmentDto implements AppointmentDto {
  const factory _AppointmentDto(
      {required final int id,
      @JsonKey(name: 'ticket_code') final String? ticketCode,
      @JsonKey(name: 'client_id') required final int clientId,
      @JsonKey(name: 'created_by_id') final int? createdById,
      @JsonKey(name: 'professional_id') final int? professionalId,
      @JsonKey(name: 'service_id') final int? serviceId,
      @JsonKey(name: 'service_ids') final List<int>? serviceIds,
      @JsonKey(name: 'branch_id') final int? branchId,
      @JsonKey(name: 'sale_id') final int? saleId,
      @JsonKey(name: 'is_ia') final bool isIa,
      @JsonKey(name: 'start_time') required final DateTime startTime,
      @JsonKey(name: 'end_time') required final DateTime endTime,
      final String status,
      @JsonKey(name: 'advance_payment_amount')
      final double advancePaymentAmount,
      required final ClientSummaryDto client,
      @JsonKey(name: 'created_by') final UserSummaryDto? createdBy,
      final UserSummaryDto? professional,
      final AppointmentServiceDto? service,
      final List<AppointmentServiceDto>? services}) = _$AppointmentDtoImpl;

  factory _AppointmentDto.fromJson(Map<String, dynamic> json) =
      _$AppointmentDtoImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'ticket_code')
  String? get ticketCode;
  @override
  @JsonKey(name: 'client_id')
  int get clientId;
  @override
  @JsonKey(name: 'created_by_id')
  int? get createdById;
  @override
  @JsonKey(name: 'professional_id')
  int? get professionalId;
  @override
  @JsonKey(name: 'service_id')
  int? get serviceId;
  @override
  @JsonKey(name: 'service_ids')
  List<int>? get serviceIds;
  @override
  @JsonKey(name: 'branch_id')
  int? get branchId;
  @override
  @JsonKey(name: 'sale_id')
  int? get saleId;
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
  String get status;
  @override
  @JsonKey(name: 'advance_payment_amount')
  double get advancePaymentAmount;
  @override
  ClientSummaryDto get client;
  @override
  @JsonKey(name: 'created_by')
  UserSummaryDto? get createdBy;
  @override
  UserSummaryDto? get professional;
  @override
  AppointmentServiceDto? get service;
  @override
  List<AppointmentServiceDto>? get services;

  /// Create a copy of AppointmentDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppointmentDtoImplCopyWith<_$AppointmentDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AppointmentCreateDto _$AppointmentCreateDtoFromJson(Map<String, dynamic> json) {
  return _AppointmentCreateDto.fromJson(json);
}

/// @nodoc
mixin _$AppointmentCreateDto {
  @JsonKey(name: 'client_id')
  int get clientId => throw _privateConstructorUsedError;
  @JsonKey(name: 'professional_id')
  int? get professionalId => throw _privateConstructorUsedError;
  @JsonKey(name: 'service_id')
  int? get serviceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'service_ids')
  List<int>? get serviceIds => throw _privateConstructorUsedError;
  @JsonKey(name: 'branch_id')
  int? get branchId => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_ia')
  bool get isIa => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  DateTime get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  DateTime get endTime => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'advance_payment_amount')
  double get advancePaymentAmount => throw _privateConstructorUsedError;

  /// Serializes this AppointmentCreateDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppointmentCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppointmentCreateDtoCopyWith<AppointmentCreateDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentCreateDtoCopyWith<$Res> {
  factory $AppointmentCreateDtoCopyWith(AppointmentCreateDto value,
          $Res Function(AppointmentCreateDto) then) =
      _$AppointmentCreateDtoCopyWithImpl<$Res, AppointmentCreateDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'client_id') int clientId,
      @JsonKey(name: 'professional_id') int? professionalId,
      @JsonKey(name: 'service_id') int? serviceId,
      @JsonKey(name: 'service_ids') List<int>? serviceIds,
      @JsonKey(name: 'branch_id') int? branchId,
      @JsonKey(name: 'is_ia') bool isIa,
      @JsonKey(name: 'start_time') DateTime startTime,
      @JsonKey(name: 'end_time') DateTime endTime,
      String status,
      @JsonKey(name: 'advance_payment_amount') double advancePaymentAmount});
}

/// @nodoc
class _$AppointmentCreateDtoCopyWithImpl<$Res,
        $Val extends AppointmentCreateDto>
    implements $AppointmentCreateDtoCopyWith<$Res> {
  _$AppointmentCreateDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppointmentCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientId = null,
    Object? professionalId = freezed,
    Object? serviceId = freezed,
    Object? serviceIds = freezed,
    Object? branchId = freezed,
    Object? isIa = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? status = null,
    Object? advancePaymentAmount = null,
  }) {
    return _then(_value.copyWith(
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as int,
      professionalId: freezed == professionalId
          ? _value.professionalId
          : professionalId // ignore: cast_nullable_to_non_nullable
              as int?,
      serviceId: freezed == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as int?,
      serviceIds: freezed == serviceIds
          ? _value.serviceIds
          : serviceIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      advancePaymentAmount: null == advancePaymentAmount
          ? _value.advancePaymentAmount
          : advancePaymentAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppointmentCreateDtoImplCopyWith<$Res>
    implements $AppointmentCreateDtoCopyWith<$Res> {
  factory _$$AppointmentCreateDtoImplCopyWith(_$AppointmentCreateDtoImpl value,
          $Res Function(_$AppointmentCreateDtoImpl) then) =
      __$$AppointmentCreateDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'client_id') int clientId,
      @JsonKey(name: 'professional_id') int? professionalId,
      @JsonKey(name: 'service_id') int? serviceId,
      @JsonKey(name: 'service_ids') List<int>? serviceIds,
      @JsonKey(name: 'branch_id') int? branchId,
      @JsonKey(name: 'is_ia') bool isIa,
      @JsonKey(name: 'start_time') DateTime startTime,
      @JsonKey(name: 'end_time') DateTime endTime,
      String status,
      @JsonKey(name: 'advance_payment_amount') double advancePaymentAmount});
}

/// @nodoc
class __$$AppointmentCreateDtoImplCopyWithImpl<$Res>
    extends _$AppointmentCreateDtoCopyWithImpl<$Res, _$AppointmentCreateDtoImpl>
    implements _$$AppointmentCreateDtoImplCopyWith<$Res> {
  __$$AppointmentCreateDtoImplCopyWithImpl(_$AppointmentCreateDtoImpl _value,
      $Res Function(_$AppointmentCreateDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppointmentCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientId = null,
    Object? professionalId = freezed,
    Object? serviceId = freezed,
    Object? serviceIds = freezed,
    Object? branchId = freezed,
    Object? isIa = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? status = null,
    Object? advancePaymentAmount = null,
  }) {
    return _then(_$AppointmentCreateDtoImpl(
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as int,
      professionalId: freezed == professionalId
          ? _value.professionalId
          : professionalId // ignore: cast_nullable_to_non_nullable
              as int?,
      serviceId: freezed == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as int?,
      serviceIds: freezed == serviceIds
          ? _value._serviceIds
          : serviceIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      advancePaymentAmount: null == advancePaymentAmount
          ? _value.advancePaymentAmount
          : advancePaymentAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppointmentCreateDtoImpl implements _AppointmentCreateDto {
  const _$AppointmentCreateDtoImpl(
      {@JsonKey(name: 'client_id') required this.clientId,
      @JsonKey(name: 'professional_id') this.professionalId,
      @JsonKey(name: 'service_id') this.serviceId,
      @JsonKey(name: 'service_ids') final List<int>? serviceIds,
      @JsonKey(name: 'branch_id') this.branchId,
      @JsonKey(name: 'is_ia') this.isIa = false,
      @JsonKey(name: 'start_time') required this.startTime,
      @JsonKey(name: 'end_time') required this.endTime,
      this.status = 'pending',
      @JsonKey(name: 'advance_payment_amount') this.advancePaymentAmount = 0.0})
      : _serviceIds = serviceIds;

  factory _$AppointmentCreateDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppointmentCreateDtoImplFromJson(json);

  @override
  @JsonKey(name: 'client_id')
  final int clientId;
  @override
  @JsonKey(name: 'professional_id')
  final int? professionalId;
  @override
  @JsonKey(name: 'service_id')
  final int? serviceId;
  final List<int>? _serviceIds;
  @override
  @JsonKey(name: 'service_ids')
  List<int>? get serviceIds {
    final value = _serviceIds;
    if (value == null) return null;
    if (_serviceIds is EqualUnmodifiableListView) return _serviceIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'branch_id')
  final int? branchId;
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
  @JsonKey()
  final String status;
  @override
  @JsonKey(name: 'advance_payment_amount')
  final double advancePaymentAmount;

  @override
  String toString() {
    return 'AppointmentCreateDto(clientId: $clientId, professionalId: $professionalId, serviceId: $serviceId, serviceIds: $serviceIds, branchId: $branchId, isIa: $isIa, startTime: $startTime, endTime: $endTime, status: $status, advancePaymentAmount: $advancePaymentAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppointmentCreateDtoImpl &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.professionalId, professionalId) ||
                other.professionalId == professionalId) &&
            (identical(other.serviceId, serviceId) ||
                other.serviceId == serviceId) &&
            const DeepCollectionEquality()
                .equals(other._serviceIds, _serviceIds) &&
            (identical(other.branchId, branchId) ||
                other.branchId == branchId) &&
            (identical(other.isIa, isIa) || other.isIa == isIa) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.advancePaymentAmount, advancePaymentAmount) ||
                other.advancePaymentAmount == advancePaymentAmount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      clientId,
      professionalId,
      serviceId,
      const DeepCollectionEquality().hash(_serviceIds),
      branchId,
      isIa,
      startTime,
      endTime,
      status,
      advancePaymentAmount);

  /// Create a copy of AppointmentCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppointmentCreateDtoImplCopyWith<_$AppointmentCreateDtoImpl>
      get copyWith =>
          __$$AppointmentCreateDtoImplCopyWithImpl<_$AppointmentCreateDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppointmentCreateDtoImplToJson(
      this,
    );
  }
}

abstract class _AppointmentCreateDto implements AppointmentCreateDto {
  const factory _AppointmentCreateDto(
      {@JsonKey(name: 'client_id') required final int clientId,
      @JsonKey(name: 'professional_id') final int? professionalId,
      @JsonKey(name: 'service_id') final int? serviceId,
      @JsonKey(name: 'service_ids') final List<int>? serviceIds,
      @JsonKey(name: 'branch_id') final int? branchId,
      @JsonKey(name: 'is_ia') final bool isIa,
      @JsonKey(name: 'start_time') required final DateTime startTime,
      @JsonKey(name: 'end_time') required final DateTime endTime,
      final String status,
      @JsonKey(name: 'advance_payment_amount')
      final double advancePaymentAmount}) = _$AppointmentCreateDtoImpl;

  factory _AppointmentCreateDto.fromJson(Map<String, dynamic> json) =
      _$AppointmentCreateDtoImpl.fromJson;

  @override
  @JsonKey(name: 'client_id')
  int get clientId;
  @override
  @JsonKey(name: 'professional_id')
  int? get professionalId;
  @override
  @JsonKey(name: 'service_id')
  int? get serviceId;
  @override
  @JsonKey(name: 'service_ids')
  List<int>? get serviceIds;
  @override
  @JsonKey(name: 'branch_id')
  int? get branchId;
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
  String get status;
  @override
  @JsonKey(name: 'advance_payment_amount')
  double get advancePaymentAmount;

  /// Create a copy of AppointmentCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppointmentCreateDtoImplCopyWith<_$AppointmentCreateDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AppointmentUpdateDto _$AppointmentUpdateDtoFromJson(Map<String, dynamic> json) {
  return _AppointmentUpdateDto.fromJson(json);
}

/// @nodoc
mixin _$AppointmentUpdateDto {
  @JsonKey(name: 'client_id')
  int? get clientId => throw _privateConstructorUsedError;
  @JsonKey(name: 'professional_id')
  int? get professionalId => throw _privateConstructorUsedError;
  @JsonKey(name: 'service_id')
  int? get serviceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'service_ids')
  List<int>? get serviceIds => throw _privateConstructorUsedError;
  @JsonKey(name: 'branch_id')
  int? get branchId => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_ia')
  bool? get isIa => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  DateTime? get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  DateTime? get endTime => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'skip_availability_check')
  bool get skipAvailabilityCheck => throw _privateConstructorUsedError;

  /// Serializes this AppointmentUpdateDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppointmentUpdateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppointmentUpdateDtoCopyWith<AppointmentUpdateDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentUpdateDtoCopyWith<$Res> {
  factory $AppointmentUpdateDtoCopyWith(AppointmentUpdateDto value,
          $Res Function(AppointmentUpdateDto) then) =
      _$AppointmentUpdateDtoCopyWithImpl<$Res, AppointmentUpdateDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'client_id') int? clientId,
      @JsonKey(name: 'professional_id') int? professionalId,
      @JsonKey(name: 'service_id') int? serviceId,
      @JsonKey(name: 'service_ids') List<int>? serviceIds,
      @JsonKey(name: 'branch_id') int? branchId,
      @JsonKey(name: 'is_ia') bool? isIa,
      @JsonKey(name: 'start_time') DateTime? startTime,
      @JsonKey(name: 'end_time') DateTime? endTime,
      String? status,
      @JsonKey(name: 'skip_availability_check') bool skipAvailabilityCheck});
}

/// @nodoc
class _$AppointmentUpdateDtoCopyWithImpl<$Res,
        $Val extends AppointmentUpdateDto>
    implements $AppointmentUpdateDtoCopyWith<$Res> {
  _$AppointmentUpdateDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppointmentUpdateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientId = freezed,
    Object? professionalId = freezed,
    Object? serviceId = freezed,
    Object? serviceIds = freezed,
    Object? branchId = freezed,
    Object? isIa = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? status = freezed,
    Object? skipAvailabilityCheck = null,
  }) {
    return _then(_value.copyWith(
      clientId: freezed == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as int?,
      professionalId: freezed == professionalId
          ? _value.professionalId
          : professionalId // ignore: cast_nullable_to_non_nullable
              as int?,
      serviceId: freezed == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as int?,
      serviceIds: freezed == serviceIds
          ? _value.serviceIds
          : serviceIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
      isIa: freezed == isIa
          ? _value.isIa
          : isIa // ignore: cast_nullable_to_non_nullable
              as bool?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      skipAvailabilityCheck: null == skipAvailabilityCheck
          ? _value.skipAvailabilityCheck
          : skipAvailabilityCheck // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppointmentUpdateDtoImplCopyWith<$Res>
    implements $AppointmentUpdateDtoCopyWith<$Res> {
  factory _$$AppointmentUpdateDtoImplCopyWith(_$AppointmentUpdateDtoImpl value,
          $Res Function(_$AppointmentUpdateDtoImpl) then) =
      __$$AppointmentUpdateDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'client_id') int? clientId,
      @JsonKey(name: 'professional_id') int? professionalId,
      @JsonKey(name: 'service_id') int? serviceId,
      @JsonKey(name: 'service_ids') List<int>? serviceIds,
      @JsonKey(name: 'branch_id') int? branchId,
      @JsonKey(name: 'is_ia') bool? isIa,
      @JsonKey(name: 'start_time') DateTime? startTime,
      @JsonKey(name: 'end_time') DateTime? endTime,
      String? status,
      @JsonKey(name: 'skip_availability_check') bool skipAvailabilityCheck});
}

/// @nodoc
class __$$AppointmentUpdateDtoImplCopyWithImpl<$Res>
    extends _$AppointmentUpdateDtoCopyWithImpl<$Res, _$AppointmentUpdateDtoImpl>
    implements _$$AppointmentUpdateDtoImplCopyWith<$Res> {
  __$$AppointmentUpdateDtoImplCopyWithImpl(_$AppointmentUpdateDtoImpl _value,
      $Res Function(_$AppointmentUpdateDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppointmentUpdateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientId = freezed,
    Object? professionalId = freezed,
    Object? serviceId = freezed,
    Object? serviceIds = freezed,
    Object? branchId = freezed,
    Object? isIa = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? status = freezed,
    Object? skipAvailabilityCheck = null,
  }) {
    return _then(_$AppointmentUpdateDtoImpl(
      clientId: freezed == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as int?,
      professionalId: freezed == professionalId
          ? _value.professionalId
          : professionalId // ignore: cast_nullable_to_non_nullable
              as int?,
      serviceId: freezed == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as int?,
      serviceIds: freezed == serviceIds
          ? _value._serviceIds
          : serviceIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
      isIa: freezed == isIa
          ? _value.isIa
          : isIa // ignore: cast_nullable_to_non_nullable
              as bool?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      skipAvailabilityCheck: null == skipAvailabilityCheck
          ? _value.skipAvailabilityCheck
          : skipAvailabilityCheck // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppointmentUpdateDtoImpl implements _AppointmentUpdateDto {
  const _$AppointmentUpdateDtoImpl(
      {@JsonKey(name: 'client_id') this.clientId,
      @JsonKey(name: 'professional_id') this.professionalId,
      @JsonKey(name: 'service_id') this.serviceId,
      @JsonKey(name: 'service_ids') final List<int>? serviceIds,
      @JsonKey(name: 'branch_id') this.branchId,
      @JsonKey(name: 'is_ia') this.isIa,
      @JsonKey(name: 'start_time') this.startTime,
      @JsonKey(name: 'end_time') this.endTime,
      this.status,
      @JsonKey(name: 'skip_availability_check')
      this.skipAvailabilityCheck = false})
      : _serviceIds = serviceIds;

  factory _$AppointmentUpdateDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppointmentUpdateDtoImplFromJson(json);

  @override
  @JsonKey(name: 'client_id')
  final int? clientId;
  @override
  @JsonKey(name: 'professional_id')
  final int? professionalId;
  @override
  @JsonKey(name: 'service_id')
  final int? serviceId;
  final List<int>? _serviceIds;
  @override
  @JsonKey(name: 'service_ids')
  List<int>? get serviceIds {
    final value = _serviceIds;
    if (value == null) return null;
    if (_serviceIds is EqualUnmodifiableListView) return _serviceIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'branch_id')
  final int? branchId;
  @override
  @JsonKey(name: 'is_ia')
  final bool? isIa;
  @override
  @JsonKey(name: 'start_time')
  final DateTime? startTime;
  @override
  @JsonKey(name: 'end_time')
  final DateTime? endTime;
  @override
  final String? status;
  @override
  @JsonKey(name: 'skip_availability_check')
  final bool skipAvailabilityCheck;

  @override
  String toString() {
    return 'AppointmentUpdateDto(clientId: $clientId, professionalId: $professionalId, serviceId: $serviceId, serviceIds: $serviceIds, branchId: $branchId, isIa: $isIa, startTime: $startTime, endTime: $endTime, status: $status, skipAvailabilityCheck: $skipAvailabilityCheck)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppointmentUpdateDtoImpl &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.professionalId, professionalId) ||
                other.professionalId == professionalId) &&
            (identical(other.serviceId, serviceId) ||
                other.serviceId == serviceId) &&
            const DeepCollectionEquality()
                .equals(other._serviceIds, _serviceIds) &&
            (identical(other.branchId, branchId) ||
                other.branchId == branchId) &&
            (identical(other.isIa, isIa) || other.isIa == isIa) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.skipAvailabilityCheck, skipAvailabilityCheck) ||
                other.skipAvailabilityCheck == skipAvailabilityCheck));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      clientId,
      professionalId,
      serviceId,
      const DeepCollectionEquality().hash(_serviceIds),
      branchId,
      isIa,
      startTime,
      endTime,
      status,
      skipAvailabilityCheck);

  /// Create a copy of AppointmentUpdateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppointmentUpdateDtoImplCopyWith<_$AppointmentUpdateDtoImpl>
      get copyWith =>
          __$$AppointmentUpdateDtoImplCopyWithImpl<_$AppointmentUpdateDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppointmentUpdateDtoImplToJson(
      this,
    );
  }
}

abstract class _AppointmentUpdateDto implements AppointmentUpdateDto {
  const factory _AppointmentUpdateDto(
      {@JsonKey(name: 'client_id') final int? clientId,
      @JsonKey(name: 'professional_id') final int? professionalId,
      @JsonKey(name: 'service_id') final int? serviceId,
      @JsonKey(name: 'service_ids') final List<int>? serviceIds,
      @JsonKey(name: 'branch_id') final int? branchId,
      @JsonKey(name: 'is_ia') final bool? isIa,
      @JsonKey(name: 'start_time') final DateTime? startTime,
      @JsonKey(name: 'end_time') final DateTime? endTime,
      final String? status,
      @JsonKey(name: 'skip_availability_check')
      final bool skipAvailabilityCheck}) = _$AppointmentUpdateDtoImpl;

  factory _AppointmentUpdateDto.fromJson(Map<String, dynamic> json) =
      _$AppointmentUpdateDtoImpl.fromJson;

  @override
  @JsonKey(name: 'client_id')
  int? get clientId;
  @override
  @JsonKey(name: 'professional_id')
  int? get professionalId;
  @override
  @JsonKey(name: 'service_id')
  int? get serviceId;
  @override
  @JsonKey(name: 'service_ids')
  List<int>? get serviceIds;
  @override
  @JsonKey(name: 'branch_id')
  int? get branchId;
  @override
  @JsonKey(name: 'is_ia')
  bool? get isIa;
  @override
  @JsonKey(name: 'start_time')
  DateTime? get startTime;
  @override
  @JsonKey(name: 'end_time')
  DateTime? get endTime;
  @override
  String? get status;
  @override
  @JsonKey(name: 'skip_availability_check')
  bool get skipAvailabilityCheck;

  /// Create a copy of AppointmentUpdateDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppointmentUpdateDtoImplCopyWith<_$AppointmentUpdateDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

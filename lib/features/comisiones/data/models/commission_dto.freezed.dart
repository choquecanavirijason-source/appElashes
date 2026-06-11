// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'commission_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommissionPaymentDto _$CommissionPaymentDtoFromJson(Map<String, dynamic> json) {
  return _CommissionPaymentDto.fromJson(json);
}

/// @nodoc
mixin _$CommissionPaymentDto {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'professional_id')
  int get professionalId => throw _privateConstructorUsedError;
  @JsonKey(name: 'professional_name')
  String get professionalName => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'period_start')
  String? get periodStart => throw _privateConstructorUsedError;
  @JsonKey(name: 'period_end')
  String? get periodEnd => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'registered_at')
  String get registeredAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'registered_by_name')
  String? get registeredByName => throw _privateConstructorUsedError;

  /// Serializes this CommissionPaymentDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommissionPaymentDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommissionPaymentDtoCopyWith<CommissionPaymentDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommissionPaymentDtoCopyWith<$Res> {
  factory $CommissionPaymentDtoCopyWith(CommissionPaymentDto value,
          $Res Function(CommissionPaymentDto) then) =
      _$CommissionPaymentDtoCopyWithImpl<$Res, CommissionPaymentDto>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'professional_id') int professionalId,
      @JsonKey(name: 'professional_name') String professionalName,
      double amount,
      @JsonKey(name: 'period_start') String? periodStart,
      @JsonKey(name: 'period_end') String? periodEnd,
      String? notes,
      @JsonKey(name: 'registered_at') String registeredAt,
      @JsonKey(name: 'registered_by_name') String? registeredByName});
}

/// @nodoc
class _$CommissionPaymentDtoCopyWithImpl<$Res,
        $Val extends CommissionPaymentDto>
    implements $CommissionPaymentDtoCopyWith<$Res> {
  _$CommissionPaymentDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommissionPaymentDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? professionalId = null,
    Object? professionalName = null,
    Object? amount = null,
    Object? periodStart = freezed,
    Object? periodEnd = freezed,
    Object? notes = freezed,
    Object? registeredAt = null,
    Object? registeredByName = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      professionalId: null == professionalId
          ? _value.professionalId
          : professionalId // ignore: cast_nullable_to_non_nullable
              as int,
      professionalName: null == professionalName
          ? _value.professionalName
          : professionalName // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      periodStart: freezed == periodStart
          ? _value.periodStart
          : periodStart // ignore: cast_nullable_to_non_nullable
              as String?,
      periodEnd: freezed == periodEnd
          ? _value.periodEnd
          : periodEnd // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      registeredAt: null == registeredAt
          ? _value.registeredAt
          : registeredAt // ignore: cast_nullable_to_non_nullable
              as String,
      registeredByName: freezed == registeredByName
          ? _value.registeredByName
          : registeredByName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommissionPaymentDtoImplCopyWith<$Res>
    implements $CommissionPaymentDtoCopyWith<$Res> {
  factory _$$CommissionPaymentDtoImplCopyWith(_$CommissionPaymentDtoImpl value,
          $Res Function(_$CommissionPaymentDtoImpl) then) =
      __$$CommissionPaymentDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'professional_id') int professionalId,
      @JsonKey(name: 'professional_name') String professionalName,
      double amount,
      @JsonKey(name: 'period_start') String? periodStart,
      @JsonKey(name: 'period_end') String? periodEnd,
      String? notes,
      @JsonKey(name: 'registered_at') String registeredAt,
      @JsonKey(name: 'registered_by_name') String? registeredByName});
}

/// @nodoc
class __$$CommissionPaymentDtoImplCopyWithImpl<$Res>
    extends _$CommissionPaymentDtoCopyWithImpl<$Res, _$CommissionPaymentDtoImpl>
    implements _$$CommissionPaymentDtoImplCopyWith<$Res> {
  __$$CommissionPaymentDtoImplCopyWithImpl(_$CommissionPaymentDtoImpl _value,
      $Res Function(_$CommissionPaymentDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommissionPaymentDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? professionalId = null,
    Object? professionalName = null,
    Object? amount = null,
    Object? periodStart = freezed,
    Object? periodEnd = freezed,
    Object? notes = freezed,
    Object? registeredAt = null,
    Object? registeredByName = freezed,
  }) {
    return _then(_$CommissionPaymentDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      professionalId: null == professionalId
          ? _value.professionalId
          : professionalId // ignore: cast_nullable_to_non_nullable
              as int,
      professionalName: null == professionalName
          ? _value.professionalName
          : professionalName // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      periodStart: freezed == periodStart
          ? _value.periodStart
          : periodStart // ignore: cast_nullable_to_non_nullable
              as String?,
      periodEnd: freezed == periodEnd
          ? _value.periodEnd
          : periodEnd // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      registeredAt: null == registeredAt
          ? _value.registeredAt
          : registeredAt // ignore: cast_nullable_to_non_nullable
              as String,
      registeredByName: freezed == registeredByName
          ? _value.registeredByName
          : registeredByName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommissionPaymentDtoImpl implements _CommissionPaymentDto {
  const _$CommissionPaymentDtoImpl(
      {required this.id,
      @JsonKey(name: 'professional_id') required this.professionalId,
      @JsonKey(name: 'professional_name') required this.professionalName,
      required this.amount,
      @JsonKey(name: 'period_start') this.periodStart,
      @JsonKey(name: 'period_end') this.periodEnd,
      this.notes,
      @JsonKey(name: 'registered_at') required this.registeredAt,
      @JsonKey(name: 'registered_by_name') this.registeredByName});

  factory _$CommissionPaymentDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommissionPaymentDtoImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'professional_id')
  final int professionalId;
  @override
  @JsonKey(name: 'professional_name')
  final String professionalName;
  @override
  final double amount;
  @override
  @JsonKey(name: 'period_start')
  final String? periodStart;
  @override
  @JsonKey(name: 'period_end')
  final String? periodEnd;
  @override
  final String? notes;
  @override
  @JsonKey(name: 'registered_at')
  final String registeredAt;
  @override
  @JsonKey(name: 'registered_by_name')
  final String? registeredByName;

  @override
  String toString() {
    return 'CommissionPaymentDto(id: $id, professionalId: $professionalId, professionalName: $professionalName, amount: $amount, periodStart: $periodStart, periodEnd: $periodEnd, notes: $notes, registeredAt: $registeredAt, registeredByName: $registeredByName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommissionPaymentDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.professionalId, professionalId) ||
                other.professionalId == professionalId) &&
            (identical(other.professionalName, professionalName) ||
                other.professionalName == professionalName) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.periodStart, periodStart) ||
                other.periodStart == periodStart) &&
            (identical(other.periodEnd, periodEnd) ||
                other.periodEnd == periodEnd) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.registeredAt, registeredAt) ||
                other.registeredAt == registeredAt) &&
            (identical(other.registeredByName, registeredByName) ||
                other.registeredByName == registeredByName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      professionalId,
      professionalName,
      amount,
      periodStart,
      periodEnd,
      notes,
      registeredAt,
      registeredByName);

  /// Create a copy of CommissionPaymentDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommissionPaymentDtoImplCopyWith<_$CommissionPaymentDtoImpl>
      get copyWith =>
          __$$CommissionPaymentDtoImplCopyWithImpl<_$CommissionPaymentDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommissionPaymentDtoImplToJson(
      this,
    );
  }
}

abstract class _CommissionPaymentDto implements CommissionPaymentDto {
  const factory _CommissionPaymentDto(
      {required final int id,
      @JsonKey(name: 'professional_id') required final int professionalId,
      @JsonKey(name: 'professional_name')
      required final String professionalName,
      required final double amount,
      @JsonKey(name: 'period_start') final String? periodStart,
      @JsonKey(name: 'period_end') final String? periodEnd,
      final String? notes,
      @JsonKey(name: 'registered_at') required final String registeredAt,
      @JsonKey(name: 'registered_by_name')
      final String? registeredByName}) = _$CommissionPaymentDtoImpl;

  factory _CommissionPaymentDto.fromJson(Map<String, dynamic> json) =
      _$CommissionPaymentDtoImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'professional_id')
  int get professionalId;
  @override
  @JsonKey(name: 'professional_name')
  String get professionalName;
  @override
  double get amount;
  @override
  @JsonKey(name: 'period_start')
  String? get periodStart;
  @override
  @JsonKey(name: 'period_end')
  String? get periodEnd;
  @override
  String? get notes;
  @override
  @JsonKey(name: 'registered_at')
  String get registeredAt;
  @override
  @JsonKey(name: 'registered_by_name')
  String? get registeredByName;

  /// Create a copy of CommissionPaymentDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommissionPaymentDtoImplCopyWith<_$CommissionPaymentDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CommissionPaymentCreateDto _$CommissionPaymentCreateDtoFromJson(
    Map<String, dynamic> json) {
  return _CommissionPaymentCreateDto.fromJson(json);
}

/// @nodoc
mixin _$CommissionPaymentCreateDto {
  @JsonKey(name: 'professional_id')
  int get professionalId => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'period_start')
  String? get periodStart => throw _privateConstructorUsedError;
  @JsonKey(name: 'period_end')
  String? get periodEnd => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this CommissionPaymentCreateDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommissionPaymentCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommissionPaymentCreateDtoCopyWith<CommissionPaymentCreateDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommissionPaymentCreateDtoCopyWith<$Res> {
  factory $CommissionPaymentCreateDtoCopyWith(CommissionPaymentCreateDto value,
          $Res Function(CommissionPaymentCreateDto) then) =
      _$CommissionPaymentCreateDtoCopyWithImpl<$Res,
          CommissionPaymentCreateDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'professional_id') int professionalId,
      double amount,
      @JsonKey(name: 'period_start') String? periodStart,
      @JsonKey(name: 'period_end') String? periodEnd,
      String? notes});
}

/// @nodoc
class _$CommissionPaymentCreateDtoCopyWithImpl<$Res,
        $Val extends CommissionPaymentCreateDto>
    implements $CommissionPaymentCreateDtoCopyWith<$Res> {
  _$CommissionPaymentCreateDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommissionPaymentCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? professionalId = null,
    Object? amount = null,
    Object? periodStart = freezed,
    Object? periodEnd = freezed,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      professionalId: null == professionalId
          ? _value.professionalId
          : professionalId // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      periodStart: freezed == periodStart
          ? _value.periodStart
          : periodStart // ignore: cast_nullable_to_non_nullable
              as String?,
      periodEnd: freezed == periodEnd
          ? _value.periodEnd
          : periodEnd // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommissionPaymentCreateDtoImplCopyWith<$Res>
    implements $CommissionPaymentCreateDtoCopyWith<$Res> {
  factory _$$CommissionPaymentCreateDtoImplCopyWith(
          _$CommissionPaymentCreateDtoImpl value,
          $Res Function(_$CommissionPaymentCreateDtoImpl) then) =
      __$$CommissionPaymentCreateDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'professional_id') int professionalId,
      double amount,
      @JsonKey(name: 'period_start') String? periodStart,
      @JsonKey(name: 'period_end') String? periodEnd,
      String? notes});
}

/// @nodoc
class __$$CommissionPaymentCreateDtoImplCopyWithImpl<$Res>
    extends _$CommissionPaymentCreateDtoCopyWithImpl<$Res,
        _$CommissionPaymentCreateDtoImpl>
    implements _$$CommissionPaymentCreateDtoImplCopyWith<$Res> {
  __$$CommissionPaymentCreateDtoImplCopyWithImpl(
      _$CommissionPaymentCreateDtoImpl _value,
      $Res Function(_$CommissionPaymentCreateDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommissionPaymentCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? professionalId = null,
    Object? amount = null,
    Object? periodStart = freezed,
    Object? periodEnd = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$CommissionPaymentCreateDtoImpl(
      professionalId: null == professionalId
          ? _value.professionalId
          : professionalId // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      periodStart: freezed == periodStart
          ? _value.periodStart
          : periodStart // ignore: cast_nullable_to_non_nullable
              as String?,
      periodEnd: freezed == periodEnd
          ? _value.periodEnd
          : periodEnd // ignore: cast_nullable_to_non_nullable
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
class _$CommissionPaymentCreateDtoImpl implements _CommissionPaymentCreateDto {
  const _$CommissionPaymentCreateDtoImpl(
      {@JsonKey(name: 'professional_id') required this.professionalId,
      required this.amount,
      @JsonKey(name: 'period_start') this.periodStart,
      @JsonKey(name: 'period_end') this.periodEnd,
      this.notes});

  factory _$CommissionPaymentCreateDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CommissionPaymentCreateDtoImplFromJson(json);

  @override
  @JsonKey(name: 'professional_id')
  final int professionalId;
  @override
  final double amount;
  @override
  @JsonKey(name: 'period_start')
  final String? periodStart;
  @override
  @JsonKey(name: 'period_end')
  final String? periodEnd;
  @override
  final String? notes;

  @override
  String toString() {
    return 'CommissionPaymentCreateDto(professionalId: $professionalId, amount: $amount, periodStart: $periodStart, periodEnd: $periodEnd, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommissionPaymentCreateDtoImpl &&
            (identical(other.professionalId, professionalId) ||
                other.professionalId == professionalId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.periodStart, periodStart) ||
                other.periodStart == periodStart) &&
            (identical(other.periodEnd, periodEnd) ||
                other.periodEnd == periodEnd) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, professionalId, amount, periodStart, periodEnd, notes);

  /// Create a copy of CommissionPaymentCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommissionPaymentCreateDtoImplCopyWith<_$CommissionPaymentCreateDtoImpl>
      get copyWith => __$$CommissionPaymentCreateDtoImplCopyWithImpl<
          _$CommissionPaymentCreateDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommissionPaymentCreateDtoImplToJson(
      this,
    );
  }
}

abstract class _CommissionPaymentCreateDto
    implements CommissionPaymentCreateDto {
  const factory _CommissionPaymentCreateDto(
      {@JsonKey(name: 'professional_id') required final int professionalId,
      required final double amount,
      @JsonKey(name: 'period_start') final String? periodStart,
      @JsonKey(name: 'period_end') final String? periodEnd,
      final String? notes}) = _$CommissionPaymentCreateDtoImpl;

  factory _CommissionPaymentCreateDto.fromJson(Map<String, dynamic> json) =
      _$CommissionPaymentCreateDtoImpl.fromJson;

  @override
  @JsonKey(name: 'professional_id')
  int get professionalId;
  @override
  double get amount;
  @override
  @JsonKey(name: 'period_start')
  String? get periodStart;
  @override
  @JsonKey(name: 'period_end')
  String? get periodEnd;
  @override
  String? get notes;

  /// Create a copy of CommissionPaymentCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommissionPaymentCreateDtoImplCopyWith<_$CommissionPaymentCreateDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ProfessionalOptionDto _$ProfessionalOptionDtoFromJson(
    Map<String, dynamic> json) {
  return _ProfessionalOptionDto.fromJson(json);
}

/// @nodoc
mixin _$ProfessionalOptionDto {
  int get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;

  /// Serializes this ProfessionalOptionDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfessionalOptionDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfessionalOptionDtoCopyWith<ProfessionalOptionDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfessionalOptionDtoCopyWith<$Res> {
  factory $ProfessionalOptionDtoCopyWith(ProfessionalOptionDto value,
          $Res Function(ProfessionalOptionDto) then) =
      _$ProfessionalOptionDtoCopyWithImpl<$Res, ProfessionalOptionDto>;
  @useResult
  $Res call({int id, String username, String? email});
}

/// @nodoc
class _$ProfessionalOptionDtoCopyWithImpl<$Res,
        $Val extends ProfessionalOptionDto>
    implements $ProfessionalOptionDtoCopyWith<$Res> {
  _$ProfessionalOptionDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfessionalOptionDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? email = freezed,
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
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfessionalOptionDtoImplCopyWith<$Res>
    implements $ProfessionalOptionDtoCopyWith<$Res> {
  factory _$$ProfessionalOptionDtoImplCopyWith(
          _$ProfessionalOptionDtoImpl value,
          $Res Function(_$ProfessionalOptionDtoImpl) then) =
      __$$ProfessionalOptionDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String username, String? email});
}

/// @nodoc
class __$$ProfessionalOptionDtoImplCopyWithImpl<$Res>
    extends _$ProfessionalOptionDtoCopyWithImpl<$Res,
        _$ProfessionalOptionDtoImpl>
    implements _$$ProfessionalOptionDtoImplCopyWith<$Res> {
  __$$ProfessionalOptionDtoImplCopyWithImpl(_$ProfessionalOptionDtoImpl _value,
      $Res Function(_$ProfessionalOptionDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfessionalOptionDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? email = freezed,
  }) {
    return _then(_$ProfessionalOptionDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfessionalOptionDtoImpl implements _ProfessionalOptionDto {
  const _$ProfessionalOptionDtoImpl(
      {required this.id, required this.username, this.email});

  factory _$ProfessionalOptionDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfessionalOptionDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String username;
  @override
  final String? email;

  @override
  String toString() {
    return 'ProfessionalOptionDto(id: $id, username: $username, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfessionalOptionDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, username, email);

  /// Create a copy of ProfessionalOptionDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfessionalOptionDtoImplCopyWith<_$ProfessionalOptionDtoImpl>
      get copyWith => __$$ProfessionalOptionDtoImplCopyWithImpl<
          _$ProfessionalOptionDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfessionalOptionDtoImplToJson(
      this,
    );
  }
}

abstract class _ProfessionalOptionDto implements ProfessionalOptionDto {
  const factory _ProfessionalOptionDto(
      {required final int id,
      required final String username,
      final String? email}) = _$ProfessionalOptionDtoImpl;

  factory _ProfessionalOptionDto.fromJson(Map<String, dynamic> json) =
      _$ProfessionalOptionDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get username;
  @override
  String? get email;

  /// Create a copy of ProfessionalOptionDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfessionalOptionDtoImplCopyWith<_$ProfessionalOptionDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

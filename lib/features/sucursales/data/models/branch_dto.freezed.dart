// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'branch_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BranchTimeRangeDto _$BranchTimeRangeDtoFromJson(Map<String, dynamic> json) {
  return _BranchTimeRangeDto.fromJson(json);
}

/// @nodoc
mixin _$BranchTimeRangeDto {
  @JsonKey(name: 'open_time')
  String get openTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'close_time')
  String get closeTime => throw _privateConstructorUsedError;

  /// Serializes this BranchTimeRangeDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BranchTimeRangeDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BranchTimeRangeDtoCopyWith<BranchTimeRangeDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BranchTimeRangeDtoCopyWith<$Res> {
  factory $BranchTimeRangeDtoCopyWith(
          BranchTimeRangeDto value, $Res Function(BranchTimeRangeDto) then) =
      _$BranchTimeRangeDtoCopyWithImpl<$Res, BranchTimeRangeDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'open_time') String openTime,
      @JsonKey(name: 'close_time') String closeTime});
}

/// @nodoc
class _$BranchTimeRangeDtoCopyWithImpl<$Res, $Val extends BranchTimeRangeDto>
    implements $BranchTimeRangeDtoCopyWith<$Res> {
  _$BranchTimeRangeDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BranchTimeRangeDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? openTime = null,
    Object? closeTime = null,
  }) {
    return _then(_value.copyWith(
      openTime: null == openTime
          ? _value.openTime
          : openTime // ignore: cast_nullable_to_non_nullable
              as String,
      closeTime: null == closeTime
          ? _value.closeTime
          : closeTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BranchTimeRangeDtoImplCopyWith<$Res>
    implements $BranchTimeRangeDtoCopyWith<$Res> {
  factory _$$BranchTimeRangeDtoImplCopyWith(_$BranchTimeRangeDtoImpl value,
          $Res Function(_$BranchTimeRangeDtoImpl) then) =
      __$$BranchTimeRangeDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'open_time') String openTime,
      @JsonKey(name: 'close_time') String closeTime});
}

/// @nodoc
class __$$BranchTimeRangeDtoImplCopyWithImpl<$Res>
    extends _$BranchTimeRangeDtoCopyWithImpl<$Res, _$BranchTimeRangeDtoImpl>
    implements _$$BranchTimeRangeDtoImplCopyWith<$Res> {
  __$$BranchTimeRangeDtoImplCopyWithImpl(_$BranchTimeRangeDtoImpl _value,
      $Res Function(_$BranchTimeRangeDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of BranchTimeRangeDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? openTime = null,
    Object? closeTime = null,
  }) {
    return _then(_$BranchTimeRangeDtoImpl(
      openTime: null == openTime
          ? _value.openTime
          : openTime // ignore: cast_nullable_to_non_nullable
              as String,
      closeTime: null == closeTime
          ? _value.closeTime
          : closeTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BranchTimeRangeDtoImpl implements _BranchTimeRangeDto {
  const _$BranchTimeRangeDtoImpl(
      {@JsonKey(name: 'open_time') required this.openTime,
      @JsonKey(name: 'close_time') required this.closeTime});

  factory _$BranchTimeRangeDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$BranchTimeRangeDtoImplFromJson(json);

  @override
  @JsonKey(name: 'open_time')
  final String openTime;
  @override
  @JsonKey(name: 'close_time')
  final String closeTime;

  @override
  String toString() {
    return 'BranchTimeRangeDto(openTime: $openTime, closeTime: $closeTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BranchTimeRangeDtoImpl &&
            (identical(other.openTime, openTime) ||
                other.openTime == openTime) &&
            (identical(other.closeTime, closeTime) ||
                other.closeTime == closeTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, openTime, closeTime);

  /// Create a copy of BranchTimeRangeDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BranchTimeRangeDtoImplCopyWith<_$BranchTimeRangeDtoImpl> get copyWith =>
      __$$BranchTimeRangeDtoImplCopyWithImpl<_$BranchTimeRangeDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BranchTimeRangeDtoImplToJson(
      this,
    );
  }
}

abstract class _BranchTimeRangeDto implements BranchTimeRangeDto {
  const factory _BranchTimeRangeDto(
          {@JsonKey(name: 'open_time') required final String openTime,
          @JsonKey(name: 'close_time') required final String closeTime}) =
      _$BranchTimeRangeDtoImpl;

  factory _BranchTimeRangeDto.fromJson(Map<String, dynamic> json) =
      _$BranchTimeRangeDtoImpl.fromJson;

  @override
  @JsonKey(name: 'open_time')
  String get openTime;
  @override
  @JsonKey(name: 'close_time')
  String get closeTime;

  /// Create a copy of BranchTimeRangeDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BranchTimeRangeDtoImplCopyWith<_$BranchTimeRangeDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BranchDayScheduleDto _$BranchDayScheduleDtoFromJson(Map<String, dynamic> json) {
  return _BranchDayScheduleDto.fromJson(json);
}

/// @nodoc
mixin _$BranchDayScheduleDto {
  String get day => throw _privateConstructorUsedError;
  List<BranchTimeRangeDto> get ranges => throw _privateConstructorUsedError;

  /// Serializes this BranchDayScheduleDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BranchDayScheduleDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BranchDayScheduleDtoCopyWith<BranchDayScheduleDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BranchDayScheduleDtoCopyWith<$Res> {
  factory $BranchDayScheduleDtoCopyWith(BranchDayScheduleDto value,
          $Res Function(BranchDayScheduleDto) then) =
      _$BranchDayScheduleDtoCopyWithImpl<$Res, BranchDayScheduleDto>;
  @useResult
  $Res call({String day, List<BranchTimeRangeDto> ranges});
}

/// @nodoc
class _$BranchDayScheduleDtoCopyWithImpl<$Res,
        $Val extends BranchDayScheduleDto>
    implements $BranchDayScheduleDtoCopyWith<$Res> {
  _$BranchDayScheduleDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BranchDayScheduleDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? ranges = null,
  }) {
    return _then(_value.copyWith(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String,
      ranges: null == ranges
          ? _value.ranges
          : ranges // ignore: cast_nullable_to_non_nullable
              as List<BranchTimeRangeDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BranchDayScheduleDtoImplCopyWith<$Res>
    implements $BranchDayScheduleDtoCopyWith<$Res> {
  factory _$$BranchDayScheduleDtoImplCopyWith(_$BranchDayScheduleDtoImpl value,
          $Res Function(_$BranchDayScheduleDtoImpl) then) =
      __$$BranchDayScheduleDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String day, List<BranchTimeRangeDto> ranges});
}

/// @nodoc
class __$$BranchDayScheduleDtoImplCopyWithImpl<$Res>
    extends _$BranchDayScheduleDtoCopyWithImpl<$Res, _$BranchDayScheduleDtoImpl>
    implements _$$BranchDayScheduleDtoImplCopyWith<$Res> {
  __$$BranchDayScheduleDtoImplCopyWithImpl(_$BranchDayScheduleDtoImpl _value,
      $Res Function(_$BranchDayScheduleDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of BranchDayScheduleDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? ranges = null,
  }) {
    return _then(_$BranchDayScheduleDtoImpl(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String,
      ranges: null == ranges
          ? _value._ranges
          : ranges // ignore: cast_nullable_to_non_nullable
              as List<BranchTimeRangeDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BranchDayScheduleDtoImpl implements _BranchDayScheduleDto {
  const _$BranchDayScheduleDtoImpl(
      {required this.day, final List<BranchTimeRangeDto> ranges = const []})
      : _ranges = ranges;

  factory _$BranchDayScheduleDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$BranchDayScheduleDtoImplFromJson(json);

  @override
  final String day;
  final List<BranchTimeRangeDto> _ranges;
  @override
  @JsonKey()
  List<BranchTimeRangeDto> get ranges {
    if (_ranges is EqualUnmodifiableListView) return _ranges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ranges);
  }

  @override
  String toString() {
    return 'BranchDayScheduleDto(day: $day, ranges: $ranges)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BranchDayScheduleDtoImpl &&
            (identical(other.day, day) || other.day == day) &&
            const DeepCollectionEquality().equals(other._ranges, _ranges));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, day, const DeepCollectionEquality().hash(_ranges));

  /// Create a copy of BranchDayScheduleDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BranchDayScheduleDtoImplCopyWith<_$BranchDayScheduleDtoImpl>
      get copyWith =>
          __$$BranchDayScheduleDtoImplCopyWithImpl<_$BranchDayScheduleDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BranchDayScheduleDtoImplToJson(
      this,
    );
  }
}

abstract class _BranchDayScheduleDto implements BranchDayScheduleDto {
  const factory _BranchDayScheduleDto(
      {required final String day,
      final List<BranchTimeRangeDto> ranges}) = _$BranchDayScheduleDtoImpl;

  factory _BranchDayScheduleDto.fromJson(Map<String, dynamic> json) =
      _$BranchDayScheduleDtoImpl.fromJson;

  @override
  String get day;
  @override
  List<BranchTimeRangeDto> get ranges;

  /// Create a copy of BranchDayScheduleDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BranchDayScheduleDtoImplCopyWith<_$BranchDayScheduleDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

BranchDto _$BranchDtoFromJson(Map<String, dynamic> json) {
  return _BranchDto.fromJson(json);
}

/// @nodoc
mixin _$BranchDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get department => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'opening_hours')
  List<BranchDayScheduleDto> get openingHours =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'user_ids')
  List<int> get userIds => throw _privateConstructorUsedError;

  /// Serializes this BranchDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BranchDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BranchDtoCopyWith<BranchDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BranchDtoCopyWith<$Res> {
  factory $BranchDtoCopyWith(BranchDto value, $Res Function(BranchDto) then) =
      _$BranchDtoCopyWithImpl<$Res, BranchDto>;
  @useResult
  $Res call(
      {int id,
      String name,
      String? address,
      String? city,
      String? department,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'opening_hours') List<BranchDayScheduleDto> openingHours,
      @JsonKey(name: 'user_ids') List<int> userIds});
}

/// @nodoc
class _$BranchDtoCopyWithImpl<$Res, $Val extends BranchDto>
    implements $BranchDtoCopyWith<$Res> {
  _$BranchDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BranchDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = freezed,
    Object? city = freezed,
    Object? department = freezed,
    Object? isActive = null,
    Object? openingHours = null,
    Object? userIds = null,
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
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      openingHours: null == openingHours
          ? _value.openingHours
          : openingHours // ignore: cast_nullable_to_non_nullable
              as List<BranchDayScheduleDto>,
      userIds: null == userIds
          ? _value.userIds
          : userIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BranchDtoImplCopyWith<$Res>
    implements $BranchDtoCopyWith<$Res> {
  factory _$$BranchDtoImplCopyWith(
          _$BranchDtoImpl value, $Res Function(_$BranchDtoImpl) then) =
      __$$BranchDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String? address,
      String? city,
      String? department,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'opening_hours') List<BranchDayScheduleDto> openingHours,
      @JsonKey(name: 'user_ids') List<int> userIds});
}

/// @nodoc
class __$$BranchDtoImplCopyWithImpl<$Res>
    extends _$BranchDtoCopyWithImpl<$Res, _$BranchDtoImpl>
    implements _$$BranchDtoImplCopyWith<$Res> {
  __$$BranchDtoImplCopyWithImpl(
      _$BranchDtoImpl _value, $Res Function(_$BranchDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of BranchDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = freezed,
    Object? city = freezed,
    Object? department = freezed,
    Object? isActive = null,
    Object? openingHours = null,
    Object? userIds = null,
  }) {
    return _then(_$BranchDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      openingHours: null == openingHours
          ? _value._openingHours
          : openingHours // ignore: cast_nullable_to_non_nullable
              as List<BranchDayScheduleDto>,
      userIds: null == userIds
          ? _value._userIds
          : userIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BranchDtoImpl implements _BranchDto {
  const _$BranchDtoImpl(
      {required this.id,
      required this.name,
      this.address,
      this.city,
      this.department,
      @JsonKey(name: 'is_active') this.isActive = true,
      @JsonKey(name: 'opening_hours')
      final List<BranchDayScheduleDto> openingHours = const [],
      @JsonKey(name: 'user_ids') final List<int> userIds = const []})
      : _openingHours = openingHours,
        _userIds = userIds;

  factory _$BranchDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$BranchDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? address;
  @override
  final String? city;
  @override
  final String? department;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  final List<BranchDayScheduleDto> _openingHours;
  @override
  @JsonKey(name: 'opening_hours')
  List<BranchDayScheduleDto> get openingHours {
    if (_openingHours is EqualUnmodifiableListView) return _openingHours;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_openingHours);
  }

  final List<int> _userIds;
  @override
  @JsonKey(name: 'user_ids')
  List<int> get userIds {
    if (_userIds is EqualUnmodifiableListView) return _userIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userIds);
  }

  @override
  String toString() {
    return 'BranchDto(id: $id, name: $name, address: $address, city: $city, department: $department, isActive: $isActive, openingHours: $openingHours, userIds: $userIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BranchDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality()
                .equals(other._openingHours, _openingHours) &&
            const DeepCollectionEquality().equals(other._userIds, _userIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      address,
      city,
      department,
      isActive,
      const DeepCollectionEquality().hash(_openingHours),
      const DeepCollectionEquality().hash(_userIds));

  /// Create a copy of BranchDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BranchDtoImplCopyWith<_$BranchDtoImpl> get copyWith =>
      __$$BranchDtoImplCopyWithImpl<_$BranchDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BranchDtoImplToJson(
      this,
    );
  }
}

abstract class _BranchDto implements BranchDto {
  const factory _BranchDto(
      {required final int id,
      required final String name,
      final String? address,
      final String? city,
      final String? department,
      @JsonKey(name: 'is_active') final bool isActive,
      @JsonKey(name: 'opening_hours')
      final List<BranchDayScheduleDto> openingHours,
      @JsonKey(name: 'user_ids') final List<int> userIds}) = _$BranchDtoImpl;

  factory _BranchDto.fromJson(Map<String, dynamic> json) =
      _$BranchDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get address;
  @override
  String? get city;
  @override
  String? get department;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  @JsonKey(name: 'opening_hours')
  List<BranchDayScheduleDto> get openingHours;
  @override
  @JsonKey(name: 'user_ids')
  List<int> get userIds;

  /// Create a copy of BranchDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BranchDtoImplCopyWith<_$BranchDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BranchCreateDto _$BranchCreateDtoFromJson(Map<String, dynamic> json) {
  return _BranchCreateDto.fromJson(json);
}

/// @nodoc
mixin _$BranchCreateDto {
  String get name => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get department => throw _privateConstructorUsedError;
  @JsonKey(name: 'opening_hours')
  List<BranchDayScheduleDto> get openingHours =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'user_ids')
  List<int> get userIds => throw _privateConstructorUsedError;

  /// Serializes this BranchCreateDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BranchCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BranchCreateDtoCopyWith<BranchCreateDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BranchCreateDtoCopyWith<$Res> {
  factory $BranchCreateDtoCopyWith(
          BranchCreateDto value, $Res Function(BranchCreateDto) then) =
      _$BranchCreateDtoCopyWithImpl<$Res, BranchCreateDto>;
  @useResult
  $Res call(
      {String name,
      String? address,
      String? city,
      String? department,
      @JsonKey(name: 'opening_hours') List<BranchDayScheduleDto> openingHours,
      @JsonKey(name: 'user_ids') List<int> userIds});
}

/// @nodoc
class _$BranchCreateDtoCopyWithImpl<$Res, $Val extends BranchCreateDto>
    implements $BranchCreateDtoCopyWith<$Res> {
  _$BranchCreateDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BranchCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? address = freezed,
    Object? city = freezed,
    Object? department = freezed,
    Object? openingHours = null,
    Object? userIds = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String?,
      openingHours: null == openingHours
          ? _value.openingHours
          : openingHours // ignore: cast_nullable_to_non_nullable
              as List<BranchDayScheduleDto>,
      userIds: null == userIds
          ? _value.userIds
          : userIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BranchCreateDtoImplCopyWith<$Res>
    implements $BranchCreateDtoCopyWith<$Res> {
  factory _$$BranchCreateDtoImplCopyWith(_$BranchCreateDtoImpl value,
          $Res Function(_$BranchCreateDtoImpl) then) =
      __$$BranchCreateDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String? address,
      String? city,
      String? department,
      @JsonKey(name: 'opening_hours') List<BranchDayScheduleDto> openingHours,
      @JsonKey(name: 'user_ids') List<int> userIds});
}

/// @nodoc
class __$$BranchCreateDtoImplCopyWithImpl<$Res>
    extends _$BranchCreateDtoCopyWithImpl<$Res, _$BranchCreateDtoImpl>
    implements _$$BranchCreateDtoImplCopyWith<$Res> {
  __$$BranchCreateDtoImplCopyWithImpl(
      _$BranchCreateDtoImpl _value, $Res Function(_$BranchCreateDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of BranchCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? address = freezed,
    Object? city = freezed,
    Object? department = freezed,
    Object? openingHours = null,
    Object? userIds = null,
  }) {
    return _then(_$BranchCreateDtoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String?,
      openingHours: null == openingHours
          ? _value._openingHours
          : openingHours // ignore: cast_nullable_to_non_nullable
              as List<BranchDayScheduleDto>,
      userIds: null == userIds
          ? _value._userIds
          : userIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BranchCreateDtoImpl implements _BranchCreateDto {
  const _$BranchCreateDtoImpl(
      {required this.name,
      this.address,
      this.city,
      this.department,
      @JsonKey(name: 'opening_hours')
      final List<BranchDayScheduleDto> openingHours = const [],
      @JsonKey(name: 'user_ids') final List<int> userIds = const []})
      : _openingHours = openingHours,
        _userIds = userIds;

  factory _$BranchCreateDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$BranchCreateDtoImplFromJson(json);

  @override
  final String name;
  @override
  final String? address;
  @override
  final String? city;
  @override
  final String? department;
  final List<BranchDayScheduleDto> _openingHours;
  @override
  @JsonKey(name: 'opening_hours')
  List<BranchDayScheduleDto> get openingHours {
    if (_openingHours is EqualUnmodifiableListView) return _openingHours;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_openingHours);
  }

  final List<int> _userIds;
  @override
  @JsonKey(name: 'user_ids')
  List<int> get userIds {
    if (_userIds is EqualUnmodifiableListView) return _userIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userIds);
  }

  @override
  String toString() {
    return 'BranchCreateDto(name: $name, address: $address, city: $city, department: $department, openingHours: $openingHours, userIds: $userIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BranchCreateDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.department, department) ||
                other.department == department) &&
            const DeepCollectionEquality()
                .equals(other._openingHours, _openingHours) &&
            const DeepCollectionEquality().equals(other._userIds, _userIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      address,
      city,
      department,
      const DeepCollectionEquality().hash(_openingHours),
      const DeepCollectionEquality().hash(_userIds));

  /// Create a copy of BranchCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BranchCreateDtoImplCopyWith<_$BranchCreateDtoImpl> get copyWith =>
      __$$BranchCreateDtoImplCopyWithImpl<_$BranchCreateDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BranchCreateDtoImplToJson(
      this,
    );
  }
}

abstract class _BranchCreateDto implements BranchCreateDto {
  const factory _BranchCreateDto(
          {required final String name,
          final String? address,
          final String? city,
          final String? department,
          @JsonKey(name: 'opening_hours')
          final List<BranchDayScheduleDto> openingHours,
          @JsonKey(name: 'user_ids') final List<int> userIds}) =
      _$BranchCreateDtoImpl;

  factory _BranchCreateDto.fromJson(Map<String, dynamic> json) =
      _$BranchCreateDtoImpl.fromJson;

  @override
  String get name;
  @override
  String? get address;
  @override
  String? get city;
  @override
  String? get department;
  @override
  @JsonKey(name: 'opening_hours')
  List<BranchDayScheduleDto> get openingHours;
  @override
  @JsonKey(name: 'user_ids')
  List<int> get userIds;

  /// Create a copy of BranchCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BranchCreateDtoImplCopyWith<_$BranchCreateDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BranchUpdateDto _$BranchUpdateDtoFromJson(Map<String, dynamic> json) {
  return _BranchUpdateDto.fromJson(json);
}

/// @nodoc
mixin _$BranchUpdateDto {
  String? get name => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get department => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'opening_hours')
  List<BranchDayScheduleDto>? get openingHours =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'user_ids')
  List<int>? get userIds => throw _privateConstructorUsedError;

  /// Serializes this BranchUpdateDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BranchUpdateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BranchUpdateDtoCopyWith<BranchUpdateDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BranchUpdateDtoCopyWith<$Res> {
  factory $BranchUpdateDtoCopyWith(
          BranchUpdateDto value, $Res Function(BranchUpdateDto) then) =
      _$BranchUpdateDtoCopyWithImpl<$Res, BranchUpdateDto>;
  @useResult
  $Res call(
      {String? name,
      String? address,
      String? city,
      String? department,
      @JsonKey(name: 'is_active') bool? isActive,
      @JsonKey(name: 'opening_hours') List<BranchDayScheduleDto>? openingHours,
      @JsonKey(name: 'user_ids') List<int>? userIds});
}

/// @nodoc
class _$BranchUpdateDtoCopyWithImpl<$Res, $Val extends BranchUpdateDto>
    implements $BranchUpdateDtoCopyWith<$Res> {
  _$BranchUpdateDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BranchUpdateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? address = freezed,
    Object? city = freezed,
    Object? department = freezed,
    Object? isActive = freezed,
    Object? openingHours = freezed,
    Object? userIds = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      openingHours: freezed == openingHours
          ? _value.openingHours
          : openingHours // ignore: cast_nullable_to_non_nullable
              as List<BranchDayScheduleDto>?,
      userIds: freezed == userIds
          ? _value.userIds
          : userIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BranchUpdateDtoImplCopyWith<$Res>
    implements $BranchUpdateDtoCopyWith<$Res> {
  factory _$$BranchUpdateDtoImplCopyWith(_$BranchUpdateDtoImpl value,
          $Res Function(_$BranchUpdateDtoImpl) then) =
      __$$BranchUpdateDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? address,
      String? city,
      String? department,
      @JsonKey(name: 'is_active') bool? isActive,
      @JsonKey(name: 'opening_hours') List<BranchDayScheduleDto>? openingHours,
      @JsonKey(name: 'user_ids') List<int>? userIds});
}

/// @nodoc
class __$$BranchUpdateDtoImplCopyWithImpl<$Res>
    extends _$BranchUpdateDtoCopyWithImpl<$Res, _$BranchUpdateDtoImpl>
    implements _$$BranchUpdateDtoImplCopyWith<$Res> {
  __$$BranchUpdateDtoImplCopyWithImpl(
      _$BranchUpdateDtoImpl _value, $Res Function(_$BranchUpdateDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of BranchUpdateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? address = freezed,
    Object? city = freezed,
    Object? department = freezed,
    Object? isActive = freezed,
    Object? openingHours = freezed,
    Object? userIds = freezed,
  }) {
    return _then(_$BranchUpdateDtoImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      openingHours: freezed == openingHours
          ? _value._openingHours
          : openingHours // ignore: cast_nullable_to_non_nullable
              as List<BranchDayScheduleDto>?,
      userIds: freezed == userIds
          ? _value._userIds
          : userIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BranchUpdateDtoImpl implements _BranchUpdateDto {
  const _$BranchUpdateDtoImpl(
      {this.name,
      this.address,
      this.city,
      this.department,
      @JsonKey(name: 'is_active') this.isActive,
      @JsonKey(name: 'opening_hours')
      final List<BranchDayScheduleDto>? openingHours,
      @JsonKey(name: 'user_ids') final List<int>? userIds})
      : _openingHours = openingHours,
        _userIds = userIds;

  factory _$BranchUpdateDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$BranchUpdateDtoImplFromJson(json);

  @override
  final String? name;
  @override
  final String? address;
  @override
  final String? city;
  @override
  final String? department;
  @override
  @JsonKey(name: 'is_active')
  final bool? isActive;
  final List<BranchDayScheduleDto>? _openingHours;
  @override
  @JsonKey(name: 'opening_hours')
  List<BranchDayScheduleDto>? get openingHours {
    final value = _openingHours;
    if (value == null) return null;
    if (_openingHours is EqualUnmodifiableListView) return _openingHours;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int>? _userIds;
  @override
  @JsonKey(name: 'user_ids')
  List<int>? get userIds {
    final value = _userIds;
    if (value == null) return null;
    if (_userIds is EqualUnmodifiableListView) return _userIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'BranchUpdateDto(name: $name, address: $address, city: $city, department: $department, isActive: $isActive, openingHours: $openingHours, userIds: $userIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BranchUpdateDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality()
                .equals(other._openingHours, _openingHours) &&
            const DeepCollectionEquality().equals(other._userIds, _userIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      address,
      city,
      department,
      isActive,
      const DeepCollectionEquality().hash(_openingHours),
      const DeepCollectionEquality().hash(_userIds));

  /// Create a copy of BranchUpdateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BranchUpdateDtoImplCopyWith<_$BranchUpdateDtoImpl> get copyWith =>
      __$$BranchUpdateDtoImplCopyWithImpl<_$BranchUpdateDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BranchUpdateDtoImplToJson(
      this,
    );
  }
}

abstract class _BranchUpdateDto implements BranchUpdateDto {
  const factory _BranchUpdateDto(
          {final String? name,
          final String? address,
          final String? city,
          final String? department,
          @JsonKey(name: 'is_active') final bool? isActive,
          @JsonKey(name: 'opening_hours')
          final List<BranchDayScheduleDto>? openingHours,
          @JsonKey(name: 'user_ids') final List<int>? userIds}) =
      _$BranchUpdateDtoImpl;

  factory _BranchUpdateDto.fromJson(Map<String, dynamic> json) =
      _$BranchUpdateDtoImpl.fromJson;

  @override
  String? get name;
  @override
  String? get address;
  @override
  String? get city;
  @override
  String? get department;
  @override
  @JsonKey(name: 'is_active')
  bool? get isActive;
  @override
  @JsonKey(name: 'opening_hours')
  List<BranchDayScheduleDto>? get openingHours;
  @override
  @JsonKey(name: 'user_ids')
  List<int>? get userIds;

  /// Create a copy of BranchUpdateDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BranchUpdateDtoImplCopyWith<_$BranchUpdateDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

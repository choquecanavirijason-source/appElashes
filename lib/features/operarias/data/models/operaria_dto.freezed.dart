// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'operaria_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OperariaRoleSummaryDto _$OperariaRoleSummaryDtoFromJson(
    Map<String, dynamic> json) {
  return _OperariaRoleSummaryDto.fromJson(json);
}

/// @nodoc
mixin _$OperariaRoleSummaryDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this OperariaRoleSummaryDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OperariaRoleSummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OperariaRoleSummaryDtoCopyWith<OperariaRoleSummaryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OperariaRoleSummaryDtoCopyWith<$Res> {
  factory $OperariaRoleSummaryDtoCopyWith(OperariaRoleSummaryDto value,
          $Res Function(OperariaRoleSummaryDto) then) =
      _$OperariaRoleSummaryDtoCopyWithImpl<$Res, OperariaRoleSummaryDto>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$OperariaRoleSummaryDtoCopyWithImpl<$Res,
        $Val extends OperariaRoleSummaryDto>
    implements $OperariaRoleSummaryDtoCopyWith<$Res> {
  _$OperariaRoleSummaryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OperariaRoleSummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OperariaRoleSummaryDtoImplCopyWith<$Res>
    implements $OperariaRoleSummaryDtoCopyWith<$Res> {
  factory _$$OperariaRoleSummaryDtoImplCopyWith(
          _$OperariaRoleSummaryDtoImpl value,
          $Res Function(_$OperariaRoleSummaryDtoImpl) then) =
      __$$OperariaRoleSummaryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$OperariaRoleSummaryDtoImplCopyWithImpl<$Res>
    extends _$OperariaRoleSummaryDtoCopyWithImpl<$Res,
        _$OperariaRoleSummaryDtoImpl>
    implements _$$OperariaRoleSummaryDtoImplCopyWith<$Res> {
  __$$OperariaRoleSummaryDtoImplCopyWithImpl(
      _$OperariaRoleSummaryDtoImpl _value,
      $Res Function(_$OperariaRoleSummaryDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of OperariaRoleSummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$OperariaRoleSummaryDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OperariaRoleSummaryDtoImpl implements _OperariaRoleSummaryDto {
  const _$OperariaRoleSummaryDtoImpl({required this.id, required this.name});

  factory _$OperariaRoleSummaryDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$OperariaRoleSummaryDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'OperariaRoleSummaryDto(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OperariaRoleSummaryDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of OperariaRoleSummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OperariaRoleSummaryDtoImplCopyWith<_$OperariaRoleSummaryDtoImpl>
      get copyWith => __$$OperariaRoleSummaryDtoImplCopyWithImpl<
          _$OperariaRoleSummaryDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OperariaRoleSummaryDtoImplToJson(
      this,
    );
  }
}

abstract class _OperariaRoleSummaryDto implements OperariaRoleSummaryDto {
  const factory _OperariaRoleSummaryDto(
      {required final int id,
      required final String name}) = _$OperariaRoleSummaryDtoImpl;

  factory _OperariaRoleSummaryDto.fromJson(Map<String, dynamic> json) =
      _$OperariaRoleSummaryDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get name;

  /// Create a copy of OperariaRoleSummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OperariaRoleSummaryDtoImplCopyWith<_$OperariaRoleSummaryDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

OperariaBranchSummaryDto _$OperariaBranchSummaryDtoFromJson(
    Map<String, dynamic> json) {
  return _OperariaBranchSummaryDto.fromJson(json);
}

/// @nodoc
mixin _$OperariaBranchSummaryDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this OperariaBranchSummaryDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OperariaBranchSummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OperariaBranchSummaryDtoCopyWith<OperariaBranchSummaryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OperariaBranchSummaryDtoCopyWith<$Res> {
  factory $OperariaBranchSummaryDtoCopyWith(OperariaBranchSummaryDto value,
          $Res Function(OperariaBranchSummaryDto) then) =
      _$OperariaBranchSummaryDtoCopyWithImpl<$Res, OperariaBranchSummaryDto>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$OperariaBranchSummaryDtoCopyWithImpl<$Res,
        $Val extends OperariaBranchSummaryDto>
    implements $OperariaBranchSummaryDtoCopyWith<$Res> {
  _$OperariaBranchSummaryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OperariaBranchSummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OperariaBranchSummaryDtoImplCopyWith<$Res>
    implements $OperariaBranchSummaryDtoCopyWith<$Res> {
  factory _$$OperariaBranchSummaryDtoImplCopyWith(
          _$OperariaBranchSummaryDtoImpl value,
          $Res Function(_$OperariaBranchSummaryDtoImpl) then) =
      __$$OperariaBranchSummaryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$OperariaBranchSummaryDtoImplCopyWithImpl<$Res>
    extends _$OperariaBranchSummaryDtoCopyWithImpl<$Res,
        _$OperariaBranchSummaryDtoImpl>
    implements _$$OperariaBranchSummaryDtoImplCopyWith<$Res> {
  __$$OperariaBranchSummaryDtoImplCopyWithImpl(
      _$OperariaBranchSummaryDtoImpl _value,
      $Res Function(_$OperariaBranchSummaryDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of OperariaBranchSummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$OperariaBranchSummaryDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OperariaBranchSummaryDtoImpl implements _OperariaBranchSummaryDto {
  const _$OperariaBranchSummaryDtoImpl({required this.id, required this.name});

  factory _$OperariaBranchSummaryDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$OperariaBranchSummaryDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'OperariaBranchSummaryDto(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OperariaBranchSummaryDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of OperariaBranchSummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OperariaBranchSummaryDtoImplCopyWith<_$OperariaBranchSummaryDtoImpl>
      get copyWith => __$$OperariaBranchSummaryDtoImplCopyWithImpl<
          _$OperariaBranchSummaryDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OperariaBranchSummaryDtoImplToJson(
      this,
    );
  }
}

abstract class _OperariaBranchSummaryDto implements OperariaBranchSummaryDto {
  const factory _OperariaBranchSummaryDto(
      {required final int id,
      required final String name}) = _$OperariaBranchSummaryDtoImpl;

  factory _OperariaBranchSummaryDto.fromJson(Map<String, dynamic> json) =
      _$OperariaBranchSummaryDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get name;

  /// Create a copy of OperariaBranchSummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OperariaBranchSummaryDtoImplCopyWith<_$OperariaBranchSummaryDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

OperariaDto _$OperariaDtoFromJson(Map<String, dynamic> json) {
  return _OperariaDto.fromJson(json);
}

/// @nodoc
mixin _$OperariaDto {
  int get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'role_id')
  int? get roleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'branch_id')
  int? get branchId => throw _privateConstructorUsedError;
  @JsonKey(name: 'skill_level')
  int? get skillLevel => throw _privateConstructorUsedError;
  OperariaRoleSummaryDto? get role => throw _privateConstructorUsedError;
  OperariaBranchSummaryDto? get branch => throw _privateConstructorUsedError;

  /// Serializes this OperariaDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OperariaDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OperariaDtoCopyWith<OperariaDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OperariaDtoCopyWith<$Res> {
  factory $OperariaDtoCopyWith(
          OperariaDto value, $Res Function(OperariaDto) then) =
      _$OperariaDtoCopyWithImpl<$Res, OperariaDto>;
  @useResult
  $Res call(
      {int id,
      String username,
      String? email,
      String? phone,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'role_id') int? roleId,
      @JsonKey(name: 'branch_id') int? branchId,
      @JsonKey(name: 'skill_level') int? skillLevel,
      OperariaRoleSummaryDto? role,
      OperariaBranchSummaryDto? branch});

  $OperariaRoleSummaryDtoCopyWith<$Res>? get role;
  $OperariaBranchSummaryDtoCopyWith<$Res>? get branch;
}

/// @nodoc
class _$OperariaDtoCopyWithImpl<$Res, $Val extends OperariaDto>
    implements $OperariaDtoCopyWith<$Res> {
  _$OperariaDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OperariaDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? email = freezed,
    Object? phone = freezed,
    Object? isActive = null,
    Object? createdAt = freezed,
    Object? roleId = freezed,
    Object? branchId = freezed,
    Object? skillLevel = freezed,
    Object? role = freezed,
    Object? branch = freezed,
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
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      roleId: freezed == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int?,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
      skillLevel: freezed == skillLevel
          ? _value.skillLevel
          : skillLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as OperariaRoleSummaryDto?,
      branch: freezed == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as OperariaBranchSummaryDto?,
    ) as $Val);
  }

  /// Create a copy of OperariaDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OperariaRoleSummaryDtoCopyWith<$Res>? get role {
    if (_value.role == null) {
      return null;
    }

    return $OperariaRoleSummaryDtoCopyWith<$Res>(_value.role!, (value) {
      return _then(_value.copyWith(role: value) as $Val);
    });
  }

  /// Create a copy of OperariaDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OperariaBranchSummaryDtoCopyWith<$Res>? get branch {
    if (_value.branch == null) {
      return null;
    }

    return $OperariaBranchSummaryDtoCopyWith<$Res>(_value.branch!, (value) {
      return _then(_value.copyWith(branch: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OperariaDtoImplCopyWith<$Res>
    implements $OperariaDtoCopyWith<$Res> {
  factory _$$OperariaDtoImplCopyWith(
          _$OperariaDtoImpl value, $Res Function(_$OperariaDtoImpl) then) =
      __$$OperariaDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String username,
      String? email,
      String? phone,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'role_id') int? roleId,
      @JsonKey(name: 'branch_id') int? branchId,
      @JsonKey(name: 'skill_level') int? skillLevel,
      OperariaRoleSummaryDto? role,
      OperariaBranchSummaryDto? branch});

  @override
  $OperariaRoleSummaryDtoCopyWith<$Res>? get role;
  @override
  $OperariaBranchSummaryDtoCopyWith<$Res>? get branch;
}

/// @nodoc
class __$$OperariaDtoImplCopyWithImpl<$Res>
    extends _$OperariaDtoCopyWithImpl<$Res, _$OperariaDtoImpl>
    implements _$$OperariaDtoImplCopyWith<$Res> {
  __$$OperariaDtoImplCopyWithImpl(
      _$OperariaDtoImpl _value, $Res Function(_$OperariaDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of OperariaDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? email = freezed,
    Object? phone = freezed,
    Object? isActive = null,
    Object? createdAt = freezed,
    Object? roleId = freezed,
    Object? branchId = freezed,
    Object? skillLevel = freezed,
    Object? role = freezed,
    Object? branch = freezed,
  }) {
    return _then(_$OperariaDtoImpl(
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
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      roleId: freezed == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int?,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
      skillLevel: freezed == skillLevel
          ? _value.skillLevel
          : skillLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as OperariaRoleSummaryDto?,
      branch: freezed == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as OperariaBranchSummaryDto?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OperariaDtoImpl implements _OperariaDto {
  const _$OperariaDtoImpl(
      {required this.id,
      required this.username,
      this.email,
      this.phone,
      @JsonKey(name: 'is_active') this.isActive = true,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'role_id') this.roleId,
      @JsonKey(name: 'branch_id') this.branchId,
      @JsonKey(name: 'skill_level') this.skillLevel,
      this.role,
      this.branch});

  factory _$OperariaDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$OperariaDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String username;
  @override
  final String? email;
  @override
  final String? phone;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'role_id')
  final int? roleId;
  @override
  @JsonKey(name: 'branch_id')
  final int? branchId;
  @override
  @JsonKey(name: 'skill_level')
  final int? skillLevel;
  @override
  final OperariaRoleSummaryDto? role;
  @override
  final OperariaBranchSummaryDto? branch;

  @override
  String toString() {
    return 'OperariaDto(id: $id, username: $username, email: $email, phone: $phone, isActive: $isActive, createdAt: $createdAt, roleId: $roleId, branchId: $branchId, skillLevel: $skillLevel, role: $role, branch: $branch)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OperariaDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.roleId, roleId) || other.roleId == roleId) &&
            (identical(other.branchId, branchId) ||
                other.branchId == branchId) &&
            (identical(other.skillLevel, skillLevel) ||
                other.skillLevel == skillLevel) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.branch, branch) || other.branch == branch));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, username, email, phone,
      isActive, createdAt, roleId, branchId, skillLevel, role, branch);

  /// Create a copy of OperariaDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OperariaDtoImplCopyWith<_$OperariaDtoImpl> get copyWith =>
      __$$OperariaDtoImplCopyWithImpl<_$OperariaDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OperariaDtoImplToJson(
      this,
    );
  }
}

abstract class _OperariaDto implements OperariaDto {
  const factory _OperariaDto(
      {required final int id,
      required final String username,
      final String? email,
      final String? phone,
      @JsonKey(name: 'is_active') final bool isActive,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'role_id') final int? roleId,
      @JsonKey(name: 'branch_id') final int? branchId,
      @JsonKey(name: 'skill_level') final int? skillLevel,
      final OperariaRoleSummaryDto? role,
      final OperariaBranchSummaryDto? branch}) = _$OperariaDtoImpl;

  factory _OperariaDto.fromJson(Map<String, dynamic> json) =
      _$OperariaDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get username;
  @override
  String? get email;
  @override
  String? get phone;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'role_id')
  int? get roleId;
  @override
  @JsonKey(name: 'branch_id')
  int? get branchId;
  @override
  @JsonKey(name: 'skill_level')
  int? get skillLevel;
  @override
  OperariaRoleSummaryDto? get role;
  @override
  OperariaBranchSummaryDto? get branch;

  /// Create a copy of OperariaDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OperariaDtoImplCopyWith<_$OperariaDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OperariaCreateDto _$OperariaCreateDtoFromJson(Map<String, dynamic> json) {
  return _OperariaCreateDto.fromJson(json);
}

/// @nodoc
mixin _$OperariaCreateDto {
  String get username => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'role_id')
  int? get roleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'branch_id')
  int? get branchId => throw _privateConstructorUsedError;

  /// Serializes this OperariaCreateDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OperariaCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OperariaCreateDtoCopyWith<OperariaCreateDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OperariaCreateDtoCopyWith<$Res> {
  factory $OperariaCreateDtoCopyWith(
          OperariaCreateDto value, $Res Function(OperariaCreateDto) then) =
      _$OperariaCreateDtoCopyWithImpl<$Res, OperariaCreateDto>;
  @useResult
  $Res call(
      {String username,
      String email,
      String password,
      String? phone,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'role_id') int? roleId,
      @JsonKey(name: 'branch_id') int? branchId});
}

/// @nodoc
class _$OperariaCreateDtoCopyWithImpl<$Res, $Val extends OperariaCreateDto>
    implements $OperariaCreateDtoCopyWith<$Res> {
  _$OperariaCreateDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OperariaCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? email = null,
    Object? password = null,
    Object? phone = freezed,
    Object? isActive = null,
    Object? roleId = freezed,
    Object? branchId = freezed,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      roleId: freezed == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int?,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OperariaCreateDtoImplCopyWith<$Res>
    implements $OperariaCreateDtoCopyWith<$Res> {
  factory _$$OperariaCreateDtoImplCopyWith(_$OperariaCreateDtoImpl value,
          $Res Function(_$OperariaCreateDtoImpl) then) =
      __$$OperariaCreateDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String username,
      String email,
      String password,
      String? phone,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'role_id') int? roleId,
      @JsonKey(name: 'branch_id') int? branchId});
}

/// @nodoc
class __$$OperariaCreateDtoImplCopyWithImpl<$Res>
    extends _$OperariaCreateDtoCopyWithImpl<$Res, _$OperariaCreateDtoImpl>
    implements _$$OperariaCreateDtoImplCopyWith<$Res> {
  __$$OperariaCreateDtoImplCopyWithImpl(_$OperariaCreateDtoImpl _value,
      $Res Function(_$OperariaCreateDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of OperariaCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? email = null,
    Object? password = null,
    Object? phone = freezed,
    Object? isActive = null,
    Object? roleId = freezed,
    Object? branchId = freezed,
  }) {
    return _then(_$OperariaCreateDtoImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      roleId: freezed == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int?,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OperariaCreateDtoImpl implements _OperariaCreateDto {
  const _$OperariaCreateDtoImpl(
      {required this.username,
      required this.email,
      required this.password,
      this.phone,
      @JsonKey(name: 'is_active') this.isActive = true,
      @JsonKey(name: 'role_id') this.roleId,
      @JsonKey(name: 'branch_id') this.branchId});

  factory _$OperariaCreateDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$OperariaCreateDtoImplFromJson(json);

  @override
  final String username;
  @override
  final String email;
  @override
  final String password;
  @override
  final String? phone;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  @JsonKey(name: 'role_id')
  final int? roleId;
  @override
  @JsonKey(name: 'branch_id')
  final int? branchId;

  @override
  String toString() {
    return 'OperariaCreateDto(username: $username, email: $email, password: $password, phone: $phone, isActive: $isActive, roleId: $roleId, branchId: $branchId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OperariaCreateDtoImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.roleId, roleId) || other.roleId == roleId) &&
            (identical(other.branchId, branchId) ||
                other.branchId == branchId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, username, email, password, phone,
      isActive, roleId, branchId);

  /// Create a copy of OperariaCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OperariaCreateDtoImplCopyWith<_$OperariaCreateDtoImpl> get copyWith =>
      __$$OperariaCreateDtoImplCopyWithImpl<_$OperariaCreateDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OperariaCreateDtoImplToJson(
      this,
    );
  }
}

abstract class _OperariaCreateDto implements OperariaCreateDto {
  const factory _OperariaCreateDto(
          {required final String username,
          required final String email,
          required final String password,
          final String? phone,
          @JsonKey(name: 'is_active') final bool isActive,
          @JsonKey(name: 'role_id') final int? roleId,
          @JsonKey(name: 'branch_id') final int? branchId}) =
      _$OperariaCreateDtoImpl;

  factory _OperariaCreateDto.fromJson(Map<String, dynamic> json) =
      _$OperariaCreateDtoImpl.fromJson;

  @override
  String get username;
  @override
  String get email;
  @override
  String get password;
  @override
  String? get phone;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  @JsonKey(name: 'role_id')
  int? get roleId;
  @override
  @JsonKey(name: 'branch_id')
  int? get branchId;

  /// Create a copy of OperariaCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OperariaCreateDtoImplCopyWith<_$OperariaCreateDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OperariaUpdateDto _$OperariaUpdateDtoFromJson(Map<String, dynamic> json) {
  return _OperariaUpdateDto.fromJson(json);
}

/// @nodoc
mixin _$OperariaUpdateDto {
  String? get username => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'role_id')
  int? get roleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'branch_id')
  int? get branchId => throw _privateConstructorUsedError;
  @JsonKey(name: 'skill_level')
  int? get skillLevel => throw _privateConstructorUsedError;

  /// Serializes this OperariaUpdateDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OperariaUpdateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OperariaUpdateDtoCopyWith<OperariaUpdateDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OperariaUpdateDtoCopyWith<$Res> {
  factory $OperariaUpdateDtoCopyWith(
          OperariaUpdateDto value, $Res Function(OperariaUpdateDto) then) =
      _$OperariaUpdateDtoCopyWithImpl<$Res, OperariaUpdateDto>;
  @useResult
  $Res call(
      {String? username,
      String? email,
      String? password,
      String? phone,
      @JsonKey(name: 'is_active') bool? isActive,
      @JsonKey(name: 'role_id') int? roleId,
      @JsonKey(name: 'branch_id') int? branchId,
      @JsonKey(name: 'skill_level') int? skillLevel});
}

/// @nodoc
class _$OperariaUpdateDtoCopyWithImpl<$Res, $Val extends OperariaUpdateDto>
    implements $OperariaUpdateDtoCopyWith<$Res> {
  _$OperariaUpdateDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OperariaUpdateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? phone = freezed,
    Object? isActive = freezed,
    Object? roleId = freezed,
    Object? branchId = freezed,
    Object? skillLevel = freezed,
  }) {
    return _then(_value.copyWith(
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      roleId: freezed == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int?,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
      skillLevel: freezed == skillLevel
          ? _value.skillLevel
          : skillLevel // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OperariaUpdateDtoImplCopyWith<$Res>
    implements $OperariaUpdateDtoCopyWith<$Res> {
  factory _$$OperariaUpdateDtoImplCopyWith(_$OperariaUpdateDtoImpl value,
          $Res Function(_$OperariaUpdateDtoImpl) then) =
      __$$OperariaUpdateDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? username,
      String? email,
      String? password,
      String? phone,
      @JsonKey(name: 'is_active') bool? isActive,
      @JsonKey(name: 'role_id') int? roleId,
      @JsonKey(name: 'branch_id') int? branchId,
      @JsonKey(name: 'skill_level') int? skillLevel});
}

/// @nodoc
class __$$OperariaUpdateDtoImplCopyWithImpl<$Res>
    extends _$OperariaUpdateDtoCopyWithImpl<$Res, _$OperariaUpdateDtoImpl>
    implements _$$OperariaUpdateDtoImplCopyWith<$Res> {
  __$$OperariaUpdateDtoImplCopyWithImpl(_$OperariaUpdateDtoImpl _value,
      $Res Function(_$OperariaUpdateDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of OperariaUpdateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? phone = freezed,
    Object? isActive = freezed,
    Object? roleId = freezed,
    Object? branchId = freezed,
    Object? skillLevel = freezed,
  }) {
    return _then(_$OperariaUpdateDtoImpl(
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      roleId: freezed == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int?,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
      skillLevel: freezed == skillLevel
          ? _value.skillLevel
          : skillLevel // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OperariaUpdateDtoImpl implements _OperariaUpdateDto {
  const _$OperariaUpdateDtoImpl(
      {this.username,
      this.email,
      this.password,
      this.phone,
      @JsonKey(name: 'is_active') this.isActive,
      @JsonKey(name: 'role_id') this.roleId,
      @JsonKey(name: 'branch_id') this.branchId,
      @JsonKey(name: 'skill_level') this.skillLevel});

  factory _$OperariaUpdateDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$OperariaUpdateDtoImplFromJson(json);

  @override
  final String? username;
  @override
  final String? email;
  @override
  final String? password;
  @override
  final String? phone;
  @override
  @JsonKey(name: 'is_active')
  final bool? isActive;
  @override
  @JsonKey(name: 'role_id')
  final int? roleId;
  @override
  @JsonKey(name: 'branch_id')
  final int? branchId;
  @override
  @JsonKey(name: 'skill_level')
  final int? skillLevel;

  @override
  String toString() {
    return 'OperariaUpdateDto(username: $username, email: $email, password: $password, phone: $phone, isActive: $isActive, roleId: $roleId, branchId: $branchId, skillLevel: $skillLevel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OperariaUpdateDtoImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.roleId, roleId) || other.roleId == roleId) &&
            (identical(other.branchId, branchId) ||
                other.branchId == branchId) &&
            (identical(other.skillLevel, skillLevel) ||
                other.skillLevel == skillLevel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, username, email, password, phone,
      isActive, roleId, branchId, skillLevel);

  /// Create a copy of OperariaUpdateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OperariaUpdateDtoImplCopyWith<_$OperariaUpdateDtoImpl> get copyWith =>
      __$$OperariaUpdateDtoImplCopyWithImpl<_$OperariaUpdateDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OperariaUpdateDtoImplToJson(
      this,
    );
  }
}

abstract class _OperariaUpdateDto implements OperariaUpdateDto {
  const factory _OperariaUpdateDto(
          {final String? username,
          final String? email,
          final String? password,
          final String? phone,
          @JsonKey(name: 'is_active') final bool? isActive,
          @JsonKey(name: 'role_id') final int? roleId,
          @JsonKey(name: 'branch_id') final int? branchId,
          @JsonKey(name: 'skill_level') final int? skillLevel}) =
      _$OperariaUpdateDtoImpl;

  factory _OperariaUpdateDto.fromJson(Map<String, dynamic> json) =
      _$OperariaUpdateDtoImpl.fromJson;

  @override
  String? get username;
  @override
  String? get email;
  @override
  String? get password;
  @override
  String? get phone;
  @override
  @JsonKey(name: 'is_active')
  bool? get isActive;
  @override
  @JsonKey(name: 'role_id')
  int? get roleId;
  @override
  @JsonKey(name: 'branch_id')
  int? get branchId;
  @override
  @JsonKey(name: 'skill_level')
  int? get skillLevel;

  /// Create a copy of OperariaUpdateDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OperariaUpdateDtoImplCopyWith<_$OperariaUpdateDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'role_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RoleDto _$RoleDtoFromJson(Map<String, dynamic> json) {
  return _RoleDto.fromJson(json);
}

/// @nodoc
mixin _$RoleDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _permissionsFromJson)
  List<String> get permissions => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this RoleDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RoleDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RoleDtoCopyWith<RoleDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoleDtoCopyWith<$Res> {
  factory $RoleDtoCopyWith(RoleDto value, $Res Function(RoleDto) then) =
      _$RoleDtoCopyWithImpl<$Res, RoleDto>;
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(fromJson: _permissionsFromJson) List<String> permissions,
      String? description});
}

/// @nodoc
class _$RoleDtoCopyWithImpl<$Res, $Val extends RoleDto>
    implements $RoleDtoCopyWith<$Res> {
  _$RoleDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RoleDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? permissions = null,
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
      permissions: null == permissions
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoleDtoImplCopyWith<$Res> implements $RoleDtoCopyWith<$Res> {
  factory _$$RoleDtoImplCopyWith(
          _$RoleDtoImpl value, $Res Function(_$RoleDtoImpl) then) =
      __$$RoleDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(fromJson: _permissionsFromJson) List<String> permissions,
      String? description});
}

/// @nodoc
class __$$RoleDtoImplCopyWithImpl<$Res>
    extends _$RoleDtoCopyWithImpl<$Res, _$RoleDtoImpl>
    implements _$$RoleDtoImplCopyWith<$Res> {
  __$$RoleDtoImplCopyWithImpl(
      _$RoleDtoImpl _value, $Res Function(_$RoleDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of RoleDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? permissions = null,
    Object? description = freezed,
  }) {
    return _then(_$RoleDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      permissions: null == permissions
          ? _value._permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoleDtoImpl implements _RoleDto {
  const _$RoleDtoImpl(
      {required this.id,
      required this.name,
      @JsonKey(fromJson: _permissionsFromJson)
      final List<String> permissions = const <String>[],
      this.description})
      : _permissions = permissions;

  factory _$RoleDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoleDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  final List<String> _permissions;
  @override
  @JsonKey(fromJson: _permissionsFromJson)
  List<String> get permissions {
    if (_permissions is EqualUnmodifiableListView) return _permissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_permissions);
  }

  @override
  final String? description;

  @override
  String toString() {
    return 'RoleDto(id: $id, name: $name, permissions: $permissions, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoleDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._permissions, _permissions) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name,
      const DeepCollectionEquality().hash(_permissions), description);

  /// Create a copy of RoleDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RoleDtoImplCopyWith<_$RoleDtoImpl> get copyWith =>
      __$$RoleDtoImplCopyWithImpl<_$RoleDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoleDtoImplToJson(
      this,
    );
  }
}

abstract class _RoleDto implements RoleDto {
  const factory _RoleDto(
      {required final int id,
      required final String name,
      @JsonKey(fromJson: _permissionsFromJson) final List<String> permissions,
      final String? description}) = _$RoleDtoImpl;

  factory _RoleDto.fromJson(Map<String, dynamic> json) = _$RoleDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(fromJson: _permissionsFromJson)
  List<String> get permissions;
  @override
  String? get description;

  /// Create a copy of RoleDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RoleDtoImplCopyWith<_$RoleDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RoleCreateDto _$RoleCreateDtoFromJson(Map<String, dynamic> json) {
  return _RoleCreateDto.fromJson(json);
}

/// @nodoc
mixin _$RoleCreateDto {
  String get name => throw _privateConstructorUsedError;
  List<String> get permissions => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this RoleCreateDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RoleCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RoleCreateDtoCopyWith<RoleCreateDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoleCreateDtoCopyWith<$Res> {
  factory $RoleCreateDtoCopyWith(
          RoleCreateDto value, $Res Function(RoleCreateDto) then) =
      _$RoleCreateDtoCopyWithImpl<$Res, RoleCreateDto>;
  @useResult
  $Res call({String name, List<String> permissions, String? description});
}

/// @nodoc
class _$RoleCreateDtoCopyWithImpl<$Res, $Val extends RoleCreateDto>
    implements $RoleCreateDtoCopyWith<$Res> {
  _$RoleCreateDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RoleCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? permissions = null,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      permissions: null == permissions
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoleCreateDtoImplCopyWith<$Res>
    implements $RoleCreateDtoCopyWith<$Res> {
  factory _$$RoleCreateDtoImplCopyWith(
          _$RoleCreateDtoImpl value, $Res Function(_$RoleCreateDtoImpl) then) =
      __$$RoleCreateDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, List<String> permissions, String? description});
}

/// @nodoc
class __$$RoleCreateDtoImplCopyWithImpl<$Res>
    extends _$RoleCreateDtoCopyWithImpl<$Res, _$RoleCreateDtoImpl>
    implements _$$RoleCreateDtoImplCopyWith<$Res> {
  __$$RoleCreateDtoImplCopyWithImpl(
      _$RoleCreateDtoImpl _value, $Res Function(_$RoleCreateDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of RoleCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? permissions = null,
    Object? description = freezed,
  }) {
    return _then(_$RoleCreateDtoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      permissions: null == permissions
          ? _value._permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoleCreateDtoImpl implements _RoleCreateDto {
  const _$RoleCreateDtoImpl(
      {required this.name,
      final List<String> permissions = const [],
      this.description})
      : _permissions = permissions;

  factory _$RoleCreateDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoleCreateDtoImplFromJson(json);

  @override
  final String name;
  final List<String> _permissions;
  @override
  @JsonKey()
  List<String> get permissions {
    if (_permissions is EqualUnmodifiableListView) return _permissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_permissions);
  }

  @override
  final String? description;

  @override
  String toString() {
    return 'RoleCreateDto(name: $name, permissions: $permissions, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoleCreateDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._permissions, _permissions) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name,
      const DeepCollectionEquality().hash(_permissions), description);

  /// Create a copy of RoleCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RoleCreateDtoImplCopyWith<_$RoleCreateDtoImpl> get copyWith =>
      __$$RoleCreateDtoImplCopyWithImpl<_$RoleCreateDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoleCreateDtoImplToJson(
      this,
    );
  }
}

abstract class _RoleCreateDto implements RoleCreateDto {
  const factory _RoleCreateDto(
      {required final String name,
      final List<String> permissions,
      final String? description}) = _$RoleCreateDtoImpl;

  factory _RoleCreateDto.fromJson(Map<String, dynamic> json) =
      _$RoleCreateDtoImpl.fromJson;

  @override
  String get name;
  @override
  List<String> get permissions;
  @override
  String? get description;

  /// Create a copy of RoleCreateDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RoleCreateDtoImplCopyWith<_$RoleCreateDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

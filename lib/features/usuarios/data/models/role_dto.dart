import 'package:freezed_annotation/freezed_annotation.dart';

part 'role_dto.freezed.dart';
part 'role_dto.g.dart';

// Backend returns permissions as [{id, name}] — extract just the name string.
List<String> _permissionsFromJson(List<dynamic> list) =>
    list.map((e) => (e as Map<String, dynamic>)['name'] as String).toList();

@freezed
class RoleDto with _$RoleDto {
  const factory RoleDto({
    required int id,
    required String name,
    @JsonKey(fromJson: _permissionsFromJson)
    @Default(<String>[])
    List<String> permissions,
    String? description,
  }) = _RoleDto;

  factory RoleDto.fromJson(Map<String, dynamic> json) =>
      _$RoleDtoFromJson(json);
}

@freezed
class RoleCreateDto with _$RoleCreateDto {
  const factory RoleCreateDto({
    required String name,
    @Default([]) List<String> permissions,
    String? description,
  }) = _RoleCreateDto;

  factory RoleCreateDto.fromJson(Map<String, dynamic> json) =>
      _$RoleCreateDtoFromJson(json);
}

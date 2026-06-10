import 'package:freezed_annotation/freezed_annotation.dart';

part 'operaria_dto.freezed.dart';
part 'operaria_dto.g.dart';

@freezed
class OperariaRoleSummaryDto with _$OperariaRoleSummaryDto {
  const factory OperariaRoleSummaryDto({
    required int id,
    required String name,
  }) = _OperariaRoleSummaryDto;

  factory OperariaRoleSummaryDto.fromJson(Map<String, dynamic> json) =>
      _$OperariaRoleSummaryDtoFromJson(json);
}

@freezed
class OperariaBranchSummaryDto with _$OperariaBranchSummaryDto {
  const factory OperariaBranchSummaryDto({
    required int id,
    required String name,
  }) = _OperariaBranchSummaryDto;

  factory OperariaBranchSummaryDto.fromJson(Map<String, dynamic> json) =>
      _$OperariaBranchSummaryDtoFromJson(json);
}

@freezed
class OperariaDto with _$OperariaDto {
  const factory OperariaDto({
    required int id,
    required String username,
    String? email,
    String? phone,
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'role_id') int? roleId,
    @JsonKey(name: 'branch_id') int? branchId,
    @JsonKey(name: 'skill_level') int? skillLevel,
    OperariaRoleSummaryDto? role,
    OperariaBranchSummaryDto? branch,
  }) = _OperariaDto;

  factory OperariaDto.fromJson(Map<String, dynamic> json) =>
      _$OperariaDtoFromJson(json);
}

@freezed
class OperariaCreateDto with _$OperariaCreateDto {
  const factory OperariaCreateDto({
    required String username,
    required String email,
    required String password,
    String? phone,
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
    @JsonKey(name: 'role_id') int? roleId,
    @JsonKey(name: 'branch_id') int? branchId,
  }) = _OperariaCreateDto;

  factory OperariaCreateDto.fromJson(Map<String, dynamic> json) =>
      _$OperariaCreateDtoFromJson(json);
}

@freezed
class OperariaUpdateDto with _$OperariaUpdateDto {
  const factory OperariaUpdateDto({
    String? username,
    String? email,
    String? password,
    String? phone,
    @JsonKey(name: 'is_active') bool? isActive,
    @JsonKey(name: 'role_id') int? roleId,
    @JsonKey(name: 'branch_id') int? branchId,
    @JsonKey(name: 'skill_level') int? skillLevel,
  }) = _OperariaUpdateDto;

  factory OperariaUpdateDto.fromJson(Map<String, dynamic> json) =>
      _$OperariaUpdateDtoFromJson(json);
}

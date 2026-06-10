import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_dto.freezed.dart';
part 'client_dto.g.dart';

@freezed
class EyeTypeSummaryDto with _$EyeTypeSummaryDto {
  const factory EyeTypeSummaryDto({
    required int id,
    required String name,
    String? description,
  }) = _EyeTypeSummaryDto;
  factory EyeTypeSummaryDto.fromJson(Map<String, dynamic> json) =>
      _$EyeTypeSummaryDtoFromJson(json);
}

@freezed
class ClientDto with _$ClientDto {
  const factory ClientDto({
    required int id,
    required String name,
    @JsonKey(name: 'last_name') required String lastName,
    int? age,
    String? phone,
    String? email,
    @JsonKey(name: 'branch_id') int? branchId,
    @JsonKey(name: 'eye_type_id') int? eyeTypeId,
    @Default('sin_estado') String status,
    @JsonKey(name: 'last_activity_at') DateTime? lastActivityAt,
    @JsonKey(name: 'eye_type') EyeTypeSummaryDto? eyeType,
  }) = _ClientDto;
  factory ClientDto.fromJson(Map<String, dynamic> json) =>
      _$ClientDtoFromJson(json);
}

@freezed
class ClientCreateDto with _$ClientCreateDto {
  const factory ClientCreateDto({
    required String name,
    @JsonKey(name: 'last_name') required String lastName,
    int? age,
    String? phone,
    String? email,
    @JsonKey(name: 'branch_id') int? branchId,
    @JsonKey(name: 'eye_type_id') int? eyeTypeId,
    @Default('en_espera') String status,
  }) = _ClientCreateDto;
  factory ClientCreateDto.fromJson(Map<String, dynamic> json) =>
      _$ClientCreateDtoFromJson(json);
}

@freezed
class ClientUpdateDto with _$ClientUpdateDto {
  const factory ClientUpdateDto({
    String? name,
    @JsonKey(name: 'last_name') String? lastName,
    int? age,
    String? phone,
    String? email,
    @JsonKey(name: 'branch_id') int? branchId,
    @JsonKey(name: 'eye_type_id') int? eyeTypeId,
    String? status,
  }) = _ClientUpdateDto;
  factory ClientUpdateDto.fromJson(Map<String, dynamic> json) =>
      _$ClientUpdateDtoFromJson(json);
}

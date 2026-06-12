import 'package:freezed_annotation/freezed_annotation.dart';

part 'branch_dto.freezed.dart';
part 'branch_dto.g.dart';

@freezed
class BranchTimeRangeDto with _$BranchTimeRangeDto {
  const factory BranchTimeRangeDto({
    @JsonKey(name: 'open_time') required String openTime,
    @JsonKey(name: 'close_time') required String closeTime,
  }) = _BranchTimeRangeDto;

  factory BranchTimeRangeDto.fromJson(Map<String, dynamic> json) =>
      _$BranchTimeRangeDtoFromJson(json);
}

@freezed
class BranchDayScheduleDto with _$BranchDayScheduleDto {
  const factory BranchDayScheduleDto({
    required String day,
    @Default([]) List<BranchTimeRangeDto> ranges,
  }) = _BranchDayScheduleDto;

  factory BranchDayScheduleDto.fromJson(Map<String, dynamic> json) =>
      _$BranchDayScheduleDtoFromJson(json);
}

@freezed
class BranchDto with _$BranchDto {
  const factory BranchDto({
    required int id,
    required String name,
    String? address,
    String? city,
    String? department,
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
    @JsonKey(name: 'opening_hours') @Default([]) List<BranchDayScheduleDto> openingHours,
    @JsonKey(name: 'user_ids') @Default([]) List<int> userIds,
  }) = _BranchDto;

  factory BranchDto.fromJson(Map<String, dynamic> json) =>
      _$BranchDtoFromJson(json);
}

@freezed
class BranchCreateDto with _$BranchCreateDto {
  const factory BranchCreateDto({
    required String name,
    String? address,
    String? city,
    String? department,
    @JsonKey(name: 'opening_hours') @Default([]) List<BranchDayScheduleDto> openingHours,
    @JsonKey(name: 'user_ids') @Default([]) List<int> userIds,
  }) = _BranchCreateDto;

  factory BranchCreateDto.fromJson(Map<String, dynamic> json) =>
      _$BranchCreateDtoFromJson(json);
}

@freezed
class BranchUpdateDto with _$BranchUpdateDto {
  const factory BranchUpdateDto({
    String? name,
    String? address,
    String? city,
    String? department,
    @JsonKey(name: 'is_active') bool? isActive,
    @JsonKey(name: 'opening_hours') List<BranchDayScheduleDto>? openingHours,
    @JsonKey(name: 'user_ids') List<int>? userIds,
  }) = _BranchUpdateDto;

  factory BranchUpdateDto.fromJson(Map<String, dynamic> json) =>
      _$BranchUpdateDtoFromJson(json);
}

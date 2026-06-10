import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_dto.freezed.dart';
part 'service_dto.g.dart';

@freezed
class ServiceCategoryDto with _$ServiceCategoryDto {
  const factory ServiceCategoryDto({
    required int id,
    required String name,
    String? description,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'is_mobile') @Default(false) bool isMobile,
  }) = _ServiceCategoryDto;

  factory ServiceCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$ServiceCategoryDtoFromJson(json);
}

@freezed
class ServiceDto with _$ServiceDto {
  const factory ServiceDto({
    required int id,
    required String name,
    String? description,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'category_id') int? categoryId,
    @JsonKey(name: 'duration_minutes') required int durationMinutes,
    required double price,
    @JsonKey(name: 'commission_rate') double? commissionRate,
    @JsonKey(name: 'branch_ids') List<int>? branchIds,
    ServiceCategoryDto? category,
    @JsonKey(name: 'ticket_count') @Default(0) int ticketCount,
  }) = _ServiceDto;

  factory ServiceDto.fromJson(Map<String, dynamic> json) =>
      _$ServiceDtoFromJson(json);
}

@freezed
class ServiceCreateDto with _$ServiceCreateDto {
  const factory ServiceCreateDto({
    required String name,
    String? description,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'category_id') int? categoryId,
    @JsonKey(name: 'duration_minutes') required int durationMinutes,
    required double price,
    @JsonKey(name: 'commission_rate') double? commissionRate,
    @JsonKey(name: 'branch_ids') List<int>? branchIds,
  }) = _ServiceCreateDto;

  factory ServiceCreateDto.fromJson(Map<String, dynamic> json) =>
      _$ServiceCreateDtoFromJson(json);
}

@freezed
class ServiceUpdateDto with _$ServiceUpdateDto {
  const factory ServiceUpdateDto({
    String? name,
    String? description,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'category_id') int? categoryId,
    @JsonKey(name: 'duration_minutes') int? durationMinutes,
    double? price,
    @JsonKey(name: 'commission_rate') double? commissionRate,
    @JsonKey(name: 'branch_ids') List<int>? branchIds,
  }) = _ServiceUpdateDto;

  factory ServiceUpdateDto.fromJson(Map<String, dynamic> json) =>
      _$ServiceUpdateDtoFromJson(json);
}

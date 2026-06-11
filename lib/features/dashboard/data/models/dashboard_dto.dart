import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_dto.freezed.dart';
part 'dashboard_dto.g.dart';

@freezed
class RevenueSeriesItemDto with _$RevenueSeriesItemDto {
  const factory RevenueSeriesItemDto({
    required String bucket,
    @JsonKey(name: 'paid_amount') @Default(0.0) double paidAmount,
    @JsonKey(name: 'payments_count') @Default(0) int paymentsCount,
  }) = _RevenueSeriesItemDto;

  factory RevenueSeriesItemDto.fromJson(Map<String, dynamic> json) =>
      _$RevenueSeriesItemDtoFromJson(json);
}

@freezed
class ServiceDistributionItemDto with _$ServiceDistributionItemDto {
  const factory ServiceDistributionItemDto({
    @JsonKey(name: 'service_id') required int serviceId,
    @JsonKey(name: 'service_name') required String serviceName,
    @JsonKey(name: 'tickets_count') @Default(0) int ticketsCount,
    @JsonKey(name: 'completed_count') @Default(0) int completedCount,
    @JsonKey(name: 'estimated_revenue') @Default(0.0) double estimatedRevenue,
  }) = _ServiceDistributionItemDto;

  factory ServiceDistributionItemDto.fromJson(Map<String, dynamic> json) =>
      _$ServiceDistributionItemDtoFromJson(json);
}

@freezed
class DashboardCardsDto with _$DashboardCardsDto {
  const factory DashboardCardsDto({
    @JsonKey(name: 'clients_total') @Default(0) int clientsTotal,
    @JsonKey(name: 'clients_with_activity') @Default(0) int clientsWithActivity,
    @JsonKey(name: 'appointments_total') @Default(0) int appointmentsTotal,
    @JsonKey(name: 'appointments_pending') @Default(0) int appointmentsPending,
    @JsonKey(name: 'appointments_confirmed') @Default(0) int appointmentsConfirmed,
    @JsonKey(name: 'appointments_completed') @Default(0) int appointmentsCompleted,
    @JsonKey(name: 'appointments_cancelled') @Default(0) int appointmentsCancelled,
    @JsonKey(name: 'payments_paid_total') @Default(0.0) double paymentsPaidTotal,
    @JsonKey(name: 'payments_count') @Default(0) int paymentsCount,
    @JsonKey(name: 'avg_payment') @Default(0.0) double avgPayment,
    @JsonKey(name: 'pos_sales_count') @Default(0) int posSalesCount,
    @JsonKey(name: 'active_employees') @Default(0) int activeEmployees,
    @JsonKey(name: 'services_count') @Default(0) int servicesCount,
    @JsonKey(name: 'products_active_count') @Default(0) int productsActiveCount,
    @JsonKey(name: 'low_stock_items') @Default(0) int lowStockItems,
  }) = _DashboardCardsDto;

  factory DashboardCardsDto.fromJson(Map<String, dynamic> json) =>
      _$DashboardCardsDtoFromJson(json);
}

@freezed
class DashboardOverviewDto with _$DashboardOverviewDto {
  const factory DashboardOverviewDto({
    required DashboardCardsDto cards,
  }) = _DashboardOverviewDto;

  factory DashboardOverviewDto.fromJson(Map<String, dynamic> json) =>
      _$DashboardOverviewDtoFromJson(json);
}

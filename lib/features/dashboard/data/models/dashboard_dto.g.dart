// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RevenueSeriesItemDtoImpl _$$RevenueSeriesItemDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$RevenueSeriesItemDtoImpl(
      bucket: json['bucket'] as String,
      paidAmount: (json['paid_amount'] as num?)?.toDouble() ?? 0.0,
      paymentsCount: (json['payments_count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$RevenueSeriesItemDtoImplToJson(
        _$RevenueSeriesItemDtoImpl instance) =>
    <String, dynamic>{
      'bucket': instance.bucket,
      'paid_amount': instance.paidAmount,
      'payments_count': instance.paymentsCount,
    };

_$ServiceDistributionItemDtoImpl _$$ServiceDistributionItemDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ServiceDistributionItemDtoImpl(
      serviceId: (json['service_id'] as num).toInt(),
      serviceName: json['service_name'] as String,
      ticketsCount: (json['tickets_count'] as num?)?.toInt() ?? 0,
      completedCount: (json['completed_count'] as num?)?.toInt() ?? 0,
      estimatedRevenue: (json['estimated_revenue'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$ServiceDistributionItemDtoImplToJson(
        _$ServiceDistributionItemDtoImpl instance) =>
    <String, dynamic>{
      'service_id': instance.serviceId,
      'service_name': instance.serviceName,
      'tickets_count': instance.ticketsCount,
      'completed_count': instance.completedCount,
      'estimated_revenue': instance.estimatedRevenue,
    };

_$DashboardCardsDtoImpl _$$DashboardCardsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$DashboardCardsDtoImpl(
      clientsTotal: (json['clients_total'] as num?)?.toInt() ?? 0,
      clientsWithActivity:
          (json['clients_with_activity'] as num?)?.toInt() ?? 0,
      appointmentsTotal: (json['appointments_total'] as num?)?.toInt() ?? 0,
      appointmentsPending: (json['appointments_pending'] as num?)?.toInt() ?? 0,
      appointmentsConfirmed:
          (json['appointments_confirmed'] as num?)?.toInt() ?? 0,
      appointmentsCompleted:
          (json['appointments_completed'] as num?)?.toInt() ?? 0,
      appointmentsCancelled:
          (json['appointments_cancelled'] as num?)?.toInt() ?? 0,
      paymentsPaidTotal:
          (json['payments_paid_total'] as num?)?.toDouble() ?? 0.0,
      paymentsCount: (json['payments_count'] as num?)?.toInt() ?? 0,
      avgPayment: (json['avg_payment'] as num?)?.toDouble() ?? 0.0,
      posSalesCount: (json['pos_sales_count'] as num?)?.toInt() ?? 0,
      activeEmployees: (json['active_employees'] as num?)?.toInt() ?? 0,
      servicesCount: (json['services_count'] as num?)?.toInt() ?? 0,
      productsActiveCount:
          (json['products_active_count'] as num?)?.toInt() ?? 0,
      lowStockItems: (json['low_stock_items'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$DashboardCardsDtoImplToJson(
        _$DashboardCardsDtoImpl instance) =>
    <String, dynamic>{
      'clients_total': instance.clientsTotal,
      'clients_with_activity': instance.clientsWithActivity,
      'appointments_total': instance.appointmentsTotal,
      'appointments_pending': instance.appointmentsPending,
      'appointments_confirmed': instance.appointmentsConfirmed,
      'appointments_completed': instance.appointmentsCompleted,
      'appointments_cancelled': instance.appointmentsCancelled,
      'payments_paid_total': instance.paymentsPaidTotal,
      'payments_count': instance.paymentsCount,
      'avg_payment': instance.avgPayment,
      'pos_sales_count': instance.posSalesCount,
      'active_employees': instance.activeEmployees,
      'services_count': instance.servicesCount,
      'products_active_count': instance.productsActiveCount,
      'low_stock_items': instance.lowStockItems,
    };

_$DashboardOverviewDtoImpl _$$DashboardOverviewDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$DashboardOverviewDtoImpl(
      cards: DashboardCardsDto.fromJson(json['cards'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DashboardOverviewDtoImplToJson(
        _$DashboardOverviewDtoImpl instance) =>
    <String, dynamic>{
      'cards': instance.cards,
    };

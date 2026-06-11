// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RevenueSeriesItemDto _$RevenueSeriesItemDtoFromJson(Map<String, dynamic> json) {
  return _RevenueSeriesItemDto.fromJson(json);
}

/// @nodoc
mixin _$RevenueSeriesItemDto {
  String get bucket => throw _privateConstructorUsedError;
  @JsonKey(name: 'paid_amount')
  double get paidAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'payments_count')
  int get paymentsCount => throw _privateConstructorUsedError;

  /// Serializes this RevenueSeriesItemDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RevenueSeriesItemDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RevenueSeriesItemDtoCopyWith<RevenueSeriesItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RevenueSeriesItemDtoCopyWith<$Res> {
  factory $RevenueSeriesItemDtoCopyWith(RevenueSeriesItemDto value,
          $Res Function(RevenueSeriesItemDto) then) =
      _$RevenueSeriesItemDtoCopyWithImpl<$Res, RevenueSeriesItemDto>;
  @useResult
  $Res call(
      {String bucket,
      @JsonKey(name: 'paid_amount') double paidAmount,
      @JsonKey(name: 'payments_count') int paymentsCount});
}

/// @nodoc
class _$RevenueSeriesItemDtoCopyWithImpl<$Res,
        $Val extends RevenueSeriesItemDto>
    implements $RevenueSeriesItemDtoCopyWith<$Res> {
  _$RevenueSeriesItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RevenueSeriesItemDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bucket = null,
    Object? paidAmount = null,
    Object? paymentsCount = null,
  }) {
    return _then(_value.copyWith(
      bucket: null == bucket
          ? _value.bucket
          : bucket // ignore: cast_nullable_to_non_nullable
              as String,
      paidAmount: null == paidAmount
          ? _value.paidAmount
          : paidAmount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentsCount: null == paymentsCount
          ? _value.paymentsCount
          : paymentsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RevenueSeriesItemDtoImplCopyWith<$Res>
    implements $RevenueSeriesItemDtoCopyWith<$Res> {
  factory _$$RevenueSeriesItemDtoImplCopyWith(_$RevenueSeriesItemDtoImpl value,
          $Res Function(_$RevenueSeriesItemDtoImpl) then) =
      __$$RevenueSeriesItemDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String bucket,
      @JsonKey(name: 'paid_amount') double paidAmount,
      @JsonKey(name: 'payments_count') int paymentsCount});
}

/// @nodoc
class __$$RevenueSeriesItemDtoImplCopyWithImpl<$Res>
    extends _$RevenueSeriesItemDtoCopyWithImpl<$Res, _$RevenueSeriesItemDtoImpl>
    implements _$$RevenueSeriesItemDtoImplCopyWith<$Res> {
  __$$RevenueSeriesItemDtoImplCopyWithImpl(_$RevenueSeriesItemDtoImpl _value,
      $Res Function(_$RevenueSeriesItemDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of RevenueSeriesItemDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bucket = null,
    Object? paidAmount = null,
    Object? paymentsCount = null,
  }) {
    return _then(_$RevenueSeriesItemDtoImpl(
      bucket: null == bucket
          ? _value.bucket
          : bucket // ignore: cast_nullable_to_non_nullable
              as String,
      paidAmount: null == paidAmount
          ? _value.paidAmount
          : paidAmount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentsCount: null == paymentsCount
          ? _value.paymentsCount
          : paymentsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RevenueSeriesItemDtoImpl implements _RevenueSeriesItemDto {
  const _$RevenueSeriesItemDtoImpl(
      {required this.bucket,
      @JsonKey(name: 'paid_amount') this.paidAmount = 0.0,
      @JsonKey(name: 'payments_count') this.paymentsCount = 0});

  factory _$RevenueSeriesItemDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RevenueSeriesItemDtoImplFromJson(json);

  @override
  final String bucket;
  @override
  @JsonKey(name: 'paid_amount')
  final double paidAmount;
  @override
  @JsonKey(name: 'payments_count')
  final int paymentsCount;

  @override
  String toString() {
    return 'RevenueSeriesItemDto(bucket: $bucket, paidAmount: $paidAmount, paymentsCount: $paymentsCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RevenueSeriesItemDtoImpl &&
            (identical(other.bucket, bucket) || other.bucket == bucket) &&
            (identical(other.paidAmount, paidAmount) ||
                other.paidAmount == paidAmount) &&
            (identical(other.paymentsCount, paymentsCount) ||
                other.paymentsCount == paymentsCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, bucket, paidAmount, paymentsCount);

  /// Create a copy of RevenueSeriesItemDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RevenueSeriesItemDtoImplCopyWith<_$RevenueSeriesItemDtoImpl>
      get copyWith =>
          __$$RevenueSeriesItemDtoImplCopyWithImpl<_$RevenueSeriesItemDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RevenueSeriesItemDtoImplToJson(
      this,
    );
  }
}

abstract class _RevenueSeriesItemDto implements RevenueSeriesItemDto {
  const factory _RevenueSeriesItemDto(
          {required final String bucket,
          @JsonKey(name: 'paid_amount') final double paidAmount,
          @JsonKey(name: 'payments_count') final int paymentsCount}) =
      _$RevenueSeriesItemDtoImpl;

  factory _RevenueSeriesItemDto.fromJson(Map<String, dynamic> json) =
      _$RevenueSeriesItemDtoImpl.fromJson;

  @override
  String get bucket;
  @override
  @JsonKey(name: 'paid_amount')
  double get paidAmount;
  @override
  @JsonKey(name: 'payments_count')
  int get paymentsCount;

  /// Create a copy of RevenueSeriesItemDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RevenueSeriesItemDtoImplCopyWith<_$RevenueSeriesItemDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ServiceDistributionItemDto _$ServiceDistributionItemDtoFromJson(
    Map<String, dynamic> json) {
  return _ServiceDistributionItemDto.fromJson(json);
}

/// @nodoc
mixin _$ServiceDistributionItemDto {
  @JsonKey(name: 'service_id')
  int get serviceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'service_name')
  String get serviceName => throw _privateConstructorUsedError;
  @JsonKey(name: 'tickets_count')
  int get ticketsCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'completed_count')
  int get completedCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'estimated_revenue')
  double get estimatedRevenue => throw _privateConstructorUsedError;

  /// Serializes this ServiceDistributionItemDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ServiceDistributionItemDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServiceDistributionItemDtoCopyWith<ServiceDistributionItemDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceDistributionItemDtoCopyWith<$Res> {
  factory $ServiceDistributionItemDtoCopyWith(ServiceDistributionItemDto value,
          $Res Function(ServiceDistributionItemDto) then) =
      _$ServiceDistributionItemDtoCopyWithImpl<$Res,
          ServiceDistributionItemDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'service_id') int serviceId,
      @JsonKey(name: 'service_name') String serviceName,
      @JsonKey(name: 'tickets_count') int ticketsCount,
      @JsonKey(name: 'completed_count') int completedCount,
      @JsonKey(name: 'estimated_revenue') double estimatedRevenue});
}

/// @nodoc
class _$ServiceDistributionItemDtoCopyWithImpl<$Res,
        $Val extends ServiceDistributionItemDto>
    implements $ServiceDistributionItemDtoCopyWith<$Res> {
  _$ServiceDistributionItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServiceDistributionItemDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceId = null,
    Object? serviceName = null,
    Object? ticketsCount = null,
    Object? completedCount = null,
    Object? estimatedRevenue = null,
  }) {
    return _then(_value.copyWith(
      serviceId: null == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as int,
      serviceName: null == serviceName
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      ticketsCount: null == ticketsCount
          ? _value.ticketsCount
          : ticketsCount // ignore: cast_nullable_to_non_nullable
              as int,
      completedCount: null == completedCount
          ? _value.completedCount
          : completedCount // ignore: cast_nullable_to_non_nullable
              as int,
      estimatedRevenue: null == estimatedRevenue
          ? _value.estimatedRevenue
          : estimatedRevenue // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceDistributionItemDtoImplCopyWith<$Res>
    implements $ServiceDistributionItemDtoCopyWith<$Res> {
  factory _$$ServiceDistributionItemDtoImplCopyWith(
          _$ServiceDistributionItemDtoImpl value,
          $Res Function(_$ServiceDistributionItemDtoImpl) then) =
      __$$ServiceDistributionItemDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'service_id') int serviceId,
      @JsonKey(name: 'service_name') String serviceName,
      @JsonKey(name: 'tickets_count') int ticketsCount,
      @JsonKey(name: 'completed_count') int completedCount,
      @JsonKey(name: 'estimated_revenue') double estimatedRevenue});
}

/// @nodoc
class __$$ServiceDistributionItemDtoImplCopyWithImpl<$Res>
    extends _$ServiceDistributionItemDtoCopyWithImpl<$Res,
        _$ServiceDistributionItemDtoImpl>
    implements _$$ServiceDistributionItemDtoImplCopyWith<$Res> {
  __$$ServiceDistributionItemDtoImplCopyWithImpl(
      _$ServiceDistributionItemDtoImpl _value,
      $Res Function(_$ServiceDistributionItemDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServiceDistributionItemDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceId = null,
    Object? serviceName = null,
    Object? ticketsCount = null,
    Object? completedCount = null,
    Object? estimatedRevenue = null,
  }) {
    return _then(_$ServiceDistributionItemDtoImpl(
      serviceId: null == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as int,
      serviceName: null == serviceName
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      ticketsCount: null == ticketsCount
          ? _value.ticketsCount
          : ticketsCount // ignore: cast_nullable_to_non_nullable
              as int,
      completedCount: null == completedCount
          ? _value.completedCount
          : completedCount // ignore: cast_nullable_to_non_nullable
              as int,
      estimatedRevenue: null == estimatedRevenue
          ? _value.estimatedRevenue
          : estimatedRevenue // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceDistributionItemDtoImpl implements _ServiceDistributionItemDto {
  const _$ServiceDistributionItemDtoImpl(
      {@JsonKey(name: 'service_id') required this.serviceId,
      @JsonKey(name: 'service_name') required this.serviceName,
      @JsonKey(name: 'tickets_count') this.ticketsCount = 0,
      @JsonKey(name: 'completed_count') this.completedCount = 0,
      @JsonKey(name: 'estimated_revenue') this.estimatedRevenue = 0.0});

  factory _$ServiceDistributionItemDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ServiceDistributionItemDtoImplFromJson(json);

  @override
  @JsonKey(name: 'service_id')
  final int serviceId;
  @override
  @JsonKey(name: 'service_name')
  final String serviceName;
  @override
  @JsonKey(name: 'tickets_count')
  final int ticketsCount;
  @override
  @JsonKey(name: 'completed_count')
  final int completedCount;
  @override
  @JsonKey(name: 'estimated_revenue')
  final double estimatedRevenue;

  @override
  String toString() {
    return 'ServiceDistributionItemDto(serviceId: $serviceId, serviceName: $serviceName, ticketsCount: $ticketsCount, completedCount: $completedCount, estimatedRevenue: $estimatedRevenue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceDistributionItemDtoImpl &&
            (identical(other.serviceId, serviceId) ||
                other.serviceId == serviceId) &&
            (identical(other.serviceName, serviceName) ||
                other.serviceName == serviceName) &&
            (identical(other.ticketsCount, ticketsCount) ||
                other.ticketsCount == ticketsCount) &&
            (identical(other.completedCount, completedCount) ||
                other.completedCount == completedCount) &&
            (identical(other.estimatedRevenue, estimatedRevenue) ||
                other.estimatedRevenue == estimatedRevenue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, serviceId, serviceName,
      ticketsCount, completedCount, estimatedRevenue);

  /// Create a copy of ServiceDistributionItemDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceDistributionItemDtoImplCopyWith<_$ServiceDistributionItemDtoImpl>
      get copyWith => __$$ServiceDistributionItemDtoImplCopyWithImpl<
          _$ServiceDistributionItemDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceDistributionItemDtoImplToJson(
      this,
    );
  }
}

abstract class _ServiceDistributionItemDto
    implements ServiceDistributionItemDto {
  const factory _ServiceDistributionItemDto(
          {@JsonKey(name: 'service_id') required final int serviceId,
          @JsonKey(name: 'service_name') required final String serviceName,
          @JsonKey(name: 'tickets_count') final int ticketsCount,
          @JsonKey(name: 'completed_count') final int completedCount,
          @JsonKey(name: 'estimated_revenue') final double estimatedRevenue}) =
      _$ServiceDistributionItemDtoImpl;

  factory _ServiceDistributionItemDto.fromJson(Map<String, dynamic> json) =
      _$ServiceDistributionItemDtoImpl.fromJson;

  @override
  @JsonKey(name: 'service_id')
  int get serviceId;
  @override
  @JsonKey(name: 'service_name')
  String get serviceName;
  @override
  @JsonKey(name: 'tickets_count')
  int get ticketsCount;
  @override
  @JsonKey(name: 'completed_count')
  int get completedCount;
  @override
  @JsonKey(name: 'estimated_revenue')
  double get estimatedRevenue;

  /// Create a copy of ServiceDistributionItemDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServiceDistributionItemDtoImplCopyWith<_$ServiceDistributionItemDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DashboardCardsDto _$DashboardCardsDtoFromJson(Map<String, dynamic> json) {
  return _DashboardCardsDto.fromJson(json);
}

/// @nodoc
mixin _$DashboardCardsDto {
  @JsonKey(name: 'clients_total')
  int get clientsTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'clients_with_activity')
  int get clientsWithActivity => throw _privateConstructorUsedError;
  @JsonKey(name: 'appointments_total')
  int get appointmentsTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'appointments_pending')
  int get appointmentsPending => throw _privateConstructorUsedError;
  @JsonKey(name: 'appointments_confirmed')
  int get appointmentsConfirmed => throw _privateConstructorUsedError;
  @JsonKey(name: 'appointments_completed')
  int get appointmentsCompleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'appointments_cancelled')
  int get appointmentsCancelled => throw _privateConstructorUsedError;
  @JsonKey(name: 'payments_paid_total')
  double get paymentsPaidTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'payments_count')
  int get paymentsCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'avg_payment')
  double get avgPayment => throw _privateConstructorUsedError;
  @JsonKey(name: 'pos_sales_count')
  int get posSalesCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'active_employees')
  int get activeEmployees => throw _privateConstructorUsedError;
  @JsonKey(name: 'services_count')
  int get servicesCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'products_active_count')
  int get productsActiveCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'low_stock_items')
  int get lowStockItems => throw _privateConstructorUsedError;

  /// Serializes this DashboardCardsDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DashboardCardsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardCardsDtoCopyWith<DashboardCardsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardCardsDtoCopyWith<$Res> {
  factory $DashboardCardsDtoCopyWith(
          DashboardCardsDto value, $Res Function(DashboardCardsDto) then) =
      _$DashboardCardsDtoCopyWithImpl<$Res, DashboardCardsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'clients_total') int clientsTotal,
      @JsonKey(name: 'clients_with_activity') int clientsWithActivity,
      @JsonKey(name: 'appointments_total') int appointmentsTotal,
      @JsonKey(name: 'appointments_pending') int appointmentsPending,
      @JsonKey(name: 'appointments_confirmed') int appointmentsConfirmed,
      @JsonKey(name: 'appointments_completed') int appointmentsCompleted,
      @JsonKey(name: 'appointments_cancelled') int appointmentsCancelled,
      @JsonKey(name: 'payments_paid_total') double paymentsPaidTotal,
      @JsonKey(name: 'payments_count') int paymentsCount,
      @JsonKey(name: 'avg_payment') double avgPayment,
      @JsonKey(name: 'pos_sales_count') int posSalesCount,
      @JsonKey(name: 'active_employees') int activeEmployees,
      @JsonKey(name: 'services_count') int servicesCount,
      @JsonKey(name: 'products_active_count') int productsActiveCount,
      @JsonKey(name: 'low_stock_items') int lowStockItems});
}

/// @nodoc
class _$DashboardCardsDtoCopyWithImpl<$Res, $Val extends DashboardCardsDto>
    implements $DashboardCardsDtoCopyWith<$Res> {
  _$DashboardCardsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardCardsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientsTotal = null,
    Object? clientsWithActivity = null,
    Object? appointmentsTotal = null,
    Object? appointmentsPending = null,
    Object? appointmentsConfirmed = null,
    Object? appointmentsCompleted = null,
    Object? appointmentsCancelled = null,
    Object? paymentsPaidTotal = null,
    Object? paymentsCount = null,
    Object? avgPayment = null,
    Object? posSalesCount = null,
    Object? activeEmployees = null,
    Object? servicesCount = null,
    Object? productsActiveCount = null,
    Object? lowStockItems = null,
  }) {
    return _then(_value.copyWith(
      clientsTotal: null == clientsTotal
          ? _value.clientsTotal
          : clientsTotal // ignore: cast_nullable_to_non_nullable
              as int,
      clientsWithActivity: null == clientsWithActivity
          ? _value.clientsWithActivity
          : clientsWithActivity // ignore: cast_nullable_to_non_nullable
              as int,
      appointmentsTotal: null == appointmentsTotal
          ? _value.appointmentsTotal
          : appointmentsTotal // ignore: cast_nullable_to_non_nullable
              as int,
      appointmentsPending: null == appointmentsPending
          ? _value.appointmentsPending
          : appointmentsPending // ignore: cast_nullable_to_non_nullable
              as int,
      appointmentsConfirmed: null == appointmentsConfirmed
          ? _value.appointmentsConfirmed
          : appointmentsConfirmed // ignore: cast_nullable_to_non_nullable
              as int,
      appointmentsCompleted: null == appointmentsCompleted
          ? _value.appointmentsCompleted
          : appointmentsCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      appointmentsCancelled: null == appointmentsCancelled
          ? _value.appointmentsCancelled
          : appointmentsCancelled // ignore: cast_nullable_to_non_nullable
              as int,
      paymentsPaidTotal: null == paymentsPaidTotal
          ? _value.paymentsPaidTotal
          : paymentsPaidTotal // ignore: cast_nullable_to_non_nullable
              as double,
      paymentsCount: null == paymentsCount
          ? _value.paymentsCount
          : paymentsCount // ignore: cast_nullable_to_non_nullable
              as int,
      avgPayment: null == avgPayment
          ? _value.avgPayment
          : avgPayment // ignore: cast_nullable_to_non_nullable
              as double,
      posSalesCount: null == posSalesCount
          ? _value.posSalesCount
          : posSalesCount // ignore: cast_nullable_to_non_nullable
              as int,
      activeEmployees: null == activeEmployees
          ? _value.activeEmployees
          : activeEmployees // ignore: cast_nullable_to_non_nullable
              as int,
      servicesCount: null == servicesCount
          ? _value.servicesCount
          : servicesCount // ignore: cast_nullable_to_non_nullable
              as int,
      productsActiveCount: null == productsActiveCount
          ? _value.productsActiveCount
          : productsActiveCount // ignore: cast_nullable_to_non_nullable
              as int,
      lowStockItems: null == lowStockItems
          ? _value.lowStockItems
          : lowStockItems // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DashboardCardsDtoImplCopyWith<$Res>
    implements $DashboardCardsDtoCopyWith<$Res> {
  factory _$$DashboardCardsDtoImplCopyWith(_$DashboardCardsDtoImpl value,
          $Res Function(_$DashboardCardsDtoImpl) then) =
      __$$DashboardCardsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'clients_total') int clientsTotal,
      @JsonKey(name: 'clients_with_activity') int clientsWithActivity,
      @JsonKey(name: 'appointments_total') int appointmentsTotal,
      @JsonKey(name: 'appointments_pending') int appointmentsPending,
      @JsonKey(name: 'appointments_confirmed') int appointmentsConfirmed,
      @JsonKey(name: 'appointments_completed') int appointmentsCompleted,
      @JsonKey(name: 'appointments_cancelled') int appointmentsCancelled,
      @JsonKey(name: 'payments_paid_total') double paymentsPaidTotal,
      @JsonKey(name: 'payments_count') int paymentsCount,
      @JsonKey(name: 'avg_payment') double avgPayment,
      @JsonKey(name: 'pos_sales_count') int posSalesCount,
      @JsonKey(name: 'active_employees') int activeEmployees,
      @JsonKey(name: 'services_count') int servicesCount,
      @JsonKey(name: 'products_active_count') int productsActiveCount,
      @JsonKey(name: 'low_stock_items') int lowStockItems});
}

/// @nodoc
class __$$DashboardCardsDtoImplCopyWithImpl<$Res>
    extends _$DashboardCardsDtoCopyWithImpl<$Res, _$DashboardCardsDtoImpl>
    implements _$$DashboardCardsDtoImplCopyWith<$Res> {
  __$$DashboardCardsDtoImplCopyWithImpl(_$DashboardCardsDtoImpl _value,
      $Res Function(_$DashboardCardsDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardCardsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientsTotal = null,
    Object? clientsWithActivity = null,
    Object? appointmentsTotal = null,
    Object? appointmentsPending = null,
    Object? appointmentsConfirmed = null,
    Object? appointmentsCompleted = null,
    Object? appointmentsCancelled = null,
    Object? paymentsPaidTotal = null,
    Object? paymentsCount = null,
    Object? avgPayment = null,
    Object? posSalesCount = null,
    Object? activeEmployees = null,
    Object? servicesCount = null,
    Object? productsActiveCount = null,
    Object? lowStockItems = null,
  }) {
    return _then(_$DashboardCardsDtoImpl(
      clientsTotal: null == clientsTotal
          ? _value.clientsTotal
          : clientsTotal // ignore: cast_nullable_to_non_nullable
              as int,
      clientsWithActivity: null == clientsWithActivity
          ? _value.clientsWithActivity
          : clientsWithActivity // ignore: cast_nullable_to_non_nullable
              as int,
      appointmentsTotal: null == appointmentsTotal
          ? _value.appointmentsTotal
          : appointmentsTotal // ignore: cast_nullable_to_non_nullable
              as int,
      appointmentsPending: null == appointmentsPending
          ? _value.appointmentsPending
          : appointmentsPending // ignore: cast_nullable_to_non_nullable
              as int,
      appointmentsConfirmed: null == appointmentsConfirmed
          ? _value.appointmentsConfirmed
          : appointmentsConfirmed // ignore: cast_nullable_to_non_nullable
              as int,
      appointmentsCompleted: null == appointmentsCompleted
          ? _value.appointmentsCompleted
          : appointmentsCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      appointmentsCancelled: null == appointmentsCancelled
          ? _value.appointmentsCancelled
          : appointmentsCancelled // ignore: cast_nullable_to_non_nullable
              as int,
      paymentsPaidTotal: null == paymentsPaidTotal
          ? _value.paymentsPaidTotal
          : paymentsPaidTotal // ignore: cast_nullable_to_non_nullable
              as double,
      paymentsCount: null == paymentsCount
          ? _value.paymentsCount
          : paymentsCount // ignore: cast_nullable_to_non_nullable
              as int,
      avgPayment: null == avgPayment
          ? _value.avgPayment
          : avgPayment // ignore: cast_nullable_to_non_nullable
              as double,
      posSalesCount: null == posSalesCount
          ? _value.posSalesCount
          : posSalesCount // ignore: cast_nullable_to_non_nullable
              as int,
      activeEmployees: null == activeEmployees
          ? _value.activeEmployees
          : activeEmployees // ignore: cast_nullable_to_non_nullable
              as int,
      servicesCount: null == servicesCount
          ? _value.servicesCount
          : servicesCount // ignore: cast_nullable_to_non_nullable
              as int,
      productsActiveCount: null == productsActiveCount
          ? _value.productsActiveCount
          : productsActiveCount // ignore: cast_nullable_to_non_nullable
              as int,
      lowStockItems: null == lowStockItems
          ? _value.lowStockItems
          : lowStockItems // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardCardsDtoImpl implements _DashboardCardsDto {
  const _$DashboardCardsDtoImpl(
      {@JsonKey(name: 'clients_total') this.clientsTotal = 0,
      @JsonKey(name: 'clients_with_activity') this.clientsWithActivity = 0,
      @JsonKey(name: 'appointments_total') this.appointmentsTotal = 0,
      @JsonKey(name: 'appointments_pending') this.appointmentsPending = 0,
      @JsonKey(name: 'appointments_confirmed') this.appointmentsConfirmed = 0,
      @JsonKey(name: 'appointments_completed') this.appointmentsCompleted = 0,
      @JsonKey(name: 'appointments_cancelled') this.appointmentsCancelled = 0,
      @JsonKey(name: 'payments_paid_total') this.paymentsPaidTotal = 0.0,
      @JsonKey(name: 'payments_count') this.paymentsCount = 0,
      @JsonKey(name: 'avg_payment') this.avgPayment = 0.0,
      @JsonKey(name: 'pos_sales_count') this.posSalesCount = 0,
      @JsonKey(name: 'active_employees') this.activeEmployees = 0,
      @JsonKey(name: 'services_count') this.servicesCount = 0,
      @JsonKey(name: 'products_active_count') this.productsActiveCount = 0,
      @JsonKey(name: 'low_stock_items') this.lowStockItems = 0});

  factory _$DashboardCardsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardCardsDtoImplFromJson(json);

  @override
  @JsonKey(name: 'clients_total')
  final int clientsTotal;
  @override
  @JsonKey(name: 'clients_with_activity')
  final int clientsWithActivity;
  @override
  @JsonKey(name: 'appointments_total')
  final int appointmentsTotal;
  @override
  @JsonKey(name: 'appointments_pending')
  final int appointmentsPending;
  @override
  @JsonKey(name: 'appointments_confirmed')
  final int appointmentsConfirmed;
  @override
  @JsonKey(name: 'appointments_completed')
  final int appointmentsCompleted;
  @override
  @JsonKey(name: 'appointments_cancelled')
  final int appointmentsCancelled;
  @override
  @JsonKey(name: 'payments_paid_total')
  final double paymentsPaidTotal;
  @override
  @JsonKey(name: 'payments_count')
  final int paymentsCount;
  @override
  @JsonKey(name: 'avg_payment')
  final double avgPayment;
  @override
  @JsonKey(name: 'pos_sales_count')
  final int posSalesCount;
  @override
  @JsonKey(name: 'active_employees')
  final int activeEmployees;
  @override
  @JsonKey(name: 'services_count')
  final int servicesCount;
  @override
  @JsonKey(name: 'products_active_count')
  final int productsActiveCount;
  @override
  @JsonKey(name: 'low_stock_items')
  final int lowStockItems;

  @override
  String toString() {
    return 'DashboardCardsDto(clientsTotal: $clientsTotal, clientsWithActivity: $clientsWithActivity, appointmentsTotal: $appointmentsTotal, appointmentsPending: $appointmentsPending, appointmentsConfirmed: $appointmentsConfirmed, appointmentsCompleted: $appointmentsCompleted, appointmentsCancelled: $appointmentsCancelled, paymentsPaidTotal: $paymentsPaidTotal, paymentsCount: $paymentsCount, avgPayment: $avgPayment, posSalesCount: $posSalesCount, activeEmployees: $activeEmployees, servicesCount: $servicesCount, productsActiveCount: $productsActiveCount, lowStockItems: $lowStockItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardCardsDtoImpl &&
            (identical(other.clientsTotal, clientsTotal) ||
                other.clientsTotal == clientsTotal) &&
            (identical(other.clientsWithActivity, clientsWithActivity) ||
                other.clientsWithActivity == clientsWithActivity) &&
            (identical(other.appointmentsTotal, appointmentsTotal) ||
                other.appointmentsTotal == appointmentsTotal) &&
            (identical(other.appointmentsPending, appointmentsPending) ||
                other.appointmentsPending == appointmentsPending) &&
            (identical(other.appointmentsConfirmed, appointmentsConfirmed) ||
                other.appointmentsConfirmed == appointmentsConfirmed) &&
            (identical(other.appointmentsCompleted, appointmentsCompleted) ||
                other.appointmentsCompleted == appointmentsCompleted) &&
            (identical(other.appointmentsCancelled, appointmentsCancelled) ||
                other.appointmentsCancelled == appointmentsCancelled) &&
            (identical(other.paymentsPaidTotal, paymentsPaidTotal) ||
                other.paymentsPaidTotal == paymentsPaidTotal) &&
            (identical(other.paymentsCount, paymentsCount) ||
                other.paymentsCount == paymentsCount) &&
            (identical(other.avgPayment, avgPayment) ||
                other.avgPayment == avgPayment) &&
            (identical(other.posSalesCount, posSalesCount) ||
                other.posSalesCount == posSalesCount) &&
            (identical(other.activeEmployees, activeEmployees) ||
                other.activeEmployees == activeEmployees) &&
            (identical(other.servicesCount, servicesCount) ||
                other.servicesCount == servicesCount) &&
            (identical(other.productsActiveCount, productsActiveCount) ||
                other.productsActiveCount == productsActiveCount) &&
            (identical(other.lowStockItems, lowStockItems) ||
                other.lowStockItems == lowStockItems));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      clientsTotal,
      clientsWithActivity,
      appointmentsTotal,
      appointmentsPending,
      appointmentsConfirmed,
      appointmentsCompleted,
      appointmentsCancelled,
      paymentsPaidTotal,
      paymentsCount,
      avgPayment,
      posSalesCount,
      activeEmployees,
      servicesCount,
      productsActiveCount,
      lowStockItems);

  /// Create a copy of DashboardCardsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardCardsDtoImplCopyWith<_$DashboardCardsDtoImpl> get copyWith =>
      __$$DashboardCardsDtoImplCopyWithImpl<_$DashboardCardsDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardCardsDtoImplToJson(
      this,
    );
  }
}

abstract class _DashboardCardsDto implements DashboardCardsDto {
  const factory _DashboardCardsDto(
      {@JsonKey(name: 'clients_total') final int clientsTotal,
      @JsonKey(name: 'clients_with_activity') final int clientsWithActivity,
      @JsonKey(name: 'appointments_total') final int appointmentsTotal,
      @JsonKey(name: 'appointments_pending') final int appointmentsPending,
      @JsonKey(name: 'appointments_confirmed') final int appointmentsConfirmed,
      @JsonKey(name: 'appointments_completed') final int appointmentsCompleted,
      @JsonKey(name: 'appointments_cancelled') final int appointmentsCancelled,
      @JsonKey(name: 'payments_paid_total') final double paymentsPaidTotal,
      @JsonKey(name: 'payments_count') final int paymentsCount,
      @JsonKey(name: 'avg_payment') final double avgPayment,
      @JsonKey(name: 'pos_sales_count') final int posSalesCount,
      @JsonKey(name: 'active_employees') final int activeEmployees,
      @JsonKey(name: 'services_count') final int servicesCount,
      @JsonKey(name: 'products_active_count') final int productsActiveCount,
      @JsonKey(name: 'low_stock_items')
      final int lowStockItems}) = _$DashboardCardsDtoImpl;

  factory _DashboardCardsDto.fromJson(Map<String, dynamic> json) =
      _$DashboardCardsDtoImpl.fromJson;

  @override
  @JsonKey(name: 'clients_total')
  int get clientsTotal;
  @override
  @JsonKey(name: 'clients_with_activity')
  int get clientsWithActivity;
  @override
  @JsonKey(name: 'appointments_total')
  int get appointmentsTotal;
  @override
  @JsonKey(name: 'appointments_pending')
  int get appointmentsPending;
  @override
  @JsonKey(name: 'appointments_confirmed')
  int get appointmentsConfirmed;
  @override
  @JsonKey(name: 'appointments_completed')
  int get appointmentsCompleted;
  @override
  @JsonKey(name: 'appointments_cancelled')
  int get appointmentsCancelled;
  @override
  @JsonKey(name: 'payments_paid_total')
  double get paymentsPaidTotal;
  @override
  @JsonKey(name: 'payments_count')
  int get paymentsCount;
  @override
  @JsonKey(name: 'avg_payment')
  double get avgPayment;
  @override
  @JsonKey(name: 'pos_sales_count')
  int get posSalesCount;
  @override
  @JsonKey(name: 'active_employees')
  int get activeEmployees;
  @override
  @JsonKey(name: 'services_count')
  int get servicesCount;
  @override
  @JsonKey(name: 'products_active_count')
  int get productsActiveCount;
  @override
  @JsonKey(name: 'low_stock_items')
  int get lowStockItems;

  /// Create a copy of DashboardCardsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardCardsDtoImplCopyWith<_$DashboardCardsDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DashboardOverviewDto _$DashboardOverviewDtoFromJson(Map<String, dynamic> json) {
  return _DashboardOverviewDto.fromJson(json);
}

/// @nodoc
mixin _$DashboardOverviewDto {
  DashboardCardsDto get cards => throw _privateConstructorUsedError;

  /// Serializes this DashboardOverviewDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DashboardOverviewDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardOverviewDtoCopyWith<DashboardOverviewDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardOverviewDtoCopyWith<$Res> {
  factory $DashboardOverviewDtoCopyWith(DashboardOverviewDto value,
          $Res Function(DashboardOverviewDto) then) =
      _$DashboardOverviewDtoCopyWithImpl<$Res, DashboardOverviewDto>;
  @useResult
  $Res call({DashboardCardsDto cards});

  $DashboardCardsDtoCopyWith<$Res> get cards;
}

/// @nodoc
class _$DashboardOverviewDtoCopyWithImpl<$Res,
        $Val extends DashboardOverviewDto>
    implements $DashboardOverviewDtoCopyWith<$Res> {
  _$DashboardOverviewDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardOverviewDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cards = null,
  }) {
    return _then(_value.copyWith(
      cards: null == cards
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as DashboardCardsDto,
    ) as $Val);
  }

  /// Create a copy of DashboardOverviewDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DashboardCardsDtoCopyWith<$Res> get cards {
    return $DashboardCardsDtoCopyWith<$Res>(_value.cards, (value) {
      return _then(_value.copyWith(cards: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DashboardOverviewDtoImplCopyWith<$Res>
    implements $DashboardOverviewDtoCopyWith<$Res> {
  factory _$$DashboardOverviewDtoImplCopyWith(_$DashboardOverviewDtoImpl value,
          $Res Function(_$DashboardOverviewDtoImpl) then) =
      __$$DashboardOverviewDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DashboardCardsDto cards});

  @override
  $DashboardCardsDtoCopyWith<$Res> get cards;
}

/// @nodoc
class __$$DashboardOverviewDtoImplCopyWithImpl<$Res>
    extends _$DashboardOverviewDtoCopyWithImpl<$Res, _$DashboardOverviewDtoImpl>
    implements _$$DashboardOverviewDtoImplCopyWith<$Res> {
  __$$DashboardOverviewDtoImplCopyWithImpl(_$DashboardOverviewDtoImpl _value,
      $Res Function(_$DashboardOverviewDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardOverviewDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cards = null,
  }) {
    return _then(_$DashboardOverviewDtoImpl(
      cards: null == cards
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as DashboardCardsDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardOverviewDtoImpl implements _DashboardOverviewDto {
  const _$DashboardOverviewDtoImpl({required this.cards});

  factory _$DashboardOverviewDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardOverviewDtoImplFromJson(json);

  @override
  final DashboardCardsDto cards;

  @override
  String toString() {
    return 'DashboardOverviewDto(cards: $cards)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardOverviewDtoImpl &&
            (identical(other.cards, cards) || other.cards == cards));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, cards);

  /// Create a copy of DashboardOverviewDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardOverviewDtoImplCopyWith<_$DashboardOverviewDtoImpl>
      get copyWith =>
          __$$DashboardOverviewDtoImplCopyWithImpl<_$DashboardOverviewDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardOverviewDtoImplToJson(
      this,
    );
  }
}

abstract class _DashboardOverviewDto implements DashboardOverviewDto {
  const factory _DashboardOverviewDto(
      {required final DashboardCardsDto cards}) = _$DashboardOverviewDtoImpl;

  factory _DashboardOverviewDto.fromJson(Map<String, dynamic> json) =
      _$DashboardOverviewDtoImpl.fromJson;

  @override
  DashboardCardsDto get cards;

  /// Create a copy of DashboardOverviewDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardOverviewDtoImplCopyWith<_$DashboardOverviewDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

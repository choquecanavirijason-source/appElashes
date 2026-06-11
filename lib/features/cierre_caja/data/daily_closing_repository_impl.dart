import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/dio_client.dart';
import 'daily_closing_api.dart';
import 'models/daily_closing_dto.dart';

class ClosingItem {
  const ClosingItem({
    required this.appointmentId,
    this.ticketCode,
    this.saleCode,
    required this.clientName,
    required this.serviceNames,
    required this.professionalName,
    this.professionalId,
    required this.startTime,
    required this.durationMinutes,
    required this.status,
    required this.totalPrice,
    required this.commissionRate,
    required this.commission,
    required this.isPaid,
    this.paymentMethod,
    required this.balanceDue,
  });

  final int appointmentId;
  final String? ticketCode;
  final String? saleCode;
  final String clientName;
  final List<String> serviceNames;
  final String professionalName;
  final int? professionalId;
  final DateTime startTime;
  final int durationMinutes;
  final String status;
  final double totalPrice;
  final double commissionRate;
  final double commission;
  final bool isPaid;
  final String? paymentMethod;
  final double balanceDue;

  String get servicesLabel => serviceNames.join(', ');

  factory ClosingItem.fromDto(DailyClosingItemDto dto) => ClosingItem(
        appointmentId: dto.appointmentId,
        ticketCode: dto.ticketCode,
        saleCode: dto.saleCode,
        clientName: dto.clientName,
        serviceNames: dto.serviceNames,
        professionalName: dto.professionalName,
        professionalId: dto.professionalId,
        startTime: DateTime.parse(dto.startTime),
        durationMinutes: dto.durationMinutes,
        status: dto.status,
        totalPrice: dto.totalPrice,
        commissionRate: dto.commissionRate,
        commission: dto.commission,
        isPaid: dto.isPaid,
        paymentMethod: dto.paymentMethod,
        balanceDue: dto.balanceDue,
      );
}

class ProfessionalClosingSummary {
  const ProfessionalClosingSummary({
    this.professionalId,
    required this.professionalName,
    required this.ticketCount,
    required this.totalPrice,
    required this.commission,
    required this.commissionRate,
  });

  final int? professionalId;
  final String professionalName;
  final int ticketCount;
  final double totalPrice;
  final double commission;
  final double commissionRate;

  factory ProfessionalClosingSummary.fromDto(ProfessionalSummaryDto dto) =>
      ProfessionalClosingSummary(
        professionalId: dto.professionalId,
        professionalName: dto.professionalName,
        ticketCount: dto.ticketCount,
        totalPrice: dto.totalPrice,
        commission: dto.commission,
        commissionRate: dto.commissionRate,
      );
}

class DailyClosing {
  const DailyClosing({
    required this.date,
    this.branchName,
    required this.items,
    required this.grandTotal,
    required this.grandCommission,
    required this.totalPaid,
    required this.totalUnpaid,
    required this.totalsByPayment,
    required this.summaryByProfessional,
  });

  final String date;
  final String? branchName;
  final List<ClosingItem> items;
  final double grandTotal;
  final double grandCommission;
  final double totalPaid;
  final double totalUnpaid;
  final Map<String, double> totalsByPayment;
  final List<ProfessionalClosingSummary> summaryByProfessional;

  factory DailyClosing.fromDto(DailyClosingResponseDto dto) => DailyClosing(
        date: dto.date,
        branchName: dto.branchName,
        items: dto.items.map(ClosingItem.fromDto).toList(),
        grandTotal: dto.grandTotal,
        grandCommission: dto.grandCommission,
        totalPaid: dto.totalPaid,
        totalUnpaid: dto.totalUnpaid,
        totalsByPayment: dto.totalsByPayment,
        summaryByProfessional:
            dto.summaryByProfessional.map(ProfessionalClosingSummary.fromDto).toList(),
      );
}

abstract interface class DailyClosingRepository {
  Future<DailyClosing> getClosing({required String date, int? branchId});
}

class DailyClosingRepositoryImpl implements DailyClosingRepository {
  const DailyClosingRepositoryImpl(this._api);

  final DailyClosingApi _api;

  @override
  Future<DailyClosing> getClosing({required String date, int? branchId}) async {
    final dto = await _api.getClosing(date: date, branchId: branchId);
    return DailyClosing.fromDto(dto);
  }
}

final dailyClosingRepositoryProvider = Provider<DailyClosingRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return DailyClosingRepositoryImpl(DailyClosingApi(dio));
});

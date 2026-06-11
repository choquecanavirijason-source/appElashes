import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/dio_client.dart';
import 'commissions_api.dart';
import 'models/commission_dto.dart';

class CommissionPayment {
  const CommissionPayment({
    required this.id,
    required this.professionalId,
    required this.professionalName,
    required this.amount,
    this.periodStart,
    this.periodEnd,
    this.notes,
    required this.registeredAt,
    this.registeredByName,
  });

  final int id;
  final int professionalId;
  final String professionalName;
  final double amount;
  final String? periodStart;
  final String? periodEnd;
  final String? notes;
  final DateTime registeredAt;
  final String? registeredByName;

  String get periodLabel {
    if (periodStart != null && periodEnd != null) {
      return '$periodStart – $periodEnd';
    }
    return periodStart ?? periodEnd ?? '—';
  }

  factory CommissionPayment.fromDto(CommissionPaymentDto dto) =>
      CommissionPayment(
        id: dto.id,
        professionalId: dto.professionalId,
        professionalName: dto.professionalName,
        amount: dto.amount,
        periodStart: dto.periodStart,
        periodEnd: dto.periodEnd,
        notes: dto.notes,
        registeredAt: DateTime.parse(dto.registeredAt),
        registeredByName: dto.registeredByName,
      );
}

class ProfessionalOption {
  const ProfessionalOption({required this.id, required this.displayName});
  final int id;
  final String displayName;
}

abstract interface class CommissionsRepository {
  Future<List<CommissionPayment>> list();
  Future<CommissionPayment> create(CommissionPaymentCreateDto dto);
  Future<void> delete(int id);
  Future<List<ProfessionalOption>> getProfessionals();
}

class CommissionsRepositoryImpl implements CommissionsRepository {
  const CommissionsRepositoryImpl(this._api);

  final CommissionsApi _api;

  @override
  Future<List<CommissionPayment>> list() async {
    final dtos = await _api.list();
    return dtos.map(CommissionPayment.fromDto).toList();
  }

  @override
  Future<CommissionPayment> create(CommissionPaymentCreateDto dto) async {
    final result = await _api.create(dto);
    return CommissionPayment.fromDto(result);
  }

  @override
  Future<void> delete(int id) => _api.delete(id);

  @override
  Future<List<ProfessionalOption>> getProfessionals() async {
    final dtos = await _api.getProfessionals();
    return dtos
        .map((d) => ProfessionalOption(id: d.id, displayName: d.username))
        .toList();
  }
}

final commissionsRepositoryProvider = Provider<CommissionsRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return CommissionsRepositoryImpl(CommissionsApi(dio));
});

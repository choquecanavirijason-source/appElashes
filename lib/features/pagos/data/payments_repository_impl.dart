import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/dio_client.dart';
import 'models/payment_dto.dart';
import 'payments_api.dart';

class Payment {
  const Payment({
    required this.id,
    required this.clientId,
    required this.clientName,
    required this.amount,
    required this.method,
    required this.status,
    required this.paidAt,
    this.branchId,
    this.appointmentId,
    this.saleId,
    this.reference,
    this.notes,
  });

  final int id;
  final int clientId;
  final String clientName;
  final double amount;
  final String method;
  final String status;
  final DateTime paidAt;
  final int? branchId;
  final int? appointmentId;
  final int? saleId;
  final String? reference;
  final String? notes;

  factory Payment.fromDto(PaymentDto dto) => Payment(
        id: dto.id,
        clientId: dto.clientId,
        clientName: '${dto.client.name}${dto.client.lastName != null ? ' ${dto.client.lastName}' : ''}',
        amount: dto.amount,
        method: dto.method,
        status: dto.status,
        paidAt: dto.paidAt,
        branchId: dto.branchId,
        appointmentId: dto.appointmentId,
        saleId: dto.saleId,
        reference: dto.reference,
        notes: dto.notes,
      );
}

class PaymentsRepository {
  PaymentsRepository(this._api);

  final PaymentsApi _api;

  Future<List<Payment>> list({int? clientId, int? branchId, String? method}) async {
    final dtos = await _api.list(
      clientId: clientId,
      branchId: branchId,
      method: method,
    );
    return dtos.map(Payment.fromDto).toList();
  }

  Future<Payment> create(PaymentCreateDto input) async {
    final dto = await _api.create(input);
    return Payment.fromDto(dto);
  }

  Future<void> delete(int id) => _api.delete(id);
}

final _paymentsApiProvider = Provider<PaymentsApi>(
  (ref) => PaymentsApi(ref.watch(dioProvider)),
);

final paymentsRepositoryProvider = Provider<PaymentsRepository>(
  (ref) => PaymentsRepository(ref.watch(_paymentsApiProvider)),
);

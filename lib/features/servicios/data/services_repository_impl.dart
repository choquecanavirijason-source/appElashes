import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/dio_client.dart';
import '../domain/entities/service.dart';
import '../domain/services_repository.dart';
import 'models/service_dto.dart';
import 'services_api.dart';

class ServicesRepositoryImpl implements ServicesRepository {
  ServicesRepositoryImpl(this._api);

  final ServicesApi _api;

  @override
  Future<List<Service>> list({
    int? branchId,
    int? categoryId,
    int limit = 200,
  }) async {
    final dtos = await _api.list(
      branchId: branchId,
      categoryId: categoryId,
      limit: limit,
    );
    return dtos.map(Service.fromDto).toList();
  }

  @override
  Future<Service> getById(int id) async {
    final dto = await _api.getById(id);
    return Service.fromDto(dto);
  }

  @override
  Future<Service> create(ServiceCreateDto input) async {
    final dto = await _api.create(input);
    return Service.fromDto(dto);
  }

  @override
  Future<Service> update(int id, ServiceUpdateDto input) async {
    final dto = await _api.update(id, input);
    return Service.fromDto(dto);
  }

  @override
  Future<void> delete(int id) async {
    await _api.delete(id);
  }
}

final _servicesApiProvider = Provider<ServicesApi>(
  (ref) => ServicesApi(ref.watch(dioProvider)),
);

final servicesRepositoryProvider = Provider<ServicesRepository>(
  (ref) => ServicesRepositoryImpl(ref.watch(_servicesApiProvider)),
);

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/dio_client.dart';
import '../domain/clients_repository.dart';
import '../domain/entities/client.dart';
import 'clients_api.dart';
import 'models/client_dto.dart';

class ClientsRepositoryImpl implements ClientsRepository {
  ClientsRepositoryImpl(this._api);

  final ClientsApi _api;

  @override
  Future<List<Client>> list({
    int? branchId,
    String? search,
    int limit = 100,
  }) async {
    final dtos = await _api.list(
      branchId: branchId,
      search: search,
      limit: limit,
    );
    return dtos.map(Client.fromDto).toList();
  }

  @override
  Future<Client> getById(int id) async {
    final dto = await _api.getById(id);
    return Client.fromDto(dto);
  }

  @override
  Future<Client> create(ClientCreateDto input) async {
    final dto = await _api.create(input);
    return Client.fromDto(dto);
  }

  @override
  Future<Client> update(int id, ClientUpdateDto input) async {
    final dto = await _api.update(id, input);
    return Client.fromDto(dto);
  }

  @override
  Future<void> delete(int id) => _api.delete(id);
}

final _clientsApiProvider = Provider<ClientsApi>(
  (ref) => ClientsApi(ref.watch(dioProvider)),
);

final clientsRepositoryProvider = Provider<ClientsRepository>(
  (ref) => ClientsRepositoryImpl(ref.watch(_clientsApiProvider)),
);

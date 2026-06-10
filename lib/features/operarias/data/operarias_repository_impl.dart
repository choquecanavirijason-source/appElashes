import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/dio_client.dart';
import '../domain/entities/operaria.dart';
import '../domain/operarias_repository.dart';
import 'models/operaria_dto.dart';
import 'operarias_api.dart';

class OperariasRepositoryImpl implements OperariasRepository {
  OperariasRepositoryImpl(this._api);

  final OperariasApi _api;

  @override
  Future<List<Operaria>> list({String? search, int limit = 100}) async {
    final dtos = await _api.list(search: search, limit: limit);
    return dtos.map(Operaria.fromDto).toList();
  }

  @override
  Future<Operaria> getById(int id) async {
    final dto = await _api.getById(id);
    return Operaria.fromDto(dto);
  }

  @override
  Future<Operaria> create(OperariaCreateDto input) async {
    final dto = await _api.create(input);
    return Operaria.fromDto(dto);
  }

  @override
  Future<Operaria> update(int id, OperariaUpdateDto input) async {
    final dto = await _api.update(id, input);
    return Operaria.fromDto(dto);
  }

  @override
  Future<void> delete(int id) async {
    await _api.delete(id);
  }
}

final _operariasApiProvider = Provider<OperariasApi>(
  (ref) => OperariasApi(ref.watch(dioProvider)),
);

final operariasRepositoryProvider = Provider<OperariasRepository>(
  (ref) => OperariasRepositoryImpl(ref.watch(_operariasApiProvider)),
);

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/dio_client.dart';
import '../domain/entities/sucursal.dart';
import '../domain/sucursales_repository.dart';
import 'models/branch_dto.dart';
import 'sucursales_api.dart';

class SucursalesRepositoryImpl implements SucursalesRepository {
  SucursalesRepositoryImpl(this._api);

  final SucursalesApi _api;

  @override
  Future<List<Sucursal>> list() async {
    final dtos = await _api.list();
    return dtos.map<Sucursal>(Sucursal.fromDto).toList();
  }

  @override
  Future<Sucursal> getById(int id) async {
    final dto = await _api.getById(id);
    return Sucursal.fromDto(dto);
  }

  @override
  Future<Sucursal> create(BranchCreateDto input) async {
    final dto = await _api.create(input);
    return Sucursal.fromDto(dto);
  }

  @override
  Future<Sucursal> update(int id, BranchUpdateDto input) async {
    final dto = await _api.update(id, input);
    return Sucursal.fromDto(dto);
  }

  @override
  Future<void> delete(int id) async {
    await _api.delete(id);
  }
}

final _sucursalesApiProvider = Provider<SucursalesApi>(
  (ref) => SucursalesApi(ref.watch(dioProvider)),
);

final sucursalesRepositoryProvider = Provider<SucursalesRepository>(
  (ref) => SucursalesRepositoryImpl(ref.watch(_sucursalesApiProvider)),
);

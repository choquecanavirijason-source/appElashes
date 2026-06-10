import 'entities/sucursal.dart';
import '../data/models/branch_dto.dart';

abstract class SucursalesRepository {
  Future<List<Sucursal>> list();

  Future<Sucursal> getById(int id);

  Future<Sucursal> create(BranchCreateDto input);

  Future<Sucursal> update(int id, BranchUpdateDto input);

  Future<void> delete(int id);
}

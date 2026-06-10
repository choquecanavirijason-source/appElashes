import 'entities/operaria.dart';
import '../data/models/operaria_dto.dart';

abstract class OperariasRepository {
  Future<List<Operaria>> list({String? search, int limit = 100});

  Future<Operaria> getById(int id);

  Future<Operaria> create(OperariaCreateDto input);

  Future<Operaria> update(int id, OperariaUpdateDto input);

  Future<void> delete(int id);
}

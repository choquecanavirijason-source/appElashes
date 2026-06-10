import '../data/models/client_dto.dart';
import 'entities/client.dart';

abstract class ClientsRepository {
  Future<List<Client>> list({int? branchId, String? search, int limit});
  Future<Client> getById(int id);
  Future<Client> create(ClientCreateDto input);
  Future<Client> update(int id, ClientUpdateDto input);
  Future<void> delete(int id);
}

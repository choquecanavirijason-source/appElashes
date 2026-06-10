import 'entities/service.dart';
import '../data/models/service_dto.dart';

abstract class ServicesRepository {
  Future<List<Service>> list({
    int? branchId,
    int? categoryId,
    int limit = 200,
  });

  Future<Service> getById(int id);

  Future<Service> create(ServiceCreateDto input);

  Future<Service> update(int id, ServiceUpdateDto input);

  Future<void> delete(int id);
}

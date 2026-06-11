import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/dio_client.dart';
import 'models/role_dto.dart';
import 'roles_api.dart';

class Role {
  const Role({
    required this.id,
    required this.name,
    required this.permissions,
    this.description,
  });

  final int id;
  final String name;
  final List<String> permissions;
  final String? description;

  factory Role.fromDto(RoleDto dto) => Role(
        id: dto.id,
        name: dto.name,
        permissions: dto.permissions,
        description: dto.description,
      );
}

abstract interface class RolesRepository {
  Future<List<Role>> list();
  Future<Role> create(RoleCreateDto dto);
  Future<void> delete(int id);
}

class RolesRepositoryImpl implements RolesRepository {
  const RolesRepositoryImpl(this._api);

  final RolesApi _api;

  @override
  Future<List<Role>> list() async {
    final dtos = await _api.list();
    return dtos.map(Role.fromDto).toList();
  }

  @override
  Future<Role> create(RoleCreateDto dto) async {
    final result = await _api.create(dto);
    return Role.fromDto(result);
  }

  @override
  Future<void> delete(int id) => _api.delete(id);
}

final rolesRepositoryProvider = Provider<RolesRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return RolesRepositoryImpl(RolesApi(dio));
});

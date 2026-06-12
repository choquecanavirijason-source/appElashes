import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/role_dto.dart';
import '../../data/roles_repository_impl.dart';

class RolesNotifier extends AutoDisposeAsyncNotifier<List<Role>> {
  @override
  Future<List<Role>> build() =>
      ref.read(rolesRepositoryProvider).list();

  Future<void> refresh() async => ref.invalidateSelf();

  Future<void> add(RoleCreateDto dto) async {
    await ref.read(rolesRepositoryProvider).create(dto);
    ref.invalidateSelf();
  }

  Future<void> edit(int id, RoleUpdateDto dto) async {
    await ref.read(rolesRepositoryProvider).update(id, dto);
    ref.invalidateSelf();
  }

  Future<void> remove(int id) async {
    await ref.read(rolesRepositoryProvider).delete(id);
    ref.invalidateSelf();
  }
}

final rolesProvider =
    AutoDisposeAsyncNotifierProvider<RolesNotifier, List<Role>>(
  RolesNotifier.new,
);

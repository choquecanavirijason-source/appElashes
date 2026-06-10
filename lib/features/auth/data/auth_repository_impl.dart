import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/dio_client.dart';
import '../domain/auth_repository.dart';
import '../domain/entities/auth_user.dart';
import 'auth_api.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._api);

  final AuthApi _api;

  @override
  Future<({String token, AuthUser user})> login(
    String username,
    String password,
  ) async {
    final dto = await _api.login(username, password);
    return (
      token: dto.accessToken,
      user: AuthUser.fromDto(dto.user),
    );
  }

  @override
  Future<AuthUser> me() async {
    final dto = await _api.me();
    return AuthUser.fromDto(dto);
  }

  @override
  Future<void> logout() => _api.logout();
}

final _authApiProvider = Provider<AuthApi>(
  (ref) => AuthApi(ref.watch(dioProvider)),
);

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepositoryImpl(ref.watch(_authApiProvider)),
);

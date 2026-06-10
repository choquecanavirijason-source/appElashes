import 'entities/auth_user.dart';

abstract class AuthRepository {
  Future<({String token, AuthUser user})> login(
    String username,
    String password,
  );
  Future<AuthUser> me();
  Future<void> logout();
}

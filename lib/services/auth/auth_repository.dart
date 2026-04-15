import '../../models/models.dart';

/// Abstract contract for authentication operations
abstract class AuthRepository {
  /// Returns currenlty logged in user or null if not authenticated
  UserModel? get currentUser;

  /// Attempts to login. Return [UserModel] on success, null on failure
  Future<UserModel?> login(String username, String password);

  /// Register a new user. Throws [Exception] if username is already taken-
  Future<UserModel> register(String username, String password);

  /// Clears current sesion
  Future<void> logout();
}
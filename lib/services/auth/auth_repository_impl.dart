import 'package:uuid/uuid.dart';

import '../../models/models.dart';
import 'auth_repository.dart';

/// In-memory implementation  of [AuthRepository]
/// Hardcode admin for testing purposes
class AuthRepositoryImpl implements AuthRepository {
  final List<UserModel> _users = [
    const UserModel(
      id: 'admin',
      username: 'admin',
      password: '1234',
    )
  ];

  /// Tracks active session, null if loggout
  UserModel? _currentUser;

  final Uuid _uuid = const Uuid();

  @override
  UserModel? get currentUser => _currentUser;

  @override
  Future<UserModel?> login(String username, String password) async {
    // Simulate network delay for future Firebase Authentication integration
    await Future.delayed(const Duration(milliseconds: 800));

    //Kotlin list.firstOrNull {} ?: null
    try {
      final user = _users.firstWhere(
        (u) => u.username == username && u.password == password,
      );
      _currentUser = user;
      return user;
    } on StateError {
      return null;
    }
  }


  @override
  Future<UserModel> register(String username, String password) async {
    // Simulate network delay for future Firebase Authentication integration
    await Future.delayed(const Duration(milliseconds: 800));

    final alreadyExists = _users.any((u) => u.username == username);
    if (alreadyExists) {
      throw Exception('Username $username already taken');
    }

    final newUser = UserModel(
      id: _uuid.v4(),
      username: username,
      password: password,
    );

    _users.add(newUser);
    _currentUser = newUser;
    return newUser;
  }


  @override
  Future<void> logout() async {
    // Simulate network delay for future Firebase Authentication integration
    await Future.delayed(const Duration(milliseconds: 800));
    _currentUser = null;
  }

}
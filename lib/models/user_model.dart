import 'package:equatable/equatable.dart';

/// Represent an user in memory.
class UserModel extends Equatable {
  final String id;
  final String username;
  final String password;

  const UserModel({
    required this.id,
    required this.username,
    required this.password,
  });

  // to determine equaility (identity based / display based)
  @override
  List<Object?> get props => [id, username, password]; // not take password to avoid unnecesary re-emissions
}
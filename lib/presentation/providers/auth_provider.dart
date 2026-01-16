

import 'package:flutter_riverpod/legacy.dart';
import 'package:saltita/domain/entities/user_entity.dart';


import 'package:saltita/domain/repositories/users_repositories.dart';

class AuthProvider extends StateNotifier<UserEntity?> {
  final UsersRepositories _repository;

  AuthProvider(super.state, this._repository);

  void setUser(UserEntity user) {
    state = user;
  }

  Future<void> login(String email, String password) async {
    final user = await _repository.loginUser(email, password);
    state = user;
  }

  void clearUser() {
    state = null;
  }

}


import 'package:flutter_riverpod/legacy.dart';
import 'package:saltita/domain/entities/user_entity.dart';


class AuthProvider extends StateNotifier<UserEntity?> {
  AuthProvider(super.state);

  void setUser(UserEntity user) {
    state = user;
  }

  void clearUser() {
    state = null;
  }

  

}
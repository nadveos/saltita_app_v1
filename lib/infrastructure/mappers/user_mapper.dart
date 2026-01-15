

import 'package:saltita/domain/entities/user_entity.dart';
import 'package:saltita/infrastructure/models/user_model.dart';

class UserMapper {

  static UserEntity toUserEntity(User user) {
    return UserEntity(
      artistName: user.artistName,
      email: user.email,
      emailVisibility: user.emailVisibility,
      fullName: user.fullName,
      role: user.role,
      verified: user.verified,
      password: user.password,
      passwordConfirm: user.passwordConfirm,
    );
  }

}
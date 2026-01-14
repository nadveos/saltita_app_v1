

import 'package:saltita/domain/entities/user_entity.dart';
import 'package:saltita/infrastructure/models/user_model.dart';

class UserMapper {

  static UserEntity toUserEntity(User user) {
    return UserEntity(
      artistName: user.artistName,
      collectionId: user.collectionId,
      collectionName: user.collectionName,
      email: user.email,
      emailVisibility: user.emailVisibility,
      fullName: user.fullName,
      id: user.id,
      role: user.role,
      verified: user.verified,
    );
  }

}


import 'package:pocketbase/pocketbase.dart';
import 'package:saltita/domain/datasources/users_datasources.dart';
import 'package:saltita/domain/entities/user_entity.dart';

class UserDatasourceImpl implements UsersDatasources {

final pb = PocketBase('https://testauth.meapp.com.ar');


  
  @override
  Future<UserEntity> createUser(UserEntity user, String password) async {
    final body ={
        'artist_name': user.artistName,
        'email': user.email,
        'emailVisibility': true,
        'full_name': user.fullName,
        'role': user.role,

        'password': password,
        'passwordConfirm': password,
      };
    final record = await pb.collection('users').create(
      body:body
    );
    return UserEntity.fromJson(record.toJson());
  }

  @override
  Future<void> deleteUser(String id) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> getUserById(String id) {
    // TODO: implement getUserById
    throw UnimplementedError();
  }

  @override
  Future<List<UserEntity>> getUsers() {
    // TODO: implement getUsers
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> updateUser(UserEntity user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }


}
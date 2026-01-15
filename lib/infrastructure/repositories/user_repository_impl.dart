 
 
 
 import 'package:saltita/domain/datasources/users_datasources.dart';
import 'package:saltita/domain/entities/user_entity.dart';
import 'package:saltita/domain/repositories/users_repositories.dart';

class UserRepositoryImpl implements UsersRepositories {

  UsersDatasources usersDatasources;

  UserRepositoryImpl({required this.usersDatasources});

  @override
  Future<UserEntity> createUser(UserEntity user, String password) {
    return usersDatasources.createUser(user, password);
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
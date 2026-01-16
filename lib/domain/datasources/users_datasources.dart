
import 'package:saltita/domain/entities/user_entity.dart';

abstract class UsersDatasources {

Future<List<UserEntity>> getUsers();
Future<UserEntity> getUserById(String id);
Future<UserEntity> createUser(UserEntity user, String password);
Future<UserEntity> loginUser(String email, String password);
Future<UserEntity> updateUser(UserEntity user);
Future<void> deleteUser(String id);

}
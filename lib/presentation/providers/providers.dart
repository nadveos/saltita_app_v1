
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:saltita/domain/entities/user_entity.dart';
import 'package:saltita/infrastructure/datasources/user_datasource_impl.dart';
import 'package:saltita/infrastructure/repositories/user_repository_impl.dart';
import 'package:saltita/presentation/providers/auth_provider.dart';

final userDatasourceProvider = Provider((ref) => UserDatasourceImpl());

final userRepositoryProvider = Provider((ref) => UserRepositoryImpl(usersDatasources: ref.watch(userDatasourceProvider)));

final authProvider = StateNotifierProvider<AuthProvider, UserEntity?>((ref) {
  final repository = ref.watch(userRepositoryProvider);
  return AuthProvider(null, repository);
});

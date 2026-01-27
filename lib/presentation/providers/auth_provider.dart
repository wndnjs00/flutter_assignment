import 'package:flutter_assignment/data/datasources/remote/auth_remote_datasource.dart';
import 'package:flutter_assignment/data/repositories/auth_repository_impl.dart';
import 'package:flutter_assignment/domain/repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final secureStorageProvider = Provider<FlutterSecureStorage>((red) {
  return const FlutterSecureStorage();
});

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  return AuthRemoteDataSource();
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    ref.read(authRemoteDataSourceProvider),
    ref.read(secureStorageProvider),
  );
});

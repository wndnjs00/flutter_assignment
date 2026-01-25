import 'package:flutter_assignment/data/datasources/board_remote_datasource.dart';
import 'package:flutter_assignment/data/repositories/board_repository_impl.dart';
import 'package:flutter_assignment/domain/repositories/board_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage();
});

final boardRemoteDataSourceProvider = Provider<BoardRemoteDataSource>((ref) {
  return BoardRemoteDataSource();
});

final boardRepositoryProvider = Provider<BoardRepository>((ref) {
  return BoardRepositoryImpl(ref.read(boardRemoteDataSourceProvider));
});

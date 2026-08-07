import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../network/api_client.dart';
import '../network/dio_client.dart';
import '../storage/token_storage.dart';

import '../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../features/auth/data/datasources/auth_remote_data_source_impl.dart';

import '../../features/auth/data/repositories/auth_repository_impl.dart';

import '../../features/auth/domain/repositories/auth_repository.dart';

import '../../features/auth/domain/usecases/login_usecase.dart';

// ===============================
// STORAGE
// ===============================

final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage();
});

final tokenStorageProvider = Provider<TokenStorage>((ref) {
  final storage = ref.read(secureStorageProvider);

  return TokenStorage(storage);
});

// ===============================
// NETWORK
// ===============================

final apiClientProvider = Provider<ApiClient>((ref) {
  final tokenStorage = ref.read(tokenStorageProvider);

  final dio = DioClient.create(tokenStorage);

  return ApiClient(dio);
});

// ===============================
// DATA SOURCE
// ===============================

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  final apiClient = ref.read(apiClientProvider);

  return AuthRemoteDataSourceImpl(apiClient);
});

// ===============================
// REPOSITORY
// ===============================

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final remoteDataSource = ref.read(authRemoteDataSourceProvider);

  return AuthRepositoryImpl(remoteDataSource);
});

// ===============================
// USE CASE
// ===============================

final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  final repository = ref.read(authRepositoryProvider);

  return LoginUseCase(repository);
});

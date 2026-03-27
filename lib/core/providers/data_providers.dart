import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sh_platform_service/core/providers/storage_providers.dart';
import 'package:sh_platform_service/data/repositories/auth/auth_repository_impl.dart';
import 'package:sh_platform_service/domain/repositories/auth/auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(secureStorage: ref.watch(secureStorageProvider));
});

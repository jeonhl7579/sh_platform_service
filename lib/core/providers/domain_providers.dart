import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sh_platform_service/core/providers/data_providers.dart';
import 'package:sh_platform_service/domain/usecases/auth/check_auth_usecase.dart';

final checkAuthUsecaseProvider = Provider<CheckAuthUsecase>((ref) {
  return CheckAuthUsecase(authRepository: ref.watch(authRepositoryProvider));
});

// ─── Check Auth Usecase ───────────────────────────────────────────────────────
import 'package:sh_platform_service/domain/repositories/auth/auth_repository.dart';

class CheckAuthUsecase {
  const CheckAuthUsecase({required this.authRepository});

  final AuthRepository authRepository;

  Future<bool> call() async {
    return await authRepository.hasValidSession();
  }
}

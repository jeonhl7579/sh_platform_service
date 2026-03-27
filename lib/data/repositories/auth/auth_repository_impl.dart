import '../../../data/datasources/secure_storage_datasource.dart';
import '../../../domain/entities/user.dart';
import '../../../domain/repositories/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl({required this.secureStorage});

  final SecureStorageDataSource secureStorage;

  // ── 이메일 / 패스워드 ──────────────────────────────────────────────────────

  @override
  Future<User> signUpWithEmail(String email, String password) {
    // → 응답에서 User 매핑 후 반환
    throw UnimplementedError();
  }

  @override
  Future<User> signInWithEmail(String email, String password) async {
    // → 응답에서 access_token, refresh_token 추출
    // → secureStorage.saveTokens(accessToken: ..., refreshToken: ...)
    // → User 반환
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() async {
    await secureStorage.clearTokens();
  }

  @override
  Future<User> restoreSession() async {
    // → remoteDataSource.restoreSession(refreshToken)
    // → 성공 시 새 access_token 저장 후 User 반환
    // → 실패 시 clearTokens() 후 예외 throw
    throw UnimplementedError();
  }

  @override
  Future<void> refreshToken() async {
    // → remoteDataSource.refreshToken(refreshToken)
    // → 새 access_token, refresh_token 저장
    throw UnimplementedError();
  }

  @override
  Future<void> sendPasswordResetEmail(String email) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAccount() async {
    // → secureStorage.clearTokens()
    throw UnimplementedError();
  }

  // ── 소셜 로그인 ───────────────────────────────────────────────────────────

  @override
  Future<User> signInWithGoogle() async {
    // → remoteDataSource.signInWithGoogle()
    // → 토큰 저장 후 User 반환
    throw UnimplementedError();
  }

  // ── QR 코드 로그인 ────────────────────────────────────────────────────────

  @override
  Future<String> generateQrToken() {
    // → 임시 QR 토큰 문자열 반환
    throw UnimplementedError();
  }

  @override
  Future<User> signInWithQrToken(String qrToken) async {
    // → 토큰 저장 후 User 반환
    throw UnimplementedError();
  }

  // ── 공통 ──────────────────────────────────────────────────────────────────

  @override
  Future<User> getCurrentUser() {
    throw UnimplementedError();
  }

  @override
  Future<bool> hasValidSession() {
    return secureStorage.hasValidSession();
  }
}

import '../../../domain/entities/user.dart';

abstract class AuthRepository {
  /// 이메일로 회원가입
  Future<User> signUpWithEmail(String email, String password);

  /// 이메일로 로그인 후 토큰 저장
  Future<User> signInWithEmail(String email, String password);

  /// 로그아웃 (서버 세션 무효화 + 로컬 토큰 삭제)
  Future<void> signOut();

  /// 앱 재시작 시 SecureStorage 토큰으로 세션 복원
  Future<User> restoreSession();

  /// refresh_token으로 access_token 갱신
  Future<void> refreshToken();

  /// 비밀번호 재설정 이메일 발송
  Future<void> sendPasswordResetEmail(String email);

  /// 회원 탈퇴
  Future<void> deleteAccount();

  /// 구글 OAuth 로그인
  Future<User> signInWithGoogle();

  /// 로그인된 기기에서 QR 토큰 발급
  Future<String> generateQrToken();

  /// 스캔한 기기에서 QR 토큰으로 로그인
  Future<User> signInWithQrToken(String qrToken);

  /// 현재 로그인된 유저 조회
  Future<User> getCurrentUser();

  /// SecureStorage에 유효한 토큰이 있는지 확인 (SplashScreen용)
  Future<bool> hasValidSession();
}

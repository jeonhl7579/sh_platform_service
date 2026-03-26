import 'package:flutter_riverpod/flutter_riverpod.dart';

// ─── Auth Status ──────────────────────────────────────────────────────────────
enum AuthStatus { unknown, authenticated, unauthenticated }

class AuthState {
  const AuthState({this.status = AuthStatus.unknown});
  final AuthStatus status;
}

// ─── Auth Notifier ────────────────────────────────────────────────────────────
class AuthNotifier extends Notifier<AuthState> {
  @override
  AuthState build() => const AuthState(status: AuthStatus.unauthenticated);

  void setAuthenticated() {
    state = const AuthState(status: AuthStatus.authenticated);
  }

  void setUnauthenticated() {
    state = const AuthState(status: AuthStatus.unauthenticated);
  }
}

final authNotifierProvider = NotifierProvider<AuthNotifier, AuthState>(
  AuthNotifier.new,
);

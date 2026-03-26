import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../core/providers/auth_providers.dart';

// ─── Route Path 상수 ──────────────────────────────────────────────────────────
abstract final class AppRoutes {
  static const splash = '/splash';
  static const login = '/login';
  static const register = '/register';
  static const dashboard = '/dashboard';
}

// ─── Root Navigator Key ───────────────────────────────────────────────────────
final _rootNavigatorKey = GlobalKey<NavigatorState>();

// ─── Router Notifier ─────────────────────────────────────────────────────────
// authNotifierProvider의 상태 변경을 구독해 GoRouter의 redirect를 자동 재실행한다
class RouterNotifier extends ChangeNotifier {
  RouterNotifier(this._ref) {
    _ref.listen(authNotifierProvider, (prev, next) => notifyListeners());
  }

  final Ref _ref;
}

// ─── Router Provider ─────────────────────────────────────────────────────────
final routerProvider = Provider<GoRouter>((ref) {
  final notifier = RouterNotifier(ref);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.splash,
    debugLogDiagnostics: true,
    refreshListenable: notifier,

    redirect: (context, state) {
      final auth = ref.read(authNotifierProvider);
      final path = state.uri.path;

      if (path == AppRoutes.splash) return null;

      if (auth.status == AuthStatus.unauthenticated &&
          path != AppRoutes.login &&
          path != AppRoutes.register) {
        return AppRoutes.login;
      }

      return null;
    },

    routes: [
      GoRoute(
        path: AppRoutes.splash,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const Placeholder(), // SplashScreen()
      ),
      GoRoute(
        path: AppRoutes.login,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const Placeholder(), // LoginScreen()
      ),
      GoRoute(
        path: AppRoutes.register,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const Placeholder(), // RegisterScreen()
      ),
      GoRoute(
        path: AppRoutes.dashboard,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const Placeholder(), // DashboardScreen()
      ),
    ],
  );
});

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sh_platform_service/config/app_router.dart';
import 'package:sh_platform_service/presentation/splash/provider.dart';
import '../../ui/layout/app_breakpoints.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(splashScreenProvider, (_, next) {
      next.whenData((hasSession) {
        if (hasSession) {
          // 메인 페이지로 이동
        } else {
          // 로그인 페이지로 이동
          context.go(AppRoutes.login);
        }
      });
    });
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (AppBreakpoints.isDesktop(constraints.maxWidth)) {
            return const _DesktopSplash();
          }
          return const _MobileSplash();
        },
      ),
    );
  }
}

// ─── Mobile Layout ────────────────────────────────────────────────────────────

class _MobileSplash extends StatelessWidget {
  const _MobileSplash();

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}

// ─── Desktop Layout ───────────────────────────────────────────────────────────

class _DesktopSplash extends StatelessWidget {
  const _DesktopSplash();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(color: colorScheme.surface),
      child: Center(
        child: CircularProgressIndicator(color: colorScheme.primary),
      ),
    );
  }
}

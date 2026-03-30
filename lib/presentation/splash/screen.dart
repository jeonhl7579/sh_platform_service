import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sh_platform_service/config/app_router.dart';
import 'package:sh_platform_service/presentation/splash/provider.dart';
import 'package:window_manager/window_manager.dart';
import '../../ui/layout/app_breakpoints.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(splashScreenProvider, (_, next) {
      next.whenData((hasSession) async {
        if (hasSession) {
          // 메인 페이지로 이동
        } else {
          // 로그인 페이지로 이동
          if (Platform.isMacOS || Platform.isWindows) {
            final pixelRatio =
                PlatformDispatcher.instance.views.first.devicePixelRatio;
            // 물리 픽셀 1024x720 기준으로 논리 픽셀 계산
            await windowManager.setSize(
              Size(1024 / pixelRatio, 720 / pixelRatio),
            );
            await windowManager.setMinimumSize(
              Size(1024 / pixelRatio, 720 / pixelRatio),
            );
          }

          // BuildContext 사용을 async gap 이후에 직접 쓰지 않고,
          // 마이크로태스크 큐에 등록하여 안전하게 처리
          Future.microtask(() {
            if (context.mounted) {
              context.go(AppRoutes.login);
            }
          });
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

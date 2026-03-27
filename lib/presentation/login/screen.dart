import 'package:flutter/material.dart';
import 'package:sh_platform_service/ui/layout/app_breakpoints.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (AppBreakpoints.isDesktop(constraints.maxWidth)) {
            return const _DesktopLoginScreen();
          }
          // 모바일/기본 화면 구현이 없어서 예시로 Container 사용
          return const Center(child: Text('Mobile Login'));
        },
      ),
    );
  }
}

class _DesktopLoginScreen extends StatefulWidget {
  const _DesktopLoginScreen({super.key});

  @override
  State<_DesktopLoginScreen> createState() => __DesktopLoginScreenState();
}

class __DesktopLoginScreenState extends State<_DesktopLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface),
      child: Center(child: Text('Login')),
    );
  }
}

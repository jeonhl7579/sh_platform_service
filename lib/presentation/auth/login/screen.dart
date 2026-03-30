import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sh_platform_service/presentation/auth/widgets/auth_text_input_field.dart';
import 'package:sh_platform_service/ui/layout/gaps.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          // os가 macos이거나 window인 경우
          if (Platform.isMacOS || Platform.isWindows) {
            return const _DesktopLoginScreen();
          } else {
            return const Center(child: Text('Mobile Login'));
          }
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
      width: double.infinity,
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Gaps.v48,
          Text(
            "JSH PLATFORM",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ],
      ),
    );
  }
}

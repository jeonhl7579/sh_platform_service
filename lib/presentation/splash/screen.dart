import 'package:flutter/material.dart';

import '../../ui/layout/app_breakpoints.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

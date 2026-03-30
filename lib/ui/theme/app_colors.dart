import 'package:flutter/material.dart';

// ─── Radiant Light — 따뜻한 코랄 라이트 ──────────────────────────────────────
// Primary: Coral Red, Secondary: Amber, Tertiary: Teal
abstract final class RadiantLightColors {
  static const primary = Color(0xffa0382d);
  static const onPrimary = Color(0xffffffff);
  static const primaryContainer = Color(0xffffd9d5);
  static const onPrimaryContainer = Color(0xff4d2126);

  static const secondary = Color(0xff8b6800);
  static const onSecondary = Color(0xffffffff);
  static const secondaryContainer = Color(0xffffdea3);
  static const onSecondaryContainer = Color(0xff2b1d00);

  static const tertiary = Color(0xff006760);
  static const onTertiary = Color(0xffffffff);
  static const tertiaryContainer = Color(0xff9ef2e4);
  static const onTertiaryContainer = Color(0xff00201d);

  static const error = Color(0xffba1a1a);
  static const onError = Color(0xffffffff);
  static const errorContainer = Color(0xffffdad6);
  static const onErrorContainer = Color(0xff410002);

  static const surface = Color(0xffffffff);
  static const onSurface = Color(0xff4d2126);
  static const onSurfaceVariant = Color(0xff534344);
  static const outline = Color(0xff857374);
  static const outlineVariant = Color(0xffde9ca1);
  static const shadow = Color(0xff4d2126);
  static const scrim = Color(0xff000000);
  static const inverseSurface = Color(0xff362020);
  static const onInverseSurface = Color(0xffffeded);
  static const inversePrimary = Color(0xfffd7d6c);

  static const surfaceContainerLowest = Color(0xffffffff);
  static const surfaceContainerLow = Color(0xffffeced);
  static const surfaceContainer = Color(0xffffe1e2);
  static const surfaceContainerHigh = Color(0xffffd6d8);
  static const surfaceContainerHighest = Color(0xffffc9cc);
}

// ─── Radiant Dark — 따뜻한 코랄 다크 ────────────────────────────────────────
// 같은 코랄 DNA를 다크 배경으로 전환한 테마
abstract final class RadiantDarkColors {
  static const primary = Color(0xfffd7d6c);
  static const onPrimary = Color(0xff4d2126);
  static const primaryContainer = Color(0xff7d2218);
  static const onPrimaryContainer = Color(0xffffd9d5);

  static const secondary = Color(0xfff6be4f);
  static const onSecondary = Color(0xff472a00);
  static const secondaryContainer = Color(0xff664e00);
  static const onSecondaryContainer = Color(0xffffdea3);

  static const tertiary = Color(0xff82d5c8);
  static const onTertiary = Color(0xff003731);
  static const tertiaryContainer = Color(0xff004f4a);
  static const onTertiaryContainer = Color(0xff9ef2e4);

  static const error = Color(0xffffb4ab);
  static const onError = Color(0xff690005);
  static const errorContainer = Color(0xff93000a);
  static const onErrorContainer = Color(0xffffdad6);

  static const surface = Color(0xff201818);
  static const onSurface = Color(0xfff5dede);
  static const onSurfaceVariant = Color(0xffde9ca1);
  static const outline = Color(0xffa68485);
  static const outlineVariant = Color(0xff534344);
  static const shadow = Color(0xff000000);
  static const scrim = Color(0xff000000);
  static const inverseSurface = Color(0xfff5dede);
  static const onInverseSurface = Color(0xff201818);
  static const inversePrimary = Color(0xffa0382d);

  static const surfaceContainerLowest = Color(0xff190e0e);
  static const surfaceContainerLow = Color(0xff2c1c1c);
  static const surfaceContainer = Color(0xff362020);
  static const surfaceContainerHigh = Color(0xff412a2a);
  static const surfaceContainerHighest = Color(0xff4d3434);
}

// ─── Amber Glow — 황금빛 따뜻한 라이트 ────────────────────────────────────────
// Primary: Deep Amber, Secondary: Coral, Tertiary: Teal
abstract final class AmberGlowColors {
  static const primary = Color(0xff7b5800);
  static const onPrimary = Color(0xffffffff);
  static const primaryContainer = Color(0xffffdf9e);
  static const onPrimaryContainer = Color(0xff261900);

  static const secondary = Color(0xffa0382d);
  static const onSecondary = Color(0xffffffff);
  static const secondaryContainer = Color(0xffffd9d5);
  static const onSecondaryContainer = Color(0xff4d2126);

  static const tertiary = Color(0xff006760);
  static const onTertiary = Color(0xffffffff);
  static const tertiaryContainer = Color(0xff9ef2e4);
  static const onTertiaryContainer = Color(0xff00201d);

  static const error = Color(0xffba1a1a);
  static const onError = Color(0xffffffff);
  static const errorContainer = Color(0xffffdad6);
  static const onErrorContainer = Color(0xff410002);

  static const surface = Color(0xffffffff);
  static const onSurface = Color(0xff261900);
  static const onSurfaceVariant = Color(0xff52442c);
  static const outline = Color(0xff857351);
  static const outlineVariant = Color(0xffd9c5a3);
  static const shadow = Color(0xff261900);
  static const scrim = Color(0xff000000);
  static const inverseSurface = Color(0xff3b2c00);
  static const onInverseSurface = Color(0xfffff2db);
  static const inversePrimary = Color(0xffffc940);

  static const surfaceContainerLowest = Color(0xffffffff);
  static const surfaceContainerLow = Color(0xfffff2e2);
  static const surfaceContainer = Color(0xffffe8cc);
  static const surfaceContainerHigh = Color(0xffffddb8);
  static const surfaceContainerHighest = Color(0xffffd3a5);
}

// ─── Teal Serenity — 고요한 틸 라이트 ────────────────────────────────────────
// Primary: Teal, Secondary: Muted Teal, Tertiary: Amber
abstract final class TealSerenityColors {
  static const primary = Color(0xff006760);
  static const onPrimary = Color(0xffffffff);
  static const primaryContainer = Color(0xff9ef2e4);
  static const onPrimaryContainer = Color(0xff00201d);

  static const secondary = Color(0xff4a6361);
  static const onSecondary = Color(0xffffffff);
  static const secondaryContainer = Color(0xffcde8e5);
  static const onSecondaryContainer = Color(0xff051f1e);

  static const tertiary = Color(0xff8b6800);
  static const onTertiary = Color(0xffffffff);
  static const tertiaryContainer = Color(0xffffdea3);
  static const onTertiaryContainer = Color(0xff2b1d00);

  static const error = Color(0xffba1a1a);
  static const onError = Color(0xffffffff);
  static const errorContainer = Color(0xffffdad6);
  static const onErrorContainer = Color(0xff410002);

  static const surface = Color(0xffffffff);
  static const onSurface = Color(0xff00201d);
  static const onSurfaceVariant = Color(0xff3f4947);
  static const outline = Color(0xff6f7977);
  static const outlineVariant = Color(0xffaec3c0);
  static const shadow = Color(0xff00201d);
  static const scrim = Color(0xff000000);
  static const inverseSurface = Color(0xff003a35);
  static const onInverseSurface = Color(0xffe6f3f0);
  static const inversePrimary = Color(0xff82d5c8);

  static const surfaceContainerLowest = Color(0xffffffff);
  static const surfaceContainerLow = Color(0xffeef6f4);
  static const surfaceContainer = Color(0xffe8f0ee);
  static const surfaceContainerHigh = Color(0xffe2eae8);
  static const surfaceContainerHighest = Color(0xffdce5e2);
}

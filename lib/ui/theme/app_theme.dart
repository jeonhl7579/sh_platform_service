import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'app_typography.dart';

// ─── Theme Variant Enum ───────────────────────────────────────────────────────
enum AppThemeVariant {
  /// 따뜻한 코랄 라이트 — 디자인 스펙의 메인 테마
  radiantLight('Radiant Light'),

  /// 코랄 팔레트 기반 다크 테마
  radiantDark('Radiant Dark'),

  /// 황금빛 앰버 라이트 테마
  amberGlow('Amber Glow'),

  /// 고요한 틸 라이트 테마
  tealSerenity('Teal Serenity');

  const AppThemeVariant(this.label);
  final String label;
}

// ─── App Theme ────────────────────────────────────────────────────────────────
abstract final class AppTheme {
  static ThemeData get radiantLight => _build(_radiantLightScheme);
  static ThemeData get radiantDark => _build(_radiantDarkScheme);
  static ThemeData get amberGlow => _build(_amberGlowScheme);
  static ThemeData get tealSerenity => _build(_tealSerenityScheme);

  static ThemeData of(AppThemeVariant variant) => switch (variant) {
        AppThemeVariant.radiantLight => radiantLight,
        AppThemeVariant.radiantDark => radiantDark,
        AppThemeVariant.amberGlow => amberGlow,
        AppThemeVariant.tealSerenity => tealSerenity,
      };

  // ── Core Builder ──────────────────────────────────────────────────────────
  static ThemeData _build(ColorScheme cs) {
    final text = AppTypography.build(
      onSurface: cs.onSurface,
      onSurfaceVariant: cs.onSurfaceVariant,
    );
    final isDark = cs.brightness == Brightness.dark;

    return ThemeData(
      useMaterial3: true,
      colorScheme: cs,
      brightness: cs.brightness,
      textTheme: text,
      scaffoldBackgroundColor: cs.surface,

      // ── System UI ──────────────────────────────────────────────────────────
      appBarTheme: AppBarTheme(
        backgroundColor: cs.surface,
        foregroundColor: cs.onSurface,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: text.titleLarge?.copyWith(color: cs.onSurface),
        systemOverlayStyle: isDark
            ? SystemUiOverlayStyle.light.copyWith(
                statusBarColor: Colors.transparent,
                systemNavigationBarColor: cs.surface,
              )
            : SystemUiOverlayStyle.dark.copyWith(
                statusBarColor: Colors.transparent,
                systemNavigationBarColor: cs.surface,
              ),
      ),

      // ── Cards ─────────────────────────────────────────────────────────────
      // "Floating Cards" — surface-container-lowest for maximum pop
      cardTheme: CardThemeData(
        color: cs.surfaceContainerLowest,
        elevation: 0,
        shadowColor: cs.shadow.withValues(alpha: 0.06),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24), // xl: 3rem friendly DNA
        ),
        margin: EdgeInsets.zero,
      ),

      // ── Buttons: pill-shaped (border-radius: 9999) ─────────────────────────
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: cs.primary,
          foregroundColor: cs.onPrimary,
          elevation: 0,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: const StadiumBorder(),
          textStyle: text.labelLarge,
        ),
      ),

      // Secondary button: secondaryContainer fill
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: cs.secondaryContainer,
          foregroundColor: cs.onSecondaryContainer,
          elevation: 0,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: const StadiumBorder(),
          textStyle: text.labelLarge,
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: cs.primary,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: const StadiumBorder(),
          // "Ghost Border" fallback at 15% opacity
          side: BorderSide(
            color: cs.outlineVariant.withValues(alpha: 0.15),
            width: 1,
          ),
          textStyle: text.labelLarge,
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: cs.primary,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: const StadiumBorder(),
          textStyle: text.labelLarge,
        ),
      ),

      // ── Input Fields: soft-rect (1.5rem = 24px) ────────────────────────────
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: cs.surfaceContainerLowest,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide.none,
        ),
        // Active state: 2px ghost border with primaryContainer @ 40%
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(
            color: cs.primaryContainer.withValues(alpha: 0.40),
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(color: cs.error, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(color: cs.error, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        hintStyle: text.bodyLarge?.copyWith(
          color: cs.onSurfaceVariant.withValues(alpha: 0.60),
        ),
        labelStyle: text.bodyLarge?.copyWith(color: cs.onSurfaceVariant),
        floatingLabelStyle: text.bodySmall?.copyWith(color: cs.primary),
      ),

      // ── Chips: pill-shaped, no square corners ──────────────────────────────
      chipTheme: ChipThemeData(
        backgroundColor: cs.surfaceContainerHigh,
        selectedColor: cs.tertiary,
        labelStyle: text.labelMedium,
        secondaryLabelStyle: text.labelMedium?.copyWith(
          color: cs.onTertiary,
        ),
        shape: const StadiumBorder(side: BorderSide.none),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        side: BorderSide.none,
      ),

      // ── FAB ───────────────────────────────────────────────────────────────
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: cs.primary,
        foregroundColor: cs.onPrimary,
        elevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        highlightElevation: 0,
        shape: const CircleBorder(),
      ),

      // ── Navigation Bar ────────────────────────────────────────────────────
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: cs.surfaceContainerLow,
        elevation: 0,
        shadowColor: Colors.transparent,
        indicatorColor: cs.primaryContainer,
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(color: cs.onPrimaryContainer, size: 24);
          }
          return IconThemeData(color: cs.onSurfaceVariant, size: 24);
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return text.labelMedium?.copyWith(
              color: cs.onSurface,
              fontWeight: FontWeight.w700,
            );
          }
          return text.labelMedium?.copyWith(color: cs.onSurfaceVariant);
        }),
      ),

      // ── Navigation Rail ───────────────────────────────────────────────────
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: cs.surfaceContainerLow,
        elevation: 0,
        indicatorColor: cs.primaryContainer,
        selectedIconTheme: IconThemeData(color: cs.onPrimaryContainer),
        unselectedIconTheme: IconThemeData(color: cs.onSurfaceVariant),
        selectedLabelTextStyle: text.labelMedium?.copyWith(
          color: cs.onSurface,
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelTextStyle: text.labelMedium?.copyWith(
          color: cs.onSurfaceVariant,
        ),
      ),

      // ── Divider: banned per "No-Line" rule ────────────────────────────────
      dividerTheme: const DividerThemeData(
        color: Colors.transparent,
        space: 0,
        thickness: 0,
      ),

      // ── List Tile ─────────────────────────────────────────────────────────
      listTileTheme: ListTileThemeData(
        tileColor: Colors.transparent,
        selectedTileColor: cs.primaryContainer.withValues(alpha: 0.20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      ),

      // ── Dialog ────────────────────────────────────────────────────────────
      dialogTheme: DialogThemeData(
        backgroundColor: cs.surfaceContainerLowest,
        elevation: 0,
        shadowColor: cs.shadow.withValues(alpha: 0.06),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
        titleTextStyle: text.headlineSmall?.copyWith(color: cs.onSurface),
        contentTextStyle: text.bodyMedium?.copyWith(
          color: cs.onSurfaceVariant,
        ),
      ),

      // ── Bottom Sheet ──────────────────────────────────────────────────────
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: cs.surfaceContainerLow,
        elevation: 0,
        shadowColor: cs.shadow.withValues(alpha: 0.06),
        modalBackgroundColor: cs.surfaceContainerLow,
        modalElevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        dragHandleColor: cs.onSurfaceVariant.withValues(alpha: 0.40),
      ),

      // ── Snack Bar ─────────────────────────────────────────────────────────
      snackBarTheme: SnackBarThemeData(
        backgroundColor: cs.inverseSurface,
        contentTextStyle: text.bodyMedium?.copyWith(
          color: cs.onInverseSurface,
        ),
        actionTextColor: cs.inversePrimary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 0,
      ),

      // ── Progress Indicator ─────────────────────────────────────────────────
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: cs.primary,
        circularTrackColor: cs.primaryContainer.withValues(alpha: 0.30),
        linearTrackColor: cs.primaryContainer.withValues(alpha: 0.30),
      ),

      // ── Icons ─────────────────────────────────────────────────────────────
      iconTheme: IconThemeData(color: cs.onSurface, size: 24),
      primaryIconTheme: IconThemeData(color: cs.primary, size: 24),

      // ── Switch ─────────────────────────────────────────────────────────────
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return cs.primary;
          return cs.outline;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return cs.primaryContainer;
          }
          return cs.surfaceContainerHigh;
        }),
        trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
      ),

      // ── Checkbox & Radio ──────────────────────────────────────────────────
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return cs.primary;
          return Colors.transparent;
        }),
        checkColor: WidgetStateProperty.all(cs.onPrimary),
        side: BorderSide(color: cs.outline, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),

      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return cs.primary;
          return cs.outline;
        }),
      ),

      // ── Popup Menu ────────────────────────────────────────────────────────
      popupMenuTheme: PopupMenuThemeData(
        color: cs.surfaceContainerLowest,
        elevation: 0,
        shadowColor: cs.shadow.withValues(alpha: 0.06),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        textStyle: text.bodyMedium,
      ),

      // ── Tooltip ───────────────────────────────────────────────────────────
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: cs.inverseSurface.withValues(alpha: 0.90),
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: text.labelSmall?.copyWith(color: cs.onInverseSurface),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      ),

      // ── Tab Bar ───────────────────────────────────────────────────────────
      tabBarTheme: TabBarThemeData(
        labelColor: cs.primary,
        unselectedLabelColor: cs.onSurfaceVariant,
        labelStyle: text.titleSmall,
        unselectedLabelStyle: text.titleSmall,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: cs.primary, width: 2),
        ),
        overlayColor: WidgetStateProperty.all(
          cs.primary.withValues(alpha: 0.08),
        ),
        dividerColor: Colors.transparent,
      ),
    );
  }

  // ── Color Schemes ──────────────────────────────────────────────────────────

  static final _radiantLightScheme = ColorScheme(
    brightness: Brightness.light,
    primary: RadiantLightColors.primary,
    onPrimary: RadiantLightColors.onPrimary,
    primaryContainer: RadiantLightColors.primaryContainer,
    onPrimaryContainer: RadiantLightColors.onPrimaryContainer,
    secondary: RadiantLightColors.secondary,
    onSecondary: RadiantLightColors.onSecondary,
    secondaryContainer: RadiantLightColors.secondaryContainer,
    onSecondaryContainer: RadiantLightColors.onSecondaryContainer,
    tertiary: RadiantLightColors.tertiary,
    onTertiary: RadiantLightColors.onTertiary,
    tertiaryContainer: RadiantLightColors.tertiaryContainer,
    onTertiaryContainer: RadiantLightColors.onTertiaryContainer,
    error: RadiantLightColors.error,
    onError: RadiantLightColors.onError,
    errorContainer: RadiantLightColors.errorContainer,
    onErrorContainer: RadiantLightColors.onErrorContainer,
    surface: RadiantLightColors.surface,
    onSurface: RadiantLightColors.onSurface,
    onSurfaceVariant: RadiantLightColors.onSurfaceVariant,
    outline: RadiantLightColors.outline,
    outlineVariant: RadiantLightColors.outlineVariant,
    shadow: RadiantLightColors.shadow,
    scrim: RadiantLightColors.scrim,
    inverseSurface: RadiantLightColors.inverseSurface,
    onInverseSurface: RadiantLightColors.onInverseSurface,
    inversePrimary: RadiantLightColors.inversePrimary,
    surfaceContainerLowest: RadiantLightColors.surfaceContainerLowest,
    surfaceContainerLow: RadiantLightColors.surfaceContainerLow,
    surfaceContainer: RadiantLightColors.surfaceContainer,
    surfaceContainerHigh: RadiantLightColors.surfaceContainerHigh,
    surfaceContainerHighest: RadiantLightColors.surfaceContainerHighest,
  );

  static final _radiantDarkScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: RadiantDarkColors.primary,
    onPrimary: RadiantDarkColors.onPrimary,
    primaryContainer: RadiantDarkColors.primaryContainer,
    onPrimaryContainer: RadiantDarkColors.onPrimaryContainer,
    secondary: RadiantDarkColors.secondary,
    onSecondary: RadiantDarkColors.onSecondary,
    secondaryContainer: RadiantDarkColors.secondaryContainer,
    onSecondaryContainer: RadiantDarkColors.onSecondaryContainer,
    tertiary: RadiantDarkColors.tertiary,
    onTertiary: RadiantDarkColors.onTertiary,
    tertiaryContainer: RadiantDarkColors.tertiaryContainer,
    onTertiaryContainer: RadiantDarkColors.onTertiaryContainer,
    error: RadiantDarkColors.error,
    onError: RadiantDarkColors.onError,
    errorContainer: RadiantDarkColors.errorContainer,
    onErrorContainer: RadiantDarkColors.onErrorContainer,
    surface: RadiantDarkColors.surface,
    onSurface: RadiantDarkColors.onSurface,
    onSurfaceVariant: RadiantDarkColors.onSurfaceVariant,
    outline: RadiantDarkColors.outline,
    outlineVariant: RadiantDarkColors.outlineVariant,
    shadow: RadiantDarkColors.shadow,
    scrim: RadiantDarkColors.scrim,
    inverseSurface: RadiantDarkColors.inverseSurface,
    onInverseSurface: RadiantDarkColors.onInverseSurface,
    inversePrimary: RadiantDarkColors.inversePrimary,
    surfaceContainerLowest: RadiantDarkColors.surfaceContainerLowest,
    surfaceContainerLow: RadiantDarkColors.surfaceContainerLow,
    surfaceContainer: RadiantDarkColors.surfaceContainer,
    surfaceContainerHigh: RadiantDarkColors.surfaceContainerHigh,
    surfaceContainerHighest: RadiantDarkColors.surfaceContainerHighest,
  );

  static final _amberGlowScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AmberGlowColors.primary,
    onPrimary: AmberGlowColors.onPrimary,
    primaryContainer: AmberGlowColors.primaryContainer,
    onPrimaryContainer: AmberGlowColors.onPrimaryContainer,
    secondary: AmberGlowColors.secondary,
    onSecondary: AmberGlowColors.onSecondary,
    secondaryContainer: AmberGlowColors.secondaryContainer,
    onSecondaryContainer: AmberGlowColors.onSecondaryContainer,
    tertiary: AmberGlowColors.tertiary,
    onTertiary: AmberGlowColors.onTertiary,
    tertiaryContainer: AmberGlowColors.tertiaryContainer,
    onTertiaryContainer: AmberGlowColors.onTertiaryContainer,
    error: AmberGlowColors.error,
    onError: AmberGlowColors.onError,
    errorContainer: AmberGlowColors.errorContainer,
    onErrorContainer: AmberGlowColors.onErrorContainer,
    surface: AmberGlowColors.surface,
    onSurface: AmberGlowColors.onSurface,
    onSurfaceVariant: AmberGlowColors.onSurfaceVariant,
    outline: AmberGlowColors.outline,
    outlineVariant: AmberGlowColors.outlineVariant,
    shadow: AmberGlowColors.shadow,
    scrim: AmberGlowColors.scrim,
    inverseSurface: AmberGlowColors.inverseSurface,
    onInverseSurface: AmberGlowColors.onInverseSurface,
    inversePrimary: AmberGlowColors.inversePrimary,
    surfaceContainerLowest: AmberGlowColors.surfaceContainerLowest,
    surfaceContainerLow: AmberGlowColors.surfaceContainerLow,
    surfaceContainer: AmberGlowColors.surfaceContainer,
    surfaceContainerHigh: AmberGlowColors.surfaceContainerHigh,
    surfaceContainerHighest: AmberGlowColors.surfaceContainerHighest,
  );

  static final _tealSerenityScheme = ColorScheme(
    brightness: Brightness.light,
    primary: TealSerenityColors.primary,
    onPrimary: TealSerenityColors.onPrimary,
    primaryContainer: TealSerenityColors.primaryContainer,
    onPrimaryContainer: TealSerenityColors.onPrimaryContainer,
    secondary: TealSerenityColors.secondary,
    onSecondary: TealSerenityColors.onSecondary,
    secondaryContainer: TealSerenityColors.secondaryContainer,
    onSecondaryContainer: TealSerenityColors.onSecondaryContainer,
    tertiary: TealSerenityColors.tertiary,
    onTertiary: TealSerenityColors.onTertiary,
    tertiaryContainer: TealSerenityColors.tertiaryContainer,
    onTertiaryContainer: TealSerenityColors.onTertiaryContainer,
    error: TealSerenityColors.error,
    onError: TealSerenityColors.onError,
    errorContainer: TealSerenityColors.errorContainer,
    onErrorContainer: TealSerenityColors.onErrorContainer,
    surface: TealSerenityColors.surface,
    onSurface: TealSerenityColors.onSurface,
    onSurfaceVariant: TealSerenityColors.onSurfaceVariant,
    outline: TealSerenityColors.outline,
    outlineVariant: TealSerenityColors.outlineVariant,
    shadow: TealSerenityColors.shadow,
    scrim: TealSerenityColors.scrim,
    inverseSurface: TealSerenityColors.inverseSurface,
    onInverseSurface: TealSerenityColors.onInverseSurface,
    inversePrimary: TealSerenityColors.inversePrimary,
    surfaceContainerLowest: TealSerenityColors.surfaceContainerLowest,
    surfaceContainerLow: TealSerenityColors.surfaceContainerLow,
    surfaceContainer: TealSerenityColors.surfaceContainer,
    surfaceContainerHigh: TealSerenityColors.surfaceContainerHigh,
    surfaceContainerHighest: TealSerenityColors.surfaceContainerHighest,
  );
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Display & Headline: Plus Jakarta Sans (geometric clarity, friendly terminals)
// Body & Labels: Be Vietnam Pro (humanist, legible at small scales)
abstract final class AppTypography {
  static TextTheme build({
    required Color onSurface,
    required Color onSurfaceVariant,
  }) {
    return TextTheme(
      // ── Display ─────────────────────────────────────────────────────────────
      displayLarge: GoogleFonts.plusJakartaSans(
        fontSize: 57,
        fontWeight: FontWeight.w400,
        letterSpacing: -1.14, // -2% tight letter-spacing (57 * 0.02)
        height: 1.12,
        color: onSurface,
      ),
      displayMedium: GoogleFonts.plusJakartaSans(
        fontSize: 45,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.90,
        height: 1.16,
        color: onSurface,
      ),
      displaySmall: GoogleFonts.plusJakartaSans(
        fontSize: 36,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.72,
        height: 1.22,
        color: onSurface,
      ),

      // ── Headline ─────────────────────────────────────────────────────────────
      headlineLarge: GoogleFonts.plusJakartaSans(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.64,
        height: 1.25,
        color: onSurface,
      ),
      headlineMedium: GoogleFonts.plusJakartaSans(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.56,
        height: 1.29,
        color: onSurface,
      ),
      headlineSmall: GoogleFonts.plusJakartaSans(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.48,
        height: 1.33,
        color: onSurface,
      ),

      // ── Title ────────────────────────────────────────────────────────────────
      titleLarge: GoogleFonts.plusJakartaSans(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.20,
        height: 1.27,
        color: onSurface,
      ),
      titleMedium: GoogleFonts.beVietnamPro(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.15,
        height: 1.50,
        color: onSurface,
      ),
      titleSmall: GoogleFonts.beVietnamPro(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.10,
        height: 1.43,
        color: onSurface,
      ),

      // ── Body ─────────────────────────────────────────────────────────────────
      bodyLarge: GoogleFonts.beVietnamPro(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.50,
        height: 1.50,
        color: onSurface,
      ),
      bodyMedium: GoogleFonts.beVietnamPro(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        height: 1.43,
        color: onSurface,
      ),
      bodySmall: GoogleFonts.beVietnamPro(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.40,
        height: 1.33,
        color: onSurfaceVariant,
      ),

      // ── Label ────────────────────────────────────────────────────────────────
      labelLarge: GoogleFonts.beVietnamPro(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.10,
        height: 1.43,
        color: onSurface,
      ),
      labelMedium: GoogleFonts.beVietnamPro(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.50,
        height: 1.33,
        color: onSurface,
      ),
      labelSmall: GoogleFonts.beVietnamPro(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.50,
        height: 1.45,
        color: onSurfaceVariant,
      ),
    );
  }
}

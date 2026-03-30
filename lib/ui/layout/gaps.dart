import 'package:flutter/widgets.dart';

import 'sizes.dart';

abstract final class Gaps {
  // ── Vertical ──────────────────────────────────────────────────────────────
  static const v4 = SizedBox(height: Sizes.s4);
  static const v8 = SizedBox(height: Sizes.s8);
  static const v12 = SizedBox(height: Sizes.s12);
  static const v16 = SizedBox(height: Sizes.s16);
  static const v20 = SizedBox(height: Sizes.s20);
  static const v24 = SizedBox(height: Sizes.s24);
  static const v32 = SizedBox(height: Sizes.s32);
  static const v40 = SizedBox(height: Sizes.s40);
  static const v48 = SizedBox(height: Sizes.s48);
  static const v64 = SizedBox(height: Sizes.s64);
  static const v80 = SizedBox(height: Sizes.s80);
  static const v96 = SizedBox(height: Sizes.s96);
  static const v128 = SizedBox(height: Sizes.s128);

  // ── Horizontal ────────────────────────────────────────────────────────────
  static const h4 = SizedBox(width: Sizes.s4);
  static const h8 = SizedBox(width: Sizes.s8);
  static const h12 = SizedBox(width: Sizes.s12);
  static const h16 = SizedBox(width: Sizes.s16);
  static const h20 = SizedBox(width: Sizes.s20);
  static const h24 = SizedBox(width: Sizes.s24);
  static const h32 = SizedBox(width: Sizes.s32);
  static const h40 = SizedBox(width: Sizes.s40);
  static const h48 = SizedBox(width: Sizes.s48);
  static const h64 = SizedBox(width: Sizes.s64);
  static const h80 = SizedBox(width: Sizes.s80);
  static const h96 = SizedBox(width: Sizes.s96);
  static const h128 = SizedBox(width: Sizes.s128);
}

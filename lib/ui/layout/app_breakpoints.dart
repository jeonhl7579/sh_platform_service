abstract final class AppBreakpoints {
  /// 600dp 미만 → 모바일
  static const double mobile = 600;

  /// 600dp 이상 1200dp 미만 → 태블릿
  static const double tablet = 1200;

  /// 1200dp 이상 → 데스크톱
  static bool isMobile(double width) => width < mobile;
  static bool isTablet(double width) => width >= mobile && width < tablet;
  static bool isDesktop(double width) => width >= tablet;
}

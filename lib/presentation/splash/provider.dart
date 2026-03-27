import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sh_platform_service/core/providers/domain_providers.dart';

final splashScreenProvider = FutureProvider<bool>((ref) async {
  return ref.read(checkAuthUsecaseProvider).call();
});

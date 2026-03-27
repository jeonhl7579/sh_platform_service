import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sh_platform_service/data/datasources/secure_storage_datasource.dart';

final secureStorageProvider = Provider<SecureStorageDataSource>((ref) {
  return SecureStorageDataSource();
});

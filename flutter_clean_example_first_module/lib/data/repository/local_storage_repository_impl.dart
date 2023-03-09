import 'package:flutter_clean_example_core/cache/provider/flutter_secure_storage_base_provider.dart';
import 'package:flutter_clean_example_core/cache/provider/sqflite_base_provider.dart';
import 'package:flutter_clean_example_first_module/domain/repository/local_storage_repository.dart';

class LocalStorageRepositoryImpl implements LocalStorageRepository {
  final flutterSecureStorageProvider = FlutterSecureStorageBaseProvider();
  final sqflite = SqfliteBaseProvider();

  @override
  Future refreshAccessToken() {
    // TODO: implement refreshAccessToken
    throw UnimplementedError();
  }
}
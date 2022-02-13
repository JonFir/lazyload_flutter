import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class SecureStorage {
  Future<String?> read({required String key});

  Future<void> write({required String key, required String? value});

  Future<void> delete({required String key});
}

class SecureStorageDefault implements SecureStorage {
  static const _secureStorage = FlutterSecureStorage();

  const SecureStorageDefault();

  @override
  Future<String?> read({required String key}) => _secureStorage.read(key: key);
  @override
  Future<void> delete({required String key}) => _secureStorage.delete(key: key);

  @override
  Future<void> write({required String key, required String? value}) =>
      _secureStorage.write(key: key, value: value);
}

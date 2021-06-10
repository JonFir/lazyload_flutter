import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExampleWidgetModel {
  final _secureStorage = const FlutterSecureStorage();
  final _storage = SharedPreferences.getInstance();

  Future<void> readName() async {
    final storage = await _storage;
    final name = storage.getString('name');
    print(name);
  }

  Future<void> setName() async {
    final storage = await _storage;
    await storage.setString('name', 'Иван');
  }

  Future<void> readToken() async {
    final token = await _secureStorage.read(key: 'token');
    print(token);
  }

  Future<void> setToken() async {
    await _secureStorage.write(key: 'token', value: '5126567r76ewf675d7657');
  }
}

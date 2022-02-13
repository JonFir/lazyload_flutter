import 'package:dart_lesson/Library/FlutterSecureStorage/secure_storage.dart';

abstract class _Keys {
  static const sessionId = 'session_id';
  static const accountId = 'account_id';
}

abstract class SessionDataProvider {
  Future<String?> getSessionId();
  Future<void> setSessionId(String value);
  Future<void> deleteSessionId();
  Future<int?> getAccountId();
  Future<void> setAccountId(int value);
  Future<void> deleteAccountId();
}

class SessionDataProviderDefault implements SessionDataProvider {
  final SecureStorage secureStorage;

  const SessionDataProviderDefault(this.secureStorage);

  @override
  Future<String?> getSessionId() => secureStorage.read(key: _Keys.sessionId);

  @override
  Future<void> setSessionId(String value) {
    return secureStorage.write(key: _Keys.sessionId, value: value);
  }

  @override
  Future<void> deleteSessionId() {
    return secureStorage.delete(key: _Keys.sessionId);
  }

  @override
  Future<int?> getAccountId() async {
    final id = await secureStorage.read(key: _Keys.accountId);
    return id != null ? int.tryParse(id) : null;
  }

  @override
  Future<void> setAccountId(int value) {
    return secureStorage.write(
      key: _Keys.accountId,
      value: value.toString(),
    );
  }

  @override
  Future<void> deleteAccountId() {
    return secureStorage.delete(key: _Keys.accountId);
  }
}

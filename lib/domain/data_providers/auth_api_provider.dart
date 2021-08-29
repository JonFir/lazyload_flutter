abstract class AuthApiProviderError {}

class AuthApiProviderIncorectLoginDataError {}

class AuthApiProvider {
  Future<String> login(String login, String password) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    final isSuccess = login == 'admin' && password == '123456';
    if (isSuccess) {
      return 'sdkjfjsdhgfjhgasdf3q23765467tew6q746d';
    } else {
      throw AuthApiProviderIncorectLoginDataError();
    }
  }
}

import 'package:dart_lesson/domain/api_client/account_api_client.dart';
import 'package:dart_lesson/domain/api_client/auth_api_client.dart';
import 'package:dart_lesson/domain/data_providers/session_data_provider.dart';
import 'package:dart_lesson/ui/widgets/auth/auth_model.dart';
import 'package:dart_lesson/ui/widgets/loader_widget/loader_view_model.dart';
import 'package:dart_lesson/ui/widgets/movie_details/movie_details_model.dart';

class AuthService
    implements
        AuthViewModelLoginProvider,
        LoaderViewModelAuthStatusProvider,
        MovieDetailsModelLogoutProvider {
  final AuthApiClient authApiClient;
  final AccountApiClient accountApiClient;
  final SessionDataProvider sessionDataProvider;

  const AuthService({
    required this.authApiClient,
    required this.accountApiClient,
    required this.sessionDataProvider,
  });

  @override
  Future<bool> isAuth() async {
    final sessionId = await sessionDataProvider.getSessionId();
    final isAuth = sessionId != null;
    return isAuth;
  }

  @override
  Future<void> login(String login, String password) async {
    final sessionId = await authApiClient.auth(
      username: login,
      password: password,
    );
    final accountId = await accountApiClient.getAccountInfo(sessionId);
    await sessionDataProvider.setSessionId(sessionId);
    await sessionDataProvider.setAccountId(accountId);
  }

  @override
  Future<void> logout() async {
    await sessionDataProvider.deleteSessionId();
    await sessionDataProvider.deleteAccountId();
  }
}

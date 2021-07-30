import 'dart:io';

import 'package:dart_lesson/domain/api_client/api_client.dart';
import 'package:dart_lesson/domain/data_providers/session_data_provider.dart';
import 'package:dart_lesson/ui/navigation/main_navigation.dart';
import 'package:flutter/material.dart';
import 'package:pedantic/pedantic.dart';

class AuthModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _sessionDataProvider = SessionDataProvider();

  final loginTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool _isAuthProgress = false;
  bool get canStartAuth => !_isAuthProgress;
  bool get isAuthProgress => _isAuthProgress;

  Future<void> auth(BuildContext context) async {
    final login = loginTextController.text;
    final password = passwordTextController.text;

    if (login.isEmpty || password.isEmpty) {
      _errorMessage = 'Заполните логин и пароль';
      notifyListeners();
      return;
    }
    _errorMessage = null;
    _isAuthProgress = true;
    notifyListeners();
    String? sessionId;
    int? accountId;
    try {
      sessionId = await _apiClient.auth(
        username: login,
        password: password,
      );
      accountId = await _apiClient.getAccountInfo(sessionId);
    } on ApiClientException catch (e) {
      switch (e.type) {
        case ApiClientExceptionType.Network:
          _errorMessage =
              'Сервер не доступен. Проверте подключение к интернету';
          break;
        case ApiClientExceptionType.Auth:
          _errorMessage = 'Неправильный логин пароль!';
          break;
        case ApiClientExceptionType.Other:
          _errorMessage = 'Произошла ошибка. Попробуйте еще раз';
          break;
      }
    }
    _isAuthProgress = false;
    if (_errorMessage != null) {
      notifyListeners();
      return;
    }

    if (sessionId == null || accountId == null) {
      _errorMessage = 'Неизвестная ошибка, поторите попытку';
      notifyListeners();
      return;
    }
    await _sessionDataProvider.setSessionId(sessionId);
    await _sessionDataProvider.setAccountId(accountId);
    unawaited(
      Navigator.of(context)
          .pushReplacementNamed(MainNavigationRouteNames.mainScreen),
    );
  }
}

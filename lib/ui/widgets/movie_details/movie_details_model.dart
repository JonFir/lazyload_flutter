import 'package:dart_lesson/domain/api_client/api_client.dart';
import 'package:dart_lesson/domain/data_providers/session_data_provider.dart';
import 'package:dart_lesson/domain/entity/movie_details.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MovieDetailsModel extends ChangeNotifier {
  final _sessionDataProvider = SessionDataProvider();
  final _apiClient = ApiClient();

  final int movieId;
  MovieDetails? _movieDetails;
  bool _isFavorite = false;
  String _locale = '';
  late DateFormat _dateFormat;
  Future<void>? Function()? onSessionExpired;

  MovieDetails? get movieDetails => _movieDetails;
  bool get isFavorite => _isFavorite;

  MovieDetailsModel(this.movieId);

  String stringFromDate(DateTime? date) =>
      date != null ? _dateFormat.format(date) : '';

  Future<void> setupLocale(BuildContext context) async {
    final locale = Localizations.localeOf(context).toLanguageTag();
    if (_locale == locale) return;
    _locale = locale;
    _dateFormat = DateFormat.yMMMMd(locale);
    await loadDetails();
  }

  Future<void> loadDetails() async {
    try {
      _movieDetails = await _apiClient.movieDetails(movieId, _locale);
      final sessionId = await _sessionDataProvider.getSessionId();
      if (sessionId != null) {
        _isFavorite = await _apiClient.isFavorite(movieId, sessionId);
      }
      notifyListeners();
    } on ApiClientException catch (e) {
      _handleApiClientException(e);
    }
  }

  Future<void> toggleFavorite() async {
    final sessionId = await _sessionDataProvider.getSessionId();
    final accountId = await _sessionDataProvider.getAccountId();

    if (sessionId == null || accountId == null) return;

    _isFavorite = !_isFavorite;
    notifyListeners();
    try {
      await _apiClient.markAsFavorite(
        accountId: accountId,
        sessionId: sessionId,
        mediaType: MediaType.Movie,
        mediaId: movieId,
        isFavorite: _isFavorite,
      );
    } on ApiClientException catch (e) {
      _handleApiClientException(e);
    }
  }

  void _handleApiClientException(ApiClientException exeption) {
    switch (exeption.type) {
      case ApiClientExceptionType.SessionExpired:
        onSessionExpired?.call();
        break;
      default:
        print(exeption);
    }
  }
}

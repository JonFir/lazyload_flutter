import 'package:dart_lesson/configuration/configuration.dart';
import 'package:dart_lesson/domain/api_client/account_api_client.dart';
import 'package:dart_lesson/domain/api_client/movi_api_client.dart';
import 'package:dart_lesson/domain/data_providers/session_data_provider.dart';
import 'package:dart_lesson/domain/entity/popular_movie_response.dart';
import 'package:dart_lesson/domain/local_entity/movie_details_local.dart';
import 'package:dart_lesson/ui/widgets/movie_details/movie_details_model.dart';
import 'package:dart_lesson/ui/widgets/movie_list/movie_list_model.dart';

class MovieService
    implements
        MovieDetailsModelMovieProvider,
        MovieListViewModelMoviesProvider {
  final MovieApiClient movieApiClient;
  final SessionDataProvider sessionDataProvider;
  final AccountApiClient accountApiClient;

  const MovieService({
    required this.movieApiClient,
    required this.sessionDataProvider,
    required this.accountApiClient,
  });

  @override
  Future<PopularMovieResponse> popularMovie(int page, String locale) async =>
      movieApiClient.popularMovie(
        page,
        locale,
        Configuration.apiKey,
      );

  @override
  Future<PopularMovieResponse> searchMovie(
    int page,
    String locale,
    String query,
  ) async =>
      movieApiClient.searchMovie(
        page,
        locale,
        query,
        Configuration.apiKey,
      );

  @override
  Future<MovieDetailsLocal> loadDetails({
    required int movieId,
    required String locale,
  }) async {
    final movieDetails = await movieApiClient.movieDetails(movieId, locale);
    final sessionId = await sessionDataProvider.getSessionId();
    var isFavorite = false;
    if (sessionId != null) {
      isFavorite = await movieApiClient.isFavorite(movieId, sessionId);
    }
    return MovieDetailsLocal(details: movieDetails, isFavorite: isFavorite);
  }

  @override
  Future<void> upateFavorite({
    required int movieId,
    required bool isFavorite,
  }) async {
    final sessionId = await sessionDataProvider.getSessionId();
    final accountId = await sessionDataProvider.getAccountId();

    if (sessionId == null || accountId == null) return;
    await accountApiClient.markAsFavorite(
      accountId: accountId,
      sessionId: sessionId,
      mediaType: MediaType.movie,
      mediaId: movieId,
      isFavorite: isFavorite,
    );
  }

  MovieService copyWith({
    MovieApiClient? movieApiClient,
    SessionDataProvider? sessionDataProvider,
    AccountApiClient? accountApiClient,
  }) {
    return MovieService(
      movieApiClient: movieApiClient ?? this.movieApiClient,
      sessionDataProvider: sessionDataProvider ?? this.sessionDataProvider,
      accountApiClient: accountApiClient ?? this.accountApiClient,
    );
  }

  @override
  String toString() =>
      'MovieService(movieApiClient: $movieApiClient, sessionDataProvider: $sessionDataProvider, accountApiClient: $accountApiClient)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovieService &&
        other.movieApiClient == movieApiClient &&
        other.sessionDataProvider == sessionDataProvider &&
        other.accountApiClient == accountApiClient;
  }

  @override
  int get hashCode =>
      movieApiClient.hashCode ^
      sessionDataProvider.hashCode ^
      accountApiClient.hashCode;
}

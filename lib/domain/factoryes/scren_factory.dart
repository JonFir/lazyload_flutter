import 'package:dart_lesson/Library/Widgets/Inherited/provider.dart'
    as old_provider;
import 'package:dart_lesson/ui/widgets/auth/auth_model.dart';
import 'package:dart_lesson/ui/widgets/auth/auth_widget.dart';
import 'package:dart_lesson/ui/widgets/loader_widget/loader_view_model.dart';
import 'package:dart_lesson/ui/widgets/loader_widget/loader_widget.dart';
import 'package:dart_lesson/ui/widgets/main_screen/main_screen_model.dart';
import 'package:dart_lesson/ui/widgets/main_screen/main_screen_widget.dart';
import 'package:dart_lesson/ui/widgets/movie_details/movie_details_model.dart';
import 'package:dart_lesson/ui/widgets/movie_details/movie_details_widget.dart';
import 'package:dart_lesson/ui/widgets/movie_trailer/movie_trailer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenFactory {
  Widget makeLoader() {
    return Provider(
      create: (context) => LoaderViewModel(context),
      child: const LoaderWidget(),
      lazy: false,
    );
  }

  Widget makeAuth() {
    return old_provider.NotifierProvider(
      create: () => AuthModel(),
      child: const AuthWidget(),
    );
  }

  Widget makeMainScreen() {
    return old_provider.NotifierProvider(
      create: () => MainScreenModel(),
      child: const MainScreenWidget(),
    );
  }

  Widget makeMovieDetails(int movieId) {
    return old_provider.NotifierProvider(
      create: () => MovieDetailsModel(movieId),
      child: const MovieDetailsWidget(),
    );
  }

  Widget makeMovieTrailer(String youtubeKey) {
    return MovieTrailerWidget(youtubeKey: youtubeKey);
  }
}

import 'package:dart_lesson/domain/blocs/auth_bloc.dart';
import 'package:dart_lesson/ui/widgets/auth/auth_model.dart';
import 'package:dart_lesson/ui/widgets/auth/auth_widget.dart';
import 'package:dart_lesson/ui/widgets/loader_widget/loader_view_model.dart';
import 'package:dart_lesson/ui/widgets/loader_widget/loader_widget.dart';
import 'package:dart_lesson/ui/widgets/main_screen/main_screen_widget.dart';
import 'package:dart_lesson/ui/widgets/movie_details/movie_details_model.dart';
import 'package:dart_lesson/ui/widgets/movie_details/movie_details_widget.dart';
import 'package:dart_lesson/ui/widgets/movie_list/movie_list_model.dart';
import 'package:dart_lesson/ui/widgets/movie_list/movie_list_widget.dart';
import 'package:dart_lesson/ui/widgets/movie_trailer/movie_trailer_widget.dart';
import 'package:dart_lesson/ui/widgets/news/new_widget.dart';
import 'package:dart_lesson/ui/widgets/tv_show_list/tv_show_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class ScreenFactory {
  AuthBloc? _authBloc;

  Widget makeLoader() {
    final authBloc = _authBloc ?? AuthBloc(AuthCheckStatusInProgressState());
    _authBloc = authBloc;
    return BlocProvider<LoaderViewCubit>(
      create: (context) => LoaderViewCubit(
        LoaderViewCubitState.unknown,
        authBloc,
      ),
      child: const LoaderWidget(),
      lazy: false,
    );
  }

  Widget makeAuth() {
    return ChangeNotifierProvider(
      create: (_) => AuthViewModel(),
      child: const AuthWidget(),
    );
  }

  Widget makeMainScreen() {
    _authBloc?.close();
    _authBloc = null;
    return const MainScreenWidget();
  }

  Widget makeMovieDetails(int movieId) {
    return ChangeNotifierProvider(
      create: (_) => MovieDetailsModel(movieId),
      child: const MovieDetailsWidget(),
    );
  }

  Widget makeMovieTrailer(String youtubeKey) {
    return MovieTrailerWidget(youtubeKey: youtubeKey);
  }

  Widget makeNewsList() {
    return const NewsWidget();
  }

  Widget makeMovieList() {
    return ChangeNotifierProvider(
      create: (_) => MovieListViewModel(),
      child: const MovieListWidget(),
    );
  }

  Widget makeTWShowList() {
    return const TWShowListWidget();
  }
}

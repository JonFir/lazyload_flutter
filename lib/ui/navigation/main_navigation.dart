import 'package:dart_lesson/ui/navigation/main_navigation_route_names.dart';
import 'package:dart_lesson/ui/widgets/app/my_app.dart';
import 'package:flutter/material.dart';

abstract class ScreenFactory {
  Widget makeLoader();
  Widget makeAuth();
  Widget makeMainScreen();
  Widget makeMovieDetails(int movieId);
  Widget makeMovieTrailer(String youtubeKey);
  Widget makeNewsList();
  Widget makeMovieList();
  Widget makeTWShowList();
}

class MainNavigation implements MyAppNavigation {
  final ScreenFactory screenFactory;

  const MainNavigation(this.screenFactory);

  @override
  Map<String, Widget Function(BuildContext)> get routes => {
        MainNavigationRouteNames.loaderWidget: (_) =>
            screenFactory.makeLoader(),
        MainNavigationRouteNames.auth: (_) => screenFactory.makeAuth(),
        MainNavigationRouteNames.mainScreen: (_) =>
            screenFactory.makeMainScreen(),
      };

  @override
  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteNames.movieDetails:
        final arguments = settings.arguments;
        final movieId = arguments is int ? arguments : 0;
        return MaterialPageRoute(
          builder: (_) => screenFactory.makeMovieDetails(movieId),
        );
      case MainNavigationRouteNames.movieTrailerWidget:
        final arguments = settings.arguments;
        final youtubeKey = arguments is String ? arguments : '';
        return MaterialPageRoute(
          builder: (_) => screenFactory.makeMovieTrailer(youtubeKey),
        );
      default:
        const widget = Text('Navigation error!!!');
        return MaterialPageRoute(builder: (_) => widget);
    }
  }
}

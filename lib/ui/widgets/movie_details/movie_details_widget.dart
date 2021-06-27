import 'package:dart_lesson/ui/widgets/movie_details/movie_details_main_info_widget.dart';
import 'package:dart_lesson/ui/widgets/movie_details/movie_details_main_screen_cast_widget.dart';
import 'package:flutter/material.dart';

class MovieDetailsWidget extends StatefulWidget {
  final int movieId;

  MovieDetailsWidget({
    Key? key,
    required this.movieId,
  }) : super(key: key);

  @override
  _MovieDetailsWidgetState createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tom Clancy`s Without Remorse'),
      ),
      body: ColoredBox(
        color: const Color.fromRGBO(24, 23, 27, 1.0),
        child: ListView(
          children: [
            const MovieDetailsMainInfoWidget(),
            const SizedBox(height: 30),
            const MovieDetailsMainScreenCastWidget(),
          ],
        ),
      ),
    );
  }
}

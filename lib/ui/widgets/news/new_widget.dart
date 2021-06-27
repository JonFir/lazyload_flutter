import 'package:dart_lesson/ui/widgets/news/news_widget_free_to_watch.dart';
import 'package:dart_lesson/ui/widgets/news/news_widget_leaderboards.dart';
import 'package:dart_lesson/ui/widgets/news/news_widget_popular.dart';
import 'package:dart_lesson/ui/widgets/news/news_widget_trailers.dart';
import 'package:dart_lesson/ui/widgets/news/news_widget_trandings.dart';
import 'package:flutter/material.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const NewsWidgetPopular(),
        const NewsWidgetFreeToWatch(),
        const NewsWidgetTrailers(),
        const NewsWidgetTrandings(),
        const NewsWidgetLeaderboards(),
      ],
    );
  }
}

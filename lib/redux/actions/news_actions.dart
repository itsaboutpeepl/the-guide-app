import 'package:dio/dio.dart';
import 'package:peepl/models/articles/blogArticle.dart';
import 'package:peepl/services.dart';
import 'package:peepl/utils/log/log.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:redux/redux.dart';

class UpdateFeaturedPost {
  final BlogArticle newArticle;

  UpdateFeaturedPost({required this.newArticle});
}

ThunkAction fetchFeaturedPost() {
  return (Store store) async {
    try {
      BlogArticle article = await newsService.featuredArticle();

      store.dispatch(UpdateFeaturedPost(newArticle: article));
    } catch (e, s) {
      log.error('ERROR - fetchFeaturedPost $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - fetchFeaturedPost $e',
      );
    }
  };
}

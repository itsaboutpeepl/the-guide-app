import 'dart:async';
import 'package:dio/dio.dart';
import 'package:peepl/constants/urls.dart';
import 'package:peepl/models/articles/blogArticle.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class NewsService {
  final Dio dio;

  NewsService(this.dio) {
    dio.options.baseUrl = UrlConstants.THEGUIDE_WORDPRESS_API;
    dio.options.headers = Map.from({"Content-Type": 'application/json'});
  }

  //TODO: need to start working with wordpress
  Future<BlogArticle> featuredArticle() async {
    Response response = await dio.get(
        'top-headlines?country=us&category=business&apiKey=a920ad97e9fc4e84933b96be2f3a1ad3');

    List<dynamic> results = response.data['articles'] as List;

    List<String> category = [];
    category.add(results[0]['author']);

    return BlogArticle(
      postID: 21312,
      imageURL: results[0]['urlToImage'],
      title: results[0]['title'],
      postURL: results[0]['url'],
      category: category,
      content: results[0]['content'],
    );
  }
}

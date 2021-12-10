import 'dart:async';
import 'package:dio/dio.dart';
import 'package:guide_liverpool/constants/urls.dart';
import 'package:guide_liverpool/models/articles/blogArticle.dart';
import 'package:guide_liverpool/models/articles/category.dart';
import 'package:injectable/injectable.dart';
import 'package:guide_liverpool/models/articles/directory.dart';
import 'package:guide_liverpool/models/articles/events.dart';
import 'package:guide_liverpool/models/articles/videoArticle.dart';

@lazySingleton
class NewsService {
  final Dio dio;

  NewsService(this.dio) {
    dio.options.baseUrl = UrlConstants.THEGUIDE_WORDPRESS_API;
    dio.options.headers = Map.from({"Content-Type": 'application/json'});
  }

  Future<List<BlogArticle>> featuredArticles() async {
    Response response = await dio.get('/posts?page=1');

    List<dynamic> results = response.data as List;

    List<BlogArticle> articles = [];

    results.forEach(
      (element) {
        articles.add(
          BlogArticle(
            title: element['title'],
            imageURL: element['featured_image'],
            category: element['categories'].cast<String>(),
            postID: element['id'],
            postURL: element['link'],
            content: element['content'],
            description: element['description'],
            publishedAt: DateTime.parse(element['date']),
            gallery: element['attachments'].cast<String>(),
          ),
        );
      },
    );

    return articles;
  }

  Future<List<Category>> getCategories() async {
    //Response response = await dio.get('/categories');
    List<Category> demoCategories = [
      Category(categoryID: 13866, categoryName: "Latest"),
      Category(categoryID: 16630, categoryName: "Features"),
      Category(categoryID: 13873, categoryName: "LifeStyle"),
      Category(categoryID: 21554, categoryName: "Entertainment"),
      Category(categoryID: 13876, categoryName: "Food & Drink"),
    ];

    return demoCategories;
  }

  Future<List<BlogArticle>> pagedArticlesByCategoryID(String query,
      {int page = 1}) async {
    Response response = await dio.get('/posts?category=$query&page=$page');

    List<dynamic> results = response.data as List;

    List<BlogArticle> articles = [];

    results.forEach(
      (element) {
        articles.add(
          BlogArticle(
            title: element['title'],
            imageURL: element['featured_image'],
            category: element['categories'].cast<String>(),
            postID: element['id'],
            postURL: element['link'],
            content: element['content'],
            description: element['description'],
            publishedAt: DateTime.parse(element['date']),
            gallery: element['attachments'].cast<String>(),
          ),
        );
      },
    );

    return articles;
  }

  Future<List<VideoArticle>> featuredVideos() async {
    Response response = await dio.get('/videos');

    List<dynamic> results = response.data as List;
    List<VideoArticle> videos = [];
    results.forEach(
      (element) {
        videos.add(
          VideoArticle(
            title: element['description'],
            placeholderImageURL: element['picture'],
            category: [""],
            videoURL: element['url'],
            postID: 000,
            postURL: element['read_more_url'] ?? "",
            rewardAmount: 0,
          ),
        );
      },
    );
    return videos;
  }

  Future<List<Events>> eventsList() async {
    List<Events> events = [];

    for (var i = 0; i < 3; i++) {
      events.add(
        Events(
          startDate: DateTime.parse("2021-04-09"),
          endDate: DateTime.parse("2021-12-21"),
          eventTitle: "Test Title Event",
          location: "Test Event Location wow",
          coordinates: "53.12618, 2.79123",
          time: "08:00 - 12:00",
        ),
      );
    }
    return events;
  }

  Future<List<Directory>> directoryList() async {
    List<Directory> directory = [];

    for (var i = 0; i < 3; i++) {
      directory.add(
        Directory(
            directoryTitle: "Test Directory Title",
            directoryLocation: "52.761181",
            directoryCoordinates: "23.83721, 12.74719",
            directoryWebsiteURL: "https://google.com"),
      );
    }
    return directory;
  }
}

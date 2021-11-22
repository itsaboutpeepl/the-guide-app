import 'dart:async';
import 'package:dio/dio.dart';
import 'package:peepl/constants/urls.dart';
import 'package:peepl/models/articles/blogArticle.dart';
import 'package:injectable/injectable.dart';
import 'package:peepl/models/articles/directory.dart';
import 'package:peepl/models/articles/events.dart';
import 'package:peepl/models/articles/videoArticle.dart';

@lazySingleton
class NewsService {
  final Dio dio;

  //TODO: Remove when actual API is completed.
  String loremImpsum =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

  NewsService(this.dio) {
    dio.options.baseUrl = UrlConstants.THEGUIDE_WORDPRESS_API;
    dio.options.headers = Map.from({"Content-Type": 'application/json'});
  }

  Future<List<BlogArticle>> featuredArticles() async {
    Response response = await dio.get(
        'top-headlines?country=us&category=business&apiKey=a920ad97e9fc4e84933b96be2f3a1ad3');

    List<dynamic> results = response.data['articles'] as List;

    List<BlogArticle> articles = [];

    for (var i = 0; i < 3; i++) {
      articles.add(BlogArticle(
        title: results[i]['title'] ?? "",
        imageURL: results[i]['urlToImage'] ??
            "https://www.cityam.com/wp-content/uploads/2021/07/CAMD-G89-1024-GBrown-copy-1.jpg",
        category: [results[i]['author'] ?? "Hussain Surti"],
        postID: 23132,
        postURL: results[i]['url'] ??
            "https://www.cityam.com/wp-content/uploads/2021/07/CAMD-G89-1024-GBrown-copy-1.jpg",
        content: results[i]['content'] ?? loremImpsum,
      ));
    }
    return articles;
  }

  Future<List<Map<String, String>>> categoryNames() async {
    // Response response = await dio.get(
    //     'top-headlines?country=us&category=business&apiKey=a920ad97e9fc4e84933b96be2f3a1ad3');

    //List<dynamic> results = response.data['articles'] as List;

    List<Map<String, String>> test = [
      {"id": "3212", "name": "Latest"},
      {"id": "8217", "name": "Features"},
      {"id": "9721", "name": "Eat"},
      {"id": "2668", "name": "Club"},
      {"id": "8540", "name": "Test"},
    ];

    return test;
  }

  Future<List<BlogArticle>> articlesByCategoryID(String categoryID) async {
    Response response = await dio.get(
        'top-headlines?country=us&category=business&apiKey=a920ad97e9fc4e84933b96be2f3a1ad3');

    List<dynamic> results = response.data['articles'] as List;

    List<BlogArticle> articles = [];

    for (var i = 0; i < 3; i++) {
      articles.add(BlogArticle(
        title: results[i]['title'] ?? "",
        imageURL: results[i]['urlToImage'] ??
            "https://www.cityam.com/wp-content/uploads/2021/07/CAMD-G89-1024-GBrown-copy-1.jpg",
        category: [results[i]['author'] ?? "Hussain Surti"],
        postID: 23132,
        postURL: results[i]['url'] ??
            "https://www.cityam.com/wp-content/uploads/2021/07/CAMD-G89-1024-GBrown-copy-1.jpg",
        content: results[i]['content'] ?? loremImpsum,
      ));
    }
    return articles;
  }

  Future<List<VideoArticle>> featuredVideos() async {
    // Response response = await dio.get(
    //     'top-headlines?country=us&category=business&apiKey=a920ad97e9fc4e84933b96be2f3a1ad3');

    // List<dynamic> results = response.data['articles'] as List;

    List<VideoArticle> videos = [];

    for (var i = 0; i < 3; i++) {
      videos.add(
        VideoArticle(
            title: "Test Article",
            placeholderImageURL:
                "https://www.cityam.com/wp-content/uploads/2021/07/CAMD-G89-1024-GBrown-copy-1.jpg",
            videoURL:
                "https://assets.mixkit.co/videos/preview/mixkit-daytime-city-traffic-aerial-view-56-large.mp4",
            category: ["Test Category"],
            rewardAmount: 50,
            postID: 2698,
            postURL: "google.com"),
      );
    }
    return videos;
  }

  Future<List<Events>> eventsList() async {
    // Response response = await dio.get(
    //     'top-headlines?country=us&category=business&apiKey=a920ad97e9fc4e84933b96be2f3a1ad3');

    // List<dynamic> results = response.data['articles'] as List;

    List<Events> events = [];

    for (var i = 0; i < 3; i++) {
      events.add(
        Events(
          startDate: DateTime.parse("09-04-2021"),
          endDate: DateTime.parse("22-12-2021"),
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
    // Response response = await dio.get(
    //     'top-headlines?country=us&category=business&apiKey=a920ad97e9fc4e84933b96be2f3a1ad3');

    // List<dynamic> results = response.data['articles'] as List;

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

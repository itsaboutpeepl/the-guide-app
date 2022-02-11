import 'dart:async';
import 'package:dio/dio.dart';
import 'package:guide_liverpool/constants/urls.dart';
import 'package:guide_liverpool/features/guideHome/helpers/UrlLaunch.dart';
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

  Future<BlogArticle> getArticleByID(int articleID) async {
    Response response = await dio.get('/post/$articleID');

    return BlogArticle(
      title: parseHtmlString(response.data['title']),
      imageURL: response.data['featured_image'],
      category: response.data['categories'].cast<String>(),
      postID: int.parse(response.data['id']),
      postURL: response.data['link'],
      content: response.data['content'],
      description: parseHtmlString(response.data['description']),
      publishedAt: DateTime.parse(response.data['date']),
      gallery: response.data['attachments'].cast<String>(),
    );
  }

  Future<List<BlogArticle>> featuredArticles() async {
    Response response = await dio.get('/posts?page=1');

    List<dynamic> results = response.data as List;

    List<BlogArticle> articles = [];

    results.forEach(
      (element) {
        articles.add(
          BlogArticle(
            title: parseHtmlString(element['title']),
            imageURL: element['featured_image'],
            category: element['categories'].cast<String>(),
            postID: element['id'],
            postURL: element['link'],
            content: element['content'],
            description: parseHtmlString(element['description']),
            publishedAt: DateTime.parse(element['date']),
            gallery: element['attachments'].cast<String>(),
          ),
        );
      },
    );

    return articles;
  }

  Future<List<Category>> getCategories() async {
    List<Category> demoCategories = [
      Category(categoryID: 13866, categoryName: "Latest"),
      Category(categoryID: 16630, categoryName: "Features"),
      Category(categoryID: 13873, categoryName: "LifeStyle"),
      Category(categoryID: 21554, categoryName: "Entertainment"),
      Category(categoryID: 13876, categoryName: "Food & Drink"),
      Category(categoryID: 13894, categoryName: "Culture"),
      Category(categoryID: 13930, categoryName: "Nightlife"),
      Category(categoryID: 13886, categoryName: "Family"),
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
            title: parseHtmlString(element['title']),
            imageURL: element['featured_image'],
            category: element['categories'].cast<String>(),
            postID: element['id'],
            postURL: element['link'],
            content: element['content'],
            description: parseHtmlString(element['description']),
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
            title: parseHtmlString(element['description']),
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
    Response response = await dio.get('/events');

    List<dynamic> results = response.data as List;
    List<Events> events = [];

    results.forEach((element) {
      events.add(
        Events(
            startDate: DateTime.parse(element['start_date']),
            endDate: DateTime.parse(element['end_date']),
            eventTitle: parseHtmlString(element['title']),
            location: element['location']['name'] +
                ", " +
                (element['location']['street_name_short'] ?? "UK"),
            description: parseHtmlString(element['description']),
            latitude: element['location']['lat'].toString(),
            longitude: element['location']['lng'].toString(),
            bookingLink: element['link']),
      );
    });

    return events;
  }

  Future<List<Directory>> directoryList() async {
    Response response = await dio.get('/directory');

    List<dynamic> results = response.data as List;

    List<Directory> directory = [];

    results.forEach(
      (element) {
        directory.add(
          Directory(
            title: parseHtmlString(element['title']),
            latitude: element['location']['lat'].toString(),
            longitude: element['location']['lng'].toString(),
            address: element['location']['address'] ??
                (element['location']['name'] +
                    ", " +
                    element['location']['street_name_short']),
            description: element['description'],
            website: element['website'] ?? "",
            twitterLink: element['twitter'] ?? "",
            instaLink: element['instagram'] ?? "",
            facebookLink: element['facebook'] ?? "",
            guideWebLink: element['link'],
            imageURL: element['featured_image'],
          ),
        );
      },
    );
    return directory;
  }
}

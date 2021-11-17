import 'package:dio/dio.dart';
import '../../models/news/articleModel.dart';
import '../../models/news/NewsResponse_model.dart';

class NewsApiServices {
  static const String _apiKey = 'a920ad97e9fc4e84933b96be2f3a1ad3';
  final String _url =
      'https://newsapi.org/v2/top-headlines?country=gb&apiKey=$_apiKey';

  late Dio _dio;

  NewsApiServices() {
    _dio = Dio();
  }

  Future<List<ArticleModel>> fetchNewsArticle() async {
    try {
      Response response = await _dio.get(_url);
      NewsResponse newsResponse = NewsResponse.fromJson(response.data);
      return newsResponse.articles;
    } on DioError catch (e) {
      print(e);
      rethrow;
    }
  }
}

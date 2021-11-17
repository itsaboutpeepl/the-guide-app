import 'article_Model.dart';

class NewsResponse {
  String? status;
  int? totalResults;
  List<ArticleModel> articles;
  NewsResponse({
    this.status,
    this.totalResults,
    required this.articles,
  });

  factory NewsResponse.fromJson(Map<String, dynamic> json) => NewsResponse(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<ArticleModel>.from(
          json["articles"].map(
            (x) => ArticleModel.fromJson(x),
          ),
        ),
      );
}

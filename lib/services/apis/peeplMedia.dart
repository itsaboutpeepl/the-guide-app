import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:guide_liverpool/constants/urls.dart';
import 'package:guide_liverpool/features/guideHome/helpers/UrlLaunch.dart';
import 'package:guide_liverpool/models/articles/videoArticle.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PeeplMediaService {
  final Dio dio;

  PeeplMediaService(this.dio) {
    dio.options.baseUrl = UrlConstants.PEEPL_MEDIA_API;
    dio.options.headers = Map.from({"Content-Type": 'application/json'});
  }

  Future<List<VideoArticle>> featuredVideos() async {
    Response response = await dio
        .get('/partners/${dotenv.env['GUIDE_PARTNER_PUBLIC_ID']}/videos');

    List<dynamic> results = response.data['videos'] as List;
    List<VideoArticle> videos = [];
    results.forEach(
      (element) {
        videos.add(
          VideoArticle(
            title: parseHtmlString(element['name']),
            placeholderImageURL: element['thumbnail'],
            category: [""],
            videoURL: element['url'],
            postID: element['publicId'],
            postURL: element['ctaLink'] ?? "",
            rewardAmount: element['rewardsPerView'],
            isUserWatched: element['viewed'] ?? false,
            rewardsEndDate:
                DateTime.fromMillisecondsSinceEpoch(element['rewardsEndDate']),
          ),
        );
      },
    );
    return List.from(videos.reversed);
  }

  Future<VideoArticle?> getVideoById(String videoId) async {
    Response response = await dio
        .get('/partners/${dotenv.env['GUIDE_PARTNER_PUBLIC_ID']}/videos');

    List<dynamic> results = response.data['videos'] as List;
    List<VideoArticle> videos = [];
    results.forEach(
      (element) {
        videos.add(
          VideoArticle(
            title: parseHtmlString(element['name']),
            placeholderImageURL: element['thumbnail'],
            category: [""],
            videoURL: element['url'],
            postID: element['publicId'],
            postURL: element['ctaLink'] ?? "",
            rewardAmount: element['rewardsPerView'],
            isUserWatched: element['viewed'] ?? false,
            rewardsEndDate:
                DateTime.fromMillisecondsSinceEpoch(element['rewardsEndDate']),
          ),
        );
      },
    );
    if (videos.where((element) => element.postID == videoId).isEmpty)
      return null;
    else
      return videos.firstWhere((element) => element.postID == videoId);
  }

  Future<int> createVideoView(String videoID, String walletAddress) async {
    Response response = await dio.post(
      '/videos/$videoID/view',
      data: {
        "videoId": videoID,
        "walletAddress": walletAddress,
      },
    );

    Map results = Map.from(response.data['videoView']);

    return results["rewardsIssued"];
  }
}

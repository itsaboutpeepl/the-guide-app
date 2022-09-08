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

  Future<void> loginToDashboard() async {
    Response response = await dio.post(
      '/users/login',
      data: {
        //TODO: is this supposed to be here or in .env?
        "email": "lee@theguideliverpool.com",
        "password": "NUmK#7mXCp%vzho#ed8Ek2@z",
      },
    );

    Map results = Map.from(response.data);

    this.dio.options.headers['Authorization'] = "Bearer ${results['token']}";
  }

  Future<List<VideoArticle>> featuredVideos() async {
    Response response = await dio.get('/partners/${dotenv.env['GUIDE_PARTNER_PUBLIC_ID']}/videos');

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
          ),
        );
      },
    );
    return videos;
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

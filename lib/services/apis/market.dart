import 'package:dio/dio.dart';
import 'package:guide_liverpool/constants/urls.dart';
import 'package:injectable/injectable.dart';
import 'package:marketing_cards/model/marketing_card.dart';
import 'package:marketing_cards/repo/marketing_repo.dart';

@lazySingleton
class MarketApi {
  MarketApi(this.dio) {
    dio.options.baseUrl = UrlConstants.PEEPL_MARKET_API;
    dio.options.headers = Map.from({'Content-Type': 'application/json'});
  }

  final Dio dio;

  Future<String?> createMarketOrder({
    required String walletAddress,
    required String productId,
    required String email,
    required String phone,
    String? addressLineOne,
    String? addressCity,
    String? postcode,
  }) async {
    final Response<dynamic> response = await dio.post(
      '/orders',
      data: {
        'userWallet': walletAddress,
        'addressLineOne': addressLineOne ?? '',
        'addressCity': addressCity ?? '',
        'addressPostCode': postcode ?? '',
        'email': email,
        'phone': phone,
        'productId': productId
      },
    );

    if (response.statusCode == 201) {
      final String paymentIntent = response.data['peepl_payment_id'] as String;

      return paymentIntent;
    } else {
      return null;
    }
  }

  Future<List<String>> getProductPhotos() async {
    final response = await dio.get<Map<String, Object?>>('/products');

    final ApiResponse response2 = ApiResponse(
      response.data!['products'] as List? ?? [],
    );

    final result = MarketingCardsReponse(
      cards: response2.results.map((e) {
        return MarketingCard.fromJson(e as Map<String, Object?>);
      }).toList(growable: false),
      totalCount: response2.results.length,
    );

    final List<String> photos =
        result.cards.map((e) => e.photos.first.url).toList();

    return photos;
  }

//   Future<bool> checkOrderStatus() async {
//     final response = await dio.get<Map<String, Object?>>('/products');

//     final ApiResponse response2 = ApiResponse(
//       response.data!['products'] as List? ?? [],
//     );

//     final result = MarketingCardsReponse(
//       cards: response2.results.map((e) {
//         return MarketingCard.fromJson(e as Map<String, Object?>);
//       }).toList(growable: false),
//       totalCount: response2.results.length,
//     );

//     final List<String> photos =
//         result.cards.map((e) => e.photos.first.url).toList();

//     return photos;
//   }
}

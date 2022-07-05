import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PeeplPayService {
  final Dio dio;

  PeeplPayService(this.dio) {
    dio.options.baseUrl = dotenv.env['PEEPL_PAY_BACKEND']!;
    dio.options.headers = Map.from({"Content-Type": 'application/json'});
  }

  Future<Map<dynamic, dynamic>> requestPaymentIntentIdDetails(String paymentIntentID) async {
    Response response = await dio.get("api/v1/payment_intents/$paymentIntentID");

    Map<dynamic, dynamic> result = response.data;

    print("Payment Intent Result $result");

    return result['paymentIntent'];
  }
}

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:guide_liverpool/utils/log/log.dart';

@lazySingleton
class PeeplPayService {
  PeeplPayService(this.dio) {
    dio.options.baseUrl = dotenv.env['PEEPL_PAY_BACKEND']!;
    dio.options.headers = Map.from({'Content-Type': 'application/json'});
  }

  final Dio dio;

  Future<Map<String, dynamic>> checkOrderValidity(
    String paymentIntentID,
  ) async {
    final Response<dynamic> response =
        await dio.get('api/v1/payment_intents/$paymentIntentID');

    final Map<String, dynamic> result = response.data as Map<String, dynamic>;

    log.info('Payment Intent Result $result');

    return result;
  }
}

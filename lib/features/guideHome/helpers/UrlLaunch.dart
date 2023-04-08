import 'package:url_launcher/url_launcher.dart' as url_launcher;

class UrlLaunch {
  UrlLaunch._();

  static Future<void> launchURL(String url) async {
    await url_launcher.launchUrl(
      Uri.parse(url),
    );
  }

  static Future<void> launchPhone({
    required String phone,
  }) async {
    await url_launcher.launchUrl(
      Uri(
        scheme: 'tel',
        path: phone,
      ),
    );
  }

  static Future<void> launchEmail({
    required String email,
    Map<String, dynamic>? queryParams,
  }) async {
    await url_launcher.launchUrl(
      Uri(
        scheme: 'mailto',
        path: email,
        queryParameters: queryParams,
      ),
    );
  }

  static Future<void> openMap(double latitude, double longitude) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';

    final uri = Uri.parse(googleUrl);

    if (await url_launcher.canLaunchUrl(uri)) {
      await url_launcher.launchUrl(uri);
    } else {
      throw 'Could not open the map.';
    }
  }
}

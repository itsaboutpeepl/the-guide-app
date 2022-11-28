import 'package:url_launcher/url_launcher.dart' as url_launcher;
import 'package:html/parser.dart';

class UrlLaunch {
  UrlLaunch._();

  static Future<void> openMap(double latitude, double longitude) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await url_launcher.canLaunch(googleUrl)) {
      await url_launcher.launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }

  static void launchURL(String url) async {
    final bool nativeAppLaunchSucceeded = await url_launcher.launch(
      url,
      forceSafariVC: false,
      universalLinksOnly: true,
    );
    if (!nativeAppLaunchSucceeded) {
      await url_launcher.launch(
        url,
        forceSafariVC: true,
      );
    }
  }

  static void launchPhone(String phone) async {
    await url_launcher.launch('tel:$phone');
  }

  static void launchEmail(String email) async {
    await url_launcher.launch('mailto:$email');
  }
}

String parseHtmlString(String htmlString) {
  final document = parse(htmlString);
  final String parsedString = parse(document.body!.text).documentElement!.text;

  return parsedString;
}

import 'package:url_launcher/url_launcher.dart';
import 'package:html/parser.dart';

class UrlLaunch {
  UrlLaunch._();

  static Future<void> openMap(double latitude, double longitude) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }

  static void launchURL(String url) async {
    final bool nativeAppLaunchSucceeded = await launch(
      url,
      forceSafariVC: false,
      universalLinksOnly: true,
    );
    if (!nativeAppLaunchSucceeded) {
      await launch(
        url,
        forceSafariVC: true,
      );
    }
  }

  static void launchPhone(String phone) async {
    // canLaunch("tel:+2343").then(
    //   (value) => print("Can Launch Phone $value"),
    // );
    await launch("tel:$phone");
  }

  static void launchEmail(String email) async {
    // canLaunch("mailto:info@theguideliverpool.com").then(
    //   (value) => print("Can Launch Email $value"),
    // );
    await launch("mailto:$email");
  }
}

String parseHtmlString(String htmlString) {
  final document = parse(htmlString);
  final String parsedString = parse(document.body!.text).documentElement!.text;

  return parsedString;
}

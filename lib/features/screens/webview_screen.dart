import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:guide_liverpool/features/shared/widgets/my_scaffold.dart';

@RoutePage()
class WebViewPage extends StatelessWidget {
  final String url;
  final String title;

  const WebViewPage(
    this.url,
    this.title,
  );

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: title,
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse(url)),
      ),
    );
  }
}

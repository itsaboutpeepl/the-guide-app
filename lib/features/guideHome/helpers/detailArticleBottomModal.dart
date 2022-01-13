import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:guide_liverpool/features/guideHome/helpers/UrlLaunch.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:guide_liverpool/models/articles/blogArticle.dart';
import 'package:share_plus/share_plus.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';
import 'package:webview_flutter/webview_flutter.dart' as WebView;

class DetailArticleBottomModel extends StatefulWidget {
  const DetailArticleBottomModel({Key? key, required this.articleData})
      : super(key: key);

  final BlogArticle articleData;

  @override
  _DetailArticleBottomModelState createState() =>
      _DetailArticleBottomModelState();
}

class _DetailArticleBottomModelState extends State<DetailArticleBottomModel> {
  int _currentIndex = 0;

  // ignore: unused_field
  late Timer _timer;
  late Widget htmlWidget;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(Duration(seconds: 5), (timer) async {
      if (mounted) {
        setState(() {
          if (_currentIndex + 1 == widget.articleData.gallery.length) {
            _currentIndex = 0;
          } else {
            _currentIndex = _currentIndex + 1;
          }
        });
      }
    });

    htmlWidget = Html(
      data: widget.articleData.content,
      onLinkTap: (url, context, attributes, element) =>
          {UrlLaunch.launchURL(url!), print(url)},
      customRender: {
        "iframe": (RenderContext context, Widget child) {
          final attrs = context.tree.element?.attributes;
          if (attrs != null) {
            double? width = double.tryParse(attrs['width'] ?? "");
            double? height = double.tryParse(attrs['height'] ?? "");
            return Container(
              width: width ?? (height ?? 150) * 2,
              height: height ?? (width ?? 300) / 2,
              child: WebView.WebView(
                initialUrl: attrs['src'] ?? "about:blank",
                javascriptMode: WebView.JavascriptMode.unrestricted,
                //no need for scrolling gesture recognizers on embedded youtube, so set gestureRecognizers null
                //on other iframe content scrolling might be necessary, so use VerticalDragGestureRecognizer
                gestureRecognizers: attrs['src'] != null &&
                        attrs['src']!.contains("youtube.com/embed")
                    ? null
                    : [Factory(() => VerticalDragGestureRecognizer())].toSet(),
                navigationDelegate: (WebView.NavigationRequest request) async {
                  //no need to load any url besides the embedded youtube url when displaying embedded youtube, so prevent url loading
                  //on other iframe content allow all url loading
                  if (attrs['src'] != null &&
                      attrs['src']!.contains("youtube.com/embed")) {
                    if (!request.url.contains("youtube.com/embed")) {
                      return WebView.NavigationDecision.prevent;
                    } else {
                      return WebView.NavigationDecision.navigate;
                    }
                  } else {
                    return WebView.NavigationDecision.navigate;
                  }
                },
              ),
            );
          } else {
            return Container(height: 0);
          }
        },
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.975,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => {Share.share(widget.articleData.postURL)},
          child: Icon(
            Icons.ios_share,
            color: Colors.white,
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: SingleChildScrollView(
          controller: ModalScrollController.of(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 300.0,
                child: CarouselSlider(
                  items: widget.articleData.gallery
                      .map(
                        (item) => CachedNetworkImage(
                          imageUrl: item,
                          fit: BoxFit.cover,
                        ),
                      )
                      .toList(),
                  options: CarouselOptions(
                    autoPlay: true,
                    height: double.infinity,
                    viewportFraction: 1,
                    autoPlayCurve: Curves.slowMiddle,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Text(
                      widget.articleData.title,
                      style: TextStyle(
                          fontSize: 28.0, fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(widget.articleData.category[0]),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey[300],
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          DateFormat("EEE, MMM d, ''yy")
                              .format(widget.articleData.publishedAt),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    htmlWidget,
                    // Text(
                    //parseHtmlString(widget.articleData.content),
                    //   style: TextStyle(fontSize: 18.0),
                    // )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Widget html = flutterHTML.Html(data: """
//    <h3>Google iframe:</h3>
//    <iframe src="https://google.com"></iframe>
//    <h3>YouTube iframe:</h3>
//    <iframe src="https://www.youtube.com/embed/tgbNymZ7vqY"></iframe>
//    """, customRender: {
//   "iframe": (flutterHTML.RenderContext context, Widget child) {
//     final attrs = context.tree.element?.attributes;
//     if (attrs != null) {
//       double? width = double.tryParse(attrs['width'] ?? "");
//       double? height = double.tryParse(attrs['height'] ?? "");
//       return Container(
//         width: width ?? (height ?? 150) * 2,
//         height: height ?? (width ?? 300) / 2,
//         child: WebView(
//           initialUrl: attrs['src'] ?? "about:blank",
//           javascriptMode: JavascriptMode.unrestricted,
//           //no need for scrolling gesture recognizers on embedded youtube, so set gestureRecognizers null
//           //on other iframe content scrolling might be necessary, so use VerticalDragGestureRecognizer
//           gestureRecognizers: attrs['src'] != null &&
//                   attrs['src']!.contains("youtube.com/embed")
//               ? null
//               : [Factory(() => VerticalDragGestureRecognizer())].toSet(),
//           navigationDelegate: (NavigationRequest request) async {
//             //no need to load any url besides the embedded youtube url when displaying embedded youtube, so prevent url loading
//             //on other iframe content allow all url loading
//             if (attrs['src'] != null &&
//                 attrs['src']!.contains("youtube.com/embed")) {
//               if (!request.url.contains("youtube.com/embed")) {
//                 return NavigationDecision.prevent;
//               } else {
//                 return NavigationDecision.navigate;
//               }
//             } else {
//               return NavigationDecision.navigate;
//             }
//           },
//         ),
//       );
//     } else {
//       return Container(height: 0);
//     }
//   }
// });

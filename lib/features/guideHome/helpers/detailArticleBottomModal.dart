import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:peepl/models/articles/blogArticle.dart';
import 'package:share_plus/share_plus.dart';

// Widget detailedBlogArticleView(
//     BuildContext context, BlogArticle articleData, List<String> images) {}

// onPressed: () => {Share.share(articleData.postURL)},

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
  List<String> _images = [
    "https://www.reuters.com/resizer/2FSUCYV7sQyThNN4skKe45ZGJ-w=/1200x628/smart/filters:quality(80)/cloudfront-us-east-2.images.arcpublishing.com/reuters/BI3AUAEKOFM6TLZX7G3SXOLLXA.jpg",
    "https://images2.markets.businessinsider.com/6126706ea86463001841ef9a?format=jpeg",
    "https://s.hdnux.com/photos/01/22/61/74/21700373/3/rawImage.jpg",
  ];
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (timer) async {
      if (mounted) {
        setState(() {
          if (_currentIndex + 1 == _images.length) {
            _currentIndex = 0;
          } else {
            _currentIndex = _currentIndex + 1;
          }
        });
      }
    });
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
                child: CachedNetworkImage(
                  fadeInDuration: Duration(seconds: 1),
                  fadeOutCurve: Curves.easeOutQuad,
                  fadeOutDuration: Duration(seconds: 1),
                  imageUrl: _images[_currentIndex],
                  fit: BoxFit.cover,
                ),
                // child: AnimatedSwitcher(
                //   duration: Duration(milliseconds: 1000),
                //   transitionBuilder:
                //       (Widget child, Animation<double> animation) {
                //     return FadeTransition(child: child, opacity: animation);
                //   },
                //   child: CachedNetworkImage(
                //     imageUrl:
                //         "https://s.hdnux.com/photos/01/22/61/74/21700373/3/rawImage.jpg",
                //     fit: BoxFit.cover,
                //   ),
                // ),
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
                        Text("36 min ago")
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua." +
                          "Tempor orci dapibus ultrices in iaculis nunc sed augue lacus. Venenatis cras sed felis eget. " +
                          "Adipiscing vitae proin sagittis nisl rhoncus. Sagittis orci a scelerisque purus semper. " +
                          "Non quam lacus suspendisse faucibus interdum posuere lorem.",
                      style: TextStyle(fontSize: 18.0),
                    )
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

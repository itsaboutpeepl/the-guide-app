import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:guide_liverpool/features/guideHome/helpers/UrlLaunch.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:guide_liverpool/models/articles/blogArticle.dart';
import 'package:share_plus/share_plus.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
                        Text("36 min ago")
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Html(data: widget.articleData.content),
                    // Text(
                    //   parseHtmlString(widget.articleData.content),
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

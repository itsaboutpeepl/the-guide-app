import 'package:flutter/material.dart';
import 'package:guide_liverpool/features/guideHome/helpers/detailArticleBottomModal.dart';
import 'package:guide_liverpool/models/articles/blogArticle.dart';

class PagedViewDetailArticle extends StatefulWidget {
  const PagedViewDetailArticle(
      {Key? key, required this.listOfArticles, required this.currentIndex})
      : super(key: key);

  final List<BlogArticle> listOfArticles;
  final int currentIndex;

  @override
  _PagedViewDetailArticleState createState() => _PagedViewDetailArticleState();
}

class _PagedViewDetailArticleState extends State<PagedViewDetailArticle> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = new PageController(initialPage: widget.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemBuilder: (context, index) =>
          DetailArticleBottomModel(articleData: widget.listOfArticles[index]),
      itemCount: widget.listOfArticles.length,
      controller: _pageController,
    );
  }
}

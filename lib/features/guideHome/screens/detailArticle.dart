import 'package:flutter/material.dart';
import 'package:peepl/models/articles/blogArticle.dart';

class DetailBlogArticle extends StatefulWidget {
  const DetailBlogArticle({Key? key, required this.blogArticle})
      : super(key: key);
  final BlogArticle blogArticle;

  @override
  _DetailBlogArticleState createState() => _DetailBlogArticleState();
}

class _DetailBlogArticleState extends State<DetailBlogArticle> {
  ScrollController? _scrollController;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverAppBar(
          actions: [
            IconButton(onPressed: () => {}, icon: Icon(Icons.share, size: 25.0))
          ],
          backgroundColor: Colors.transparent,
          expandedHeight: MediaQuery.of(context).size.height * 0.3,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(
              widget.blogArticle.imageURL,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverPadding(
          sliver: ArticleBody(context, widget.blogArticle),
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        )
      ],
    );
  }
}

Widget ArticleBody(BuildContext context, BlogArticle articleData) {
  return SliverToBoxAdapter(
      child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        articleData.title,
        style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w900),
      ),
      SizedBox(
        height: 5,
      ),
      Row(
        children: [
          Text(articleData.category[0]),
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
  ));
}

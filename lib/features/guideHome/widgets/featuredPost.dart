import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:peepl/features/guideHome/helpers/detailArticleBottomModal.dart';
import 'package:peepl/models/app_state.dart';
import 'package:peepl/redux/viewsmodels/featuredPost.dart';

class FeaturedPost extends StatefulWidget {
  const FeaturedPost({Key? key}) : super(key: key);

  @override
  _FeaturedPostState createState() => _FeaturedPostState();
}

class _FeaturedPostState extends State<FeaturedPost> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, FeaturedPostViewModel>(
      distinct: true,
      converter: FeaturedPostViewModel.fromStore,
      builder: (_, viewmodel) => featuredPost(_, viewmodel),
    );
  }
}

Widget featuredPost(BuildContext context, FeaturedPostViewModel viewModel) {
  return SliverPadding(
    padding: EdgeInsets.all(15),
    sliver: SliverToBoxAdapter(
      child: InkWell(
        onTap: () => {
          // context.router
          //     .push(DetailBlogArticle(blogArticle: viewModel.blogArticle))
          showBarModalBottomSheet(
            context: context,
            builder: (context) =>
                DetailArticleBottomModel(articleData: viewModel.blogArticle),
          )
        },
        child: Card(
          color: Colors.grey[100],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: Image.network(
                  viewModel.blogArticle.imageURL,
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  viewModel.blogArticle.title,
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 23),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: Row(
                  children: [
                    Text(viewModel.blogArticle.category[0]),
                    Icon(
                      Icons.circle,
                      size: 6,
                      color: Colors.grey[500],
                    ),
                    Text(
                      " 3 min ago",
                      style: TextStyle(color: Colors.grey[500]),
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "Liverpool City Council’s culture and development leads have welcomed the first significant, direct DCMS capital investment in Liverpool for ten years.",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    ),
  );
}

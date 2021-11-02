import 'package:flutter/material.dart';
import 'package:peepl/features/guideHome/widgets/tabbedCategoryView.dart';
import 'package:peepl/features/home/widgets/header.dart';
import 'package:peepl/features/shared/widgets/my_app_bar.dart';
import 'package:peepl/features/shared/widgets/silver_app_bar.dart';

class GuideHomeScreen extends StatefulWidget {
  const GuideHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<GuideHomeScreen> createState() => _GuideHomeScreenState();
}

class _GuideHomeScreenState extends State<GuideHomeScreen>
    with SingleTickerProviderStateMixin {
  ScrollController? _scrollController;
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        mySliverAppBar(context),
        SliverToBoxAdapter(
          child: featuredPost(context),
        ),
        SliverToBoxAdapter(
          child: recommendedArticlesHeader(context),
        ),
        SliverToBoxAdapter(
          child: recommendedArticleList(context),
        ),
        SliverPersistentHeader(
            delegate: SliverPersistentHeaderDelegateImpl(
          tabBar: TabBar(
            controller: _tabController,
            isScrollable: true,
            indicatorColor: Theme.of(context).colorScheme.primaryVariant,
            labelColor: Theme.of(context).colorScheme.primaryVariant,
            unselectedLabelColor: Colors.grey[400],
            labelStyle: TextStyle(fontWeight: FontWeight.w800),
            labelPadding: EdgeInsets.symmetric(horizontal: 15),
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(
                child: Text("Latest"),
              ),
              Tab(
                child: Text("Food & Drink"),
              ),
              Tab(
                child: Text("Culture"),
              ),
              Tab(
                child: Text("Family"),
              ),
              Tab(
                child: Text("Features"),
              )
            ],
          ),
        )),
        SliverToBoxAdapter(child: categoryTabBarView(context, _tabController)),
        SliverToBoxAdapter(
          child: watchAndEarnHeader(context),
        ),
        SliverToBoxAdapter(child: featuredVideosList(context))
      ],
    );
  }
}

Widget featuredArticleHeader(BuildContext context) {
  return Container(
    color: Colors.blue,
    child: Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Featured Article",
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
          ),
          SizedBox(
            height: 5,
          ),
          Divider(
            thickness: 3,
            endIndent: MediaQuery.of(context).size.width * 0.8,
            color: Theme.of(context).colorScheme.primaryVariant,
          )
        ],
      ),
    ),
  );
}

Widget featuredPost(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(15),
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
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: Image.network(
              "https://theguideliverpooldo.ams3.digitaloceanspaces.com/2021/10/image003-3.png",
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "City Council release statement following news that Liverpool is to be given £22m of Government funding",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 23),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: Row(
              children: [
                Text("Category "),
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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "Liverpool City Council’s culture and development leads have welcomed the first significant, direct DCMS capital investment in Liverpool for ten years.",
              style: TextStyle(fontSize: 15),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    ),
  );
}

Widget recommendedArticlesHeader(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Recommended Articles",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
        ),
        SizedBox(
          height: 5,
        ),
        Divider(
          thickness: 3,
          endIndent: MediaQuery.of(context).size.width * 0.8,
          color: Theme.of(context).colorScheme.primaryVariant,
        )
      ],
    ),
  );
}

Widget singleRecommendedArticle(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.9,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Image.network(
              "https://theguideliverpooldo.ams3.digitaloceanspaces.com/2021/10/image003-3.png",
            ),
          ),
          SizedBox(height: 10),
          Text(
            "City Council release statement following news that Liverpool is to be given £22m of Government funding",
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Text("Category "),
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
        ],
      ),
    ),
  );
}

Widget recommendedArticleList(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.42,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        singleRecommendedArticle(context),
        singleRecommendedArticle(context),
      ],
    ),
  );
}

// Widget tabbedCategoryView(BuildContext context) {
//   return DefaultTabController(
//     length: 5,
//     child: Column(
//       mainAxisSize: MainAxisSize.min,
//       children: <Widget>[
//         SizedBox(
//           height: 5.0,
//         ),
//         Container(
//           child: TabBar(
//             isScrollable: true,
//             indicatorColor: Theme.of(context).colorScheme.primaryVariant,
//             labelColor: Theme.of(context).colorScheme.primaryVariant,
//             unselectedLabelColor: Colors.grey[400],
//             labelStyle: TextStyle(fontWeight: FontWeight.w800),
//             labelPadding: EdgeInsets.symmetric(horizontal: 15),
//             indicatorSize: TabBarIndicatorSize.label,
//             tabs: [
//               Tab(
//                 child: Text("Latest"),
//               ),
//               Tab(
//                 child: Text("Food & Drink"),
//               ),
//               Tab(
//                 child: Text("Culture"),
//               ),
//               Tab(
//                 child: Text("Family"),
//               ),
//               Tab(
//                 child: Text("Features"),
//               )
//             ],
//           ),
//         ),
//         Expanded(
//           child: TabBarView(
//             children: [
//               categoryTabBarView(context),
//               categoryTabBarView(context),
//               categoryTabBarView(context),
//               categoryTabBarView(context),
//               categoryTabBarView(context),
//             ],
//           ),
//         )
//       ],
//     ),
//   );
// }

Widget categoryArticle(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.65,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "City Council release statement following news that Liverpool is to be given £22m of Government funding",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 17),
              ),
              SizedBox(height: 5),
              Text(
                "Going out as a group for a meal or drink for a special occasion is great, but sometimes you want somewhere that’s exclusively for you, your family and friends.",
              ),
            ],
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Image.network(
              "https://theguideliverpooldo.ams3.digitaloceanspaces.com/2021/10/image003-3.png",
            ),
          ),
        ),
      ],
    ),
  );
}

Widget categoryTabBarView(BuildContext context, TabController tabController) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 8),
    height: MediaQuery.of(context).size.height * 0.32,
    child: TabBarView(
      controller: tabController,
      children: [
        Column(
          children: [
            categoryArticle(context),
            categoryArticle(context),
          ],
        ),
        Column(
          children: [
            categoryArticle(context),
            categoryArticle(context),
          ],
        ),
        Column(
          children: [
            categoryArticle(context),
            categoryArticle(context),
          ],
        ),
        Column(
          children: [
            categoryArticle(context),
            categoryArticle(context),
          ],
        ),
        Column(
          children: [
            categoryArticle(context),
            categoryArticle(context),
          ],
        ),
      ],
    ),
  );
}

Widget watchAndEarnHeader(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Watch & Earn",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
        ),
        SizedBox(
          height: 5,
        ),
        Divider(
          thickness: 3,
          endIndent: MediaQuery.of(context).size.width * 0.8,
          color: Theme.of(context).colorScheme.primaryVariant,
        )
      ],
    ),
  );
}

Widget featuredVideo(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Image.network(
            "https://theguideliverpooldo.ams3.digitaloceanspaces.com/2021/10/image003-3.png",
            colorBlendMode: BlendMode.overlay,
          ),
        ),
        Positioned.fill(
          child: Container(
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black,
                ],
                stops: [0.4, 1.0],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Text(
                "City Council release statement following news that Liverpool is to be given £22m of Government funding",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 20),
              ),
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(100)),
              color: Colors.white,
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  Color.fromRGBO(235, 138, 64, 1),
                  Color.fromRGBO(215, 55, 48, 1),
                ],
                stops: [0.4, 1.0],
              ),
            ),
            child: Center(
              child: Text(
                "50",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 20),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget featuredVideosList(BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 20),
    height: MediaQuery.of(context).size.height * 0.4,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        featuredVideo(context),
        featuredVideo(context),
      ],
    ),
  );
}

SliverAppBar mySliverAppBar(BuildContext context) {
  return SliverAppBar(
    backgroundColor: Colors.transparent,
    floating: false,
    pinned: false,
    snap: false,
    centerTitle: false,
    expandedHeight: MediaQuery.of(context).size.height * 0.25,
    flexibleSpace: FlexibleSpaceBar(
      background: Header(),
      centerTitle: true,
      collapseMode: CollapseMode.parallax,
    ),
  );
}

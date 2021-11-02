import 'package:flutter/material.dart';
import 'package:peepl/features/guideHome/screens/guideHome.dart';

// class TabbedCategoryView extends StatefulWidget {
//   const TabbedCategoryView({Key? key}) : super(key: key);

//   @override
//   _TabbedCategoryViewState createState() => _TabbedCategoryViewState();
// }

// class _TabbedCategoryViewState extends State<TabbedCategoryView>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     _tabController = TabController(length: 5, vsync: this);
//     _tabController.addListener(() => setState(() {}));
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return NestedScrollView(
//       headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//         return <Widget>[
//           SliverPersistentHeader(
//               delegate: SliverPersistentHeaderDelegateImpl(
//             tabBar: TabBar(
//               controller: _tabController,
//               isScrollable: true,
//               indicatorColor: Theme.of(context).colorScheme.primaryVariant,
//               labelColor: Theme.of(context).colorScheme.primaryVariant,
//               unselectedLabelColor: Colors.grey[400],
//               labelStyle: TextStyle(fontWeight: FontWeight.w800),
//               labelPadding: EdgeInsets.symmetric(horizontal: 15),
//               indicatorSize: TabBarIndicatorSize.label,
//               tabs: [
//                 Tab(
//                   child: Text("Latest"),
//                 ),
//                 Tab(
//                   child: Text("Food & Drink"),
//                 ),
//                 Tab(
//                   child: Text("Culture"),
//                 ),
//                 Tab(
//                   child: Text("Family"),
//                 ),
//                 Tab(
//                   child: Text("Features"),
//                 )
//               ],
//             ),
//           ))
//         ];
//       },
//       body: TabBarView(
//         controller: _tabController,
//         children: [
//           // categoryTabBarView(context),
//           // categoryTabBarView(context),
//           // categoryTabBarView(context),
//           // categoryTabBarView(context),
//           // categoryTabBarView(context),
//         ],
//       ),
//     );
//   }
// }

class SliverPersistentHeaderDelegateImpl
    extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  final Color color;

  const SliverPersistentHeaderDelegateImpl({
    Color color = Colors.transparent,
    required this.tabBar,
  }) : this.color = color;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: color,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

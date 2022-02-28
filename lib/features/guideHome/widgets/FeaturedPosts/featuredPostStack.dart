import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guide_liverpool/features/guideHome/widgets/FeaturedPosts/featuredPost.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/redux/viewsmodels/featuredPostStack.dart';

class FeaturedPostStack extends StatefulWidget {
  @override
  _FeaturedPostStackState createState() => _FeaturedPostStackState();
}

class _FeaturedPostStackState extends State<FeaturedPostStack>
    with TickerProviderStateMixin {
  int currentIndex = 0;
  late AnimationController _animationController;
  late CurvedAnimation _curvedAnimation;
  late Animation<Offset> _translationAnim;
  late Animation<Offset> _moveAnim;
  late Animation<double> _scaleAnim;
  late TabController _tabController;

  List<FeaturedPost> _listOfPosts = [];

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(() => setState(() {}));
    super.initState();
    currentIndex = 0;
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 150),
    );
    _curvedAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeOut);

    _translationAnim = Tween(begin: Offset(0.0, 0.0), end: Offset(-1000.0, 0.0))
        .animate(_animationController)
      ..addListener(() {
        setState(() {});
      });

    _scaleAnim = Tween(begin: 0.965, end: 1.0).animate(_curvedAnimation);
    _moveAnim = Tween(begin: Offset(0.0, 0.05), end: Offset(0.0, 0.0))
        .animate(_curvedAnimation);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, FeaturedPostStackViewModel>(
      distinct: true,
      onInit: (store) => {
        store.state.homePageState.featuredPosts.forEach((element) {
          _listOfPosts.add(
            FeaturedPost(
              index: store.state.homePageState.featuredPosts.indexOf(element),
              listOfArticles: store.state.homePageState.featuredPosts,
            ),
          );
        })
      },
      converter: FeaturedPostStackViewModel.fromStore,
      builder: (_, viewmodel) => SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 15),
              child: Text(
                "The Latest News",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Divider(
                thickness: 3,
                endIndent: MediaQuery.of(context).size.width * 0.8,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Stack(
              clipBehavior: Clip.antiAlias,
              children: _listOfPosts.reversed.map(
                (featuredPost) {
                  if (_listOfPosts.indexOf(featuredPost) <= 3) {
                    return GestureDetector(
                      onHorizontalDragEnd: _horizontalDragEnd,
                      child: Transform.translate(
                        offset: _getFlickTransformOffset(featuredPost),
                        child: FractionalTranslation(
                          translation: _getStackedCardOffset(featuredPost),
                          child: Transform.scale(
                              scale: _getStackedCardScale(featuredPost),
                              child: featuredPost),
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Offset _getStackedCardOffset(FeaturedPost card) {
    int diff = card.index - currentIndex;
    if (card.index == currentIndex + 1) {
      return _moveAnim.value;
    } else if (diff > 0 && diff <= 2) {
      return Offset(0.0, 0.05 * diff);
    } else {
      return Offset(0.0, 0.0);
    }
  }

  double _getStackedCardScale(FeaturedPost card) {
    int diff = card.index - currentIndex;
    if (card.index == currentIndex) {
      return 1.0;
    } else if (card.index == currentIndex + 1) {
      return _scaleAnim.value;
    } else {
      return (1 - (0.035 * diff.abs()));
    }
  }

  Offset _getFlickTransformOffset(FeaturedPost card) {
    if (card.index == currentIndex) {
      return _translationAnim.value;
    }
    return Offset(0.0, 0.0);
  }

  void _horizontalDragEnd(DragEndDetails details) {
    if (details.primaryVelocity! < 0) {
      // Swiped Right to Left
      _animationController.forward().whenComplete(() {
        setState(() {
          _animationController.reset();
          FeaturedPost removedCard = _listOfPosts.removeAt(0);
          _listOfPosts.add(removedCard);
          currentIndex = _listOfPosts[0].index;
          // widget.onCardChanged(_listOfPosts[0]);
          setState(() {
            _listOfPosts[0];
          });
        });
      });
    }
  }
}

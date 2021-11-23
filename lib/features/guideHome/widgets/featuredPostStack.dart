import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peepl/features/guideHome/widgets/featuredPost.dart';
import 'package:peepl/models/app_state.dart';
import 'package:peepl/redux/viewsmodels/featuredPostStack.dart';

class FeaturedPostStack extends StatefulWidget {
  final Function onCardChanged;

  FeaturedPostStack({required this.onCardChanged});
  @override
  _FeaturedPostStackState createState() => _FeaturedPostStackState();
}

class _FeaturedPostStackState extends State<FeaturedPostStack>
    with SingleTickerProviderStateMixin {
  // var cards = [
  //   FeaturedPost(index: 0),
  //   FeaturedPost(index: 1),
  //   FeaturedPost(index: 2),
  // ];

  int currentIndex = 0;
  late AnimationController controller;
  late CurvedAnimation curvedAnimation;
  late Animation<Offset> _translationAnim;
  late Animation<Offset> _moveAnim;
  late Animation<double> _scaleAnim;

  List<FeaturedPost> _listOfPosts = [];

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 150),
    );
    curvedAnimation =
        CurvedAnimation(parent: controller, curve: Curves.easeOut);

    _translationAnim = Tween(begin: Offset(0.0, 0.0), end: Offset(-1000.0, 0.0))
        .animate(controller)
      ..addListener(() {
        setState(() {});
      });

    _scaleAnim = Tween(begin: 0.965, end: 1.0).animate(curvedAnimation);
    _moveAnim = Tween(begin: Offset(0.0, 0.05), end: Offset(0.0, 0.0))
        .animate(curvedAnimation);
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
                article: element),
          );
        })
      },
      converter: FeaturedPostStackViewModel.fromStore,
      builder: (_, viewmodel) => SliverToBoxAdapter(
        child: Stack(
            clipBehavior: Clip.antiAlias,
            children: _listOfPosts.reversed.map((featuredPost) {
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
            }).toList()),
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
      controller.forward().whenComplete(() {
        setState(() {
          controller.reset();
          FeaturedPost removedCard = _listOfPosts.removeAt(0);
          _listOfPosts.add(removedCard);
          currentIndex = _listOfPosts[0].index;
          widget.onCardChanged(_listOfPosts[0]);
        });
      });
    }
  }
}

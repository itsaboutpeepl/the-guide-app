import 'package:flutter/material.dart';
import 'package:peepl/features/onboard/widegts/flare_controller.dart';
import 'package:peepl/features/onboard/widegts/on_boarding_page.dart';
import 'package:peepl/features/onboard/widegts/sign_up_buttons.dart';
import 'package:peepl/generated/l10n.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardScreen extends StatefulWidget {
  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen>
    with TickerProviderStateMixin {
  late PageController _pageController;
  static const _kDuration = Duration(milliseconds: 2000);
  static const _kCurve = Curves.ease;
  late HouseController _slideController;
  late ValueNotifier<double> notifier;
  double page = 0;
  int cont = 0;
  bool animate = false;

  void _onScroll() {
    _slideController.rooms = _pageController.page!;
  }

  @override
  void initState() {
    super.initState();
    _slideController = HouseController(onUpdated: _update);
    _pageController = PageController(
      initialPage: 0,
    )..addListener(_onScroll);
  }

  _update() => setState(() {});

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void gotoPage(page) {
    _pageController.animateToPage(
      page,
      duration: _kDuration,
      curve: _kCurve,
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> welcomeScreens = [
      WelcomeFrame(
        I10n.of(context).simple,
        I10n.of(context).intro_text_one,
        '1-cake.png',
      ),
      WelcomeFrame(
        I10n.of(context).useful,
        I10n.of(context).intro_text_two,
        '2-rewards.png',
      ),
      WelcomeFrame(
        I10n.of(context).smart,
        I10n.of(context).intro_text_three,
        '3-wallet.png',
      ),
      // WelcomeFrame(
      //   "Top up. Pay. Enjoy.",
      //   "We’re bringing people and restaurants together, over the food we all love. Thank you for joining us at the start of our journey!",
      //   '4-enjoy.png',
      // ),
      SignUpButtons()
    ];
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 20,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Stack(
                        children: <Widget>[
                          PageView.builder(
                            physics: AlwaysScrollableScrollPhysics(),
                            itemCount: welcomeScreens.length,
                            controller: _pageController,
                            itemBuilder: (BuildContext context, int index) =>
                                welcomeScreens[index % welcomeScreens.length],
                          ),
                          Positioned(
                            bottom: 15.0,
                            left: 0.0,
                            right: 0.0,
                            child: Container(
                              padding: EdgeInsets.all(20.0),
                              child: Center(
                                child: SmoothPageIndicator(
                                  controller: _pageController,
                                  count: welcomeScreens.length,
                                  effect: JumpingDotEffect(
                                    dotWidth: 9.0,
                                    dotHeight: 9.0,
                                    activeDotColor: Color(0xFF696B6D),
                                  ),
                                  onDotClicked: gotoPage,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

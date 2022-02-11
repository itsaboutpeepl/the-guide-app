import 'package:flutter/material.dart';
import 'package:guide_liverpool/features/onboard/widegts/flare_controller.dart';
import 'package:guide_liverpool/features/onboard/widegts/on_boarding_page.dart';
import 'package:guide_liverpool/features/onboard/widegts/sign_up_buttons.dart';
import 'package:guide_liverpool/features/screens/OnBoardingScreens/firstScreen.dart';
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
      FirstScreen(),
      WelcomeFrame(
        "The Latest Stories",
        "from Liverpool City Region",
        'onboarding-1.png',
      ),
      WelcomeFrame(
        "The Hottest Events",
        "Keep up with the latest events happening in our city",
        'onboarding-2.png',
      ),
      WelcomeFrame(
        "The Hottest New Places",
        "Check out our recommendations on what to explore",
        'onboarding-3.png',
      ),
      WelcomeFrame(
        "Watch, Learn, and Earn",
        "Enjoy our videos and get rewarded in Peepl Tokens for watching.",
        'onboarding-4.png',
      ),
      WelcomeFrame(
        "We aren’t just another news app",
        "We reward you for keeping up to date with what’s happening in the city.",
        'onboarding-5.png',
      ),
      WelcomeFrame(
        "A Rewarding Experience",
        "We’ve partnered with Peepl to allow you to spend rewards on sustainable, local businesses",
        'onboarding-6.png',
      ),
      SignUpButtons()
    ];
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 20,
              child: Container(
                color: Color(0xFF011C35),
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

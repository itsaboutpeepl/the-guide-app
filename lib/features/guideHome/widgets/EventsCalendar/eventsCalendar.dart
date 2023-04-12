import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guide_liverpool/common/router/routes.gr.dart';
import 'package:guide_liverpool/features/guideHome/widgets/EventsCalendar/singleEventItem.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/redux/viewsmodels/eventsCalendar.dart';

class EventCalendar extends StatefulWidget {
  const EventCalendar({Key? key}) : super(key: key);

  @override
  _EventCalendarState createState() => _EventCalendarState();
}

class _EventCalendarState extends State<EventCalendar> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    _pageController = new PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, EventsCalendarViewModel>(
      distinct: true,
      converter: EventsCalendarViewModel.fromStore,
      builder: (_, viewmodel) {
        return SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          sliver: SliverToBoxAdapter(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Upcoming Events",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      print(context.router.stack);
                      print(context.router.currentPath);
                      context.router.navigate(EventsRoute());
                    },
                    child: const Text(
                      'View All',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                  )
                ],
              ),
              Divider(
                thickness: 3,
                endIndent: MediaQuery.of(context).size.width * 0.8,
                color: Theme.of(context).colorScheme.primary,
              ),
              Card(
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      height: MediaQuery.of(context).size.height * 0.24,
                      left: 6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _buildPageIndicator(8),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.24,
                      child: PageView.builder(
                        onPageChanged: (page) => setState(() {
                          _currentIndex = page;
                        }),
                        controller: _pageController,
                        scrollDirection: Axis.vertical,
                        physics: PageScrollPhysics(),
                        itemBuilder: (context, index) => SingleEventItem(
                          eventItem: viewmodel.eventsList[index],
                        ),
                        itemCount: 8,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
        );
      },
    );
  }

  Widget _indicator(bool isActive) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      height: 8,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        margin: EdgeInsets.symmetric(horizontal: 4.0),
        height: isActive ? 8 : 6.0,
        width: isActive ? 10 : 6.0,
        decoration: BoxDecoration(
          boxShadow: [
            isActive
                ? BoxShadow(
                    color: Color(0XFF2FB7B2).withOpacity(0.72),
                    blurRadius: 4.0,
                    spreadRadius: 1.0,
                    offset: Offset(
                      0.0,
                      0.0,
                    ),
                  )
                : BoxShadow(
                    color: Colors.transparent,
                  )
          ],
          shape: BoxShape.circle,
          color: isActive ? Colors.white : Colors.grey[700],
        ),
      ),
    );
  }

  List<Widget> _buildPageIndicator(int listLength) {
    List<Widget> list = [];
    for (int i = 0; i < listLength; i++) {
      list.add(i == _currentIndex ? _indicator(true) : _indicator(false));
    }
    return list;
  }
}

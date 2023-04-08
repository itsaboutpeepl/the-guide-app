import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guide_liverpool/common/router/routes.dart';
import 'package:guide_liverpool/models/app_state.dart';

class CreateAccountAppBar extends StatefulWidget {
  const CreateAccountAppBar({Key? key}) : super(key: key);

  @override
  State<CreateAccountAppBar> createState() => _CreateAccountAppBarState();
}

class _CreateAccountAppBarState extends State<CreateAccountAppBar> {
  bool _isNoAcc = false;
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, void>(
      converter: (store) {
        _isNoAcc = store.state.userState.walletAddress.isEmpty;
      },
      builder: (_, viewmodel) {
        return _isNoAcc
            ? SliverPadding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 10,
                ),
                sliver: SliverToBoxAdapter(
                  child: GestureDetector(
                    onTap: () => context.router.navigate(OnboardRoute()),
                    child: Card(
                      color: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "You're browsing The Guide in preview mode",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Create an account and start earning rewards to spend at the best local independents",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}

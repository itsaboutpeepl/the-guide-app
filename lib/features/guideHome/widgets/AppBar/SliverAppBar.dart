import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guide_liverpool/features/home/widgets/header.dart';
import 'package:guide_liverpool/models/app_state.dart';

class MySliverAppBar extends StatefulWidget {
  const MySliverAppBar({Key? key}) : super(key: key);

  @override
  State<MySliverAppBar> createState() => _MySliverAppBarState();
}

class _MySliverAppBarState extends State<MySliverAppBar> {
  bool _isAnon = false;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, void>(
      converter: (store) {
        _isAnon = store.state.userState.walletAddress.isEmpty;
      },
      builder: (_, vm) {
        return SliverAppBar(
          backgroundColor: Colors.transparent,
          floating: false,
          pinned: false,
          snap: false,
          centerTitle: false,
          expandedHeight:
              _isAnon ? MediaQuery.of(context).size.height * 0.15 : MediaQuery.of(context).size.height * 0.22,
          flexibleSpace: FlexibleSpaceBar(
            background: Header(),
            centerTitle: true,
            collapseMode: CollapseMode.parallax,
          ),
        );
      },
    );
  }
}

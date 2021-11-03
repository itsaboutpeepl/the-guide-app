import 'package:flutter/material.dart';
import 'package:peepl/features/home/widgets/header.dart';

class MySliverAppBar extends StatelessWidget {
  const MySliverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      floating: false,
      pinned: false,
      snap: false,
      centerTitle: false,
      expandedHeight: MediaQuery.of(context).size.height * 0.18,
      flexibleSpace: FlexibleSpaceBar(
        background: Header(),
        centerTitle: true,
        collapseMode: CollapseMode.parallax,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peepl/features/guideHome/widgets/FeaturedDirectory/singleDirectoryItem.dart';
import 'package:peepl/models/app_state.dart';
import 'package:peepl/redux/viewsmodels/directory.dart';

class FeaturedDirectory extends StatefulWidget {
  const FeaturedDirectory({Key? key}) : super(key: key);

  @override
  _FeaturedDirectoryState createState() => _FeaturedDirectoryState();
}

class _FeaturedDirectoryState extends State<FeaturedDirectory> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, DirectoryViewModel>(
      distinct: true,
      converter: DirectoryViewModel.fromStore,
      builder: (_, viewmodel) {
        return SliverPadding(
          padding: EdgeInsets.only(top: 15, left: 15, right: 15),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "The Hottest Places",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  thickness: 3,
                  endIndent: MediaQuery.of(context).size.width * 0.8,
                  color: Theme.of(context).colorScheme.primaryVariant,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: MediaQuery.of(context).size.height * 0.33,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) => SingleDirectoryItem(
                            directoryItem: viewmodel.directoryList[index],
                          ),
                      separatorBuilder: (_, index) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10)),
                      itemCount: viewmodel.directoryList.length),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

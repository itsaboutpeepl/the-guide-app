import 'package:flutter/material.dart';
import 'package:peepl/features/guideHome/widgets/singleDirectoryItem.dart';

class FeaturedBusinesses extends StatefulWidget {
  const FeaturedBusinesses({Key? key}) : super(key: key);

  @override
  _FeaturedBusinessesState createState() => _FeaturedBusinessesState();
}

class _FeaturedBusinessesState extends State<FeaturedBusinesses> {
  @override
  Widget build(BuildContext context) {
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
                  itemBuilder: (_, index) => SingleDirectoryItem(),
                  separatorBuilder: (_, index) =>
                      Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                  itemCount: 2),
            )
          ],
        ),
      ),
    );
  }
}

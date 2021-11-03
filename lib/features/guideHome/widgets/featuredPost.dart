import 'package:flutter/material.dart';

class FeaturedPost extends StatefulWidget {
  const FeaturedPost({Key? key}) : super(key: key);

  @override
  _FeaturedPostState createState() => _FeaturedPostState();
}

class _FeaturedPostState extends State<FeaturedPost> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(15),
      sliver: SliverToBoxAdapter(
        child: Card(
          color: Colors.grey[100],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: Image.network(
                  "https://theguideliverpooldo.ams3.digitaloceanspaces.com/2021/10/image003-3.png",
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "City Council release statement following news that Liverpool is to be given £22m of Government funding",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 23),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: Row(
                  children: [
                    Text("Category "),
                    Icon(
                      Icons.circle,
                      size: 6,
                      color: Colors.grey[500],
                    ),
                    Text(
                      " 3 min ago",
                      style: TextStyle(color: Colors.grey[500]),
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "Liverpool City Council’s culture and development leads have welcomed the first significant, direct DCMS capital investment in Liverpool for ten years.",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SingleRecommendedArticle extends StatelessWidget {
  const SingleRecommendedArticle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.92,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Image.network(
              "https://theguideliverpooldo.ams3.digitaloceanspaces.com/2021/10/image003-3.png",
            ),
          ),
          SizedBox(height: 10),
          Text(
            "City Council release statement following news that Liverpool is to be given £22m of Government funding",
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
          ),
          SizedBox(height: 5),
          Row(
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
        ],
      ),
    );
  }
}

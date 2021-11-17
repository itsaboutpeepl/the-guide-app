import 'package:flutter/material.dart';
import 'package:peepl/features/guideHome/helpers/UrlLaunch.dart';

class SingleDirectoryItem extends StatefulWidget {
  const SingleDirectoryItem({Key? key}) : super(key: key);

  @override
  _SingleDirectoryItemState createState() => _SingleDirectoryItemState();
}

class _SingleDirectoryItemState extends State<SingleDirectoryItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {UrlLaunch.openMap(53.40232093140704, -2.9833307421239623)},
      child: SizedBox(
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image.network(
                    mapPreviewImage(
                        latitude: 53.40232093140704,
                        longitude: -2.9833307421239623),
                    fit: BoxFit.cover,
                  )),
            ),
            Positioned.fill(
              child: Container(
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                  gradient: LinearGradient(
                    begin: FractionalOffset.centerLeft,
                    end: FractionalOffset.centerRight,
                    colors: [
                      Color(0xDD071A34),
                      Colors.transparent,
                    ],
                    stops: [0.1, 1],
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.only(left: 25, bottom: 25, top: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        alignment: Alignment.topLeft,
                        icon: Icon(
                          Icons.launch,
                          color: Colors.white,
                        ),
                        onPressed: () => {
                          UrlLaunch.launchURL(
                              "https://www.entrybarliverpool.co.uk/")
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Seel Street, Liverpool, UK",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[200],
                          ),
                        )
                      ],
                    ),
                    Text(
                      "Entry Bar",
                      style: TextStyle(
                        color: Colors.grey[200],
                        fontWeight: FontWeight.w900,
                        fontSize: 34,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 25,
              left: 25,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}

//TODO: Change API key, this is a personal Key!
String mapPreviewImage({required double latitude, required double longitude}) {
  return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=14&size=1000x500&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=AIzaSyDaInwx4OK0CQ2G3dEQ5BLq4QU7W3-H6w8&style=feature:|element:|visibility:simplified';
}

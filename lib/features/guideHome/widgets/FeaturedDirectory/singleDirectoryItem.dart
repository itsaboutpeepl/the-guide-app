import 'package:flutter/material.dart';
import 'package:guide_liverpool/features/guideHome/helpers/UrlLaunch.dart';
import 'package:guide_liverpool/models/articles/directory.dart';

class SingleDirectoryItem extends StatefulWidget {
  final Directory directoryItem;
  const SingleDirectoryItem({Key? key, required this.directoryItem})
      : super(key: key);

  @override
  _SingleDirectoryItemState createState() => _SingleDirectoryItemState();
}

class _SingleDirectoryItemState extends State<SingleDirectoryItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: GestureDetector(
        onTap: () => {
          UrlLaunch.openMap(
            double.parse(widget.directoryItem.latitude),
            double.parse(widget.directoryItem.longitude),
          ),
        },
        child: SizedBox(
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image.network(
                    widget.directoryItem.imageURL,
                    // mapPreviewImage(
                    //   latitude: double.parse(widget.directoryItem.latitude),
                    //   longitude: double.parse(widget.directoryItem.longitude),
                    // ),
                    fit: BoxFit.cover,
                  ),
                ),
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
                              "https://www.entrybarliverpool.co.uk/",
                            )
                          },
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            widget.directoryItem.address,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[200],
                            ),
                          )
                        ],
                      ),
                      Text(
                        widget.directoryItem.title,
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
            ],
          ),
        ),
      ),
    );
  }
}

//TODO: Change API key, this is a personal Key!
String mapPreviewImage({required double latitude, required double longitude}) {
  return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=14&size=1000x500&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=AIzaSyDaInwx4OK0CQ2G3dEQ5BLq4QU7W3-H6w8&style=feature:|element:|visibility:simplified';
}

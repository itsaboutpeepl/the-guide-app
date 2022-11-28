import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
        onTap: () => UrlLaunch.launchURL(widget.directoryItem.guideWebLink),
        child: SizedBox(
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image(
                    image: CachedNetworkImageProvider(
                      widget.directoryItem.imageURL,
                    ),
                    fit: BoxFit.cover,
                  ),
                  // child: Image.network(
                  //   widget.directoryItem.imageURL,
                  //   // mapPreviewImage(
                  //   //   latitude: double.parse(widget.directoryItem.latitude),
                  //   //   longitude: double.parse(widget.directoryItem.longitude),
                  //   // ),
                  //   fit: BoxFit.fill,
                  //),
                ),
              ),
              Positioned.fill(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                    gradient: LinearGradient(
                      begin: FractionalOffset.bottomCenter,
                      end: FractionalOffset.topCenter,
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
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            widget.directoryItem.website != ""
                                ? IconButton(
                                    padding: EdgeInsets.zero,
                                    alignment: Alignment.topLeft,
                                    icon: Icon(
                                      Icons.launch,
                                      color: Colors.white,
                                    ),
                                    onPressed: () => {
                                      UrlLaunch.launchURL(
                                        widget.directoryItem.website,
                                      )
                                    },
                                  )
                                : SizedBox.shrink(),
                            widget.directoryItem.facebookLink != ""
                                ? IconButton(
                                    padding: EdgeInsets.zero,
                                    alignment: Alignment.topLeft,
                                    icon: Icon(
                                      FaIcon(FontAwesomeIcons.squareFacebook)
                                          .icon,
                                      color: Colors.white,
                                    ),
                                    onPressed: () => {
                                      UrlLaunch.launchURL(
                                        widget.directoryItem.facebookLink,
                                      )
                                    },
                                  )
                                : SizedBox.shrink(),
                            widget.directoryItem.twitterLink != ""
                                ? IconButton(
                                    padding: EdgeInsets.zero,
                                    alignment: Alignment.topLeft,
                                    icon: Icon(
                                      FaIcon(FontAwesomeIcons.twitter).icon,
                                      color: Colors.white,
                                    ),
                                    onPressed: () => {
                                      UrlLaunch.launchURL(
                                        widget.directoryItem.twitterLink,
                                      )
                                    },
                                  )
                                : SizedBox.shrink(),
                            widget.directoryItem.instaLink != ""
                                ? IconButton(
                                    padding: EdgeInsets.zero,
                                    alignment: Alignment.topLeft,
                                    icon: Icon(
                                      FaIcon(FontAwesomeIcons.instagram).icon,
                                      color: Colors.white,
                                    ),
                                    onPressed: () => {
                                      UrlLaunch.launchURL(
                                        widget.directoryItem.instaLink,
                                      )
                                    },
                                  )
                                : SizedBox.shrink(),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Text(
                              widget.directoryItem.address,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[200],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        widget.directoryItem.title,
                        style: TextStyle(
                          color: Colors.grey[200],
                          fontWeight: FontWeight.w900,
                          fontSize: 28,
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

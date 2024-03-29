import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guide_liverpool/common/router/routes.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/redux/viewsmodels/account.dart';
import 'package:guide_liverpool/utils/format.dart';
import 'package:guide_liverpool/features/shared/widgets/snackbars.dart';
import 'package:guide_liverpool/utils/peepl_icons_icons.dart';

class Avatar extends StatelessWidget {
  const Avatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AccountViewModel>(
      distinct: true,
      converter: AccountViewModel.fromStore,
      builder: (_, viewmodel) {
        return Padding(
          padding: EdgeInsets.only(
            top: 20,
          ),
          child: InkWell(
            onTap: () {
              context.router.push(ProfileRoute());
            },
            child: Column(
              children: [
                if (viewmodel.avatarUrl == '')
                  const CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/images/anom.png',
                    ),
                    radius: 40,
                  )
                else
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      color: Colors.grey[400],
                      child: CachedNetworkImage(
                        width: 60,
                        height: 60,
                        imageUrl: viewmodel.avatarUrl,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => CircleAvatar(
                          backgroundImage: AssetImage('assets/images/anom.png'),
                          radius: 30,
                        ),
                        imageBuilder: (context, imageProvider) => Image(
                          image: imageProvider,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      viewmodel.displayName,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 2),
                    Icon(
                      Icons.edit,
                      size: 20,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Container(
                        width: MediaQuery.of(context).size.width * .9,
                        height: MediaQuery.of(context).size.height * .06,
                        child: TextButton(
                          onPressed: () {
                            Clipboard.setData(
                              ClipboardData(text: viewmodel.walletAddress),
                            );
                            showCopiedFlushbar(context);
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.all(15.0),
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  12.0,
                                ),
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SvgPicture.asset(
                                'assets/images/copy.svg',
                                width: 16,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                child: AutoSizeText(
                                  Formatter.formatEthAddress(
                                      viewmodel.walletAddress, 20),
                                  style: TextStyle(
                                    letterSpacing: 0.3,
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                  ),
                                  maxLines: 1,
                                  presetFontSizes: [
                                    16,
                                    15,
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5.0),
                    Flexible(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 9,
                        height: MediaQuery.of(context).size.height * .06,
                        child: TextButton(
                          onPressed: () {},
                          // showDialog(
                          //   context: context,
                          //   builder: (BuildContext context) => ReceiveDialog(
                          //     'fuse:${viewmodel.walletAddress}',
                          //   ),
                          // );
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.all(15.0),
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  12.0,
                                ),
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                PeeplIcons.ppl_circles_02,
                                color: Color(0xFFFF344D),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                child: AutoSizeText(
                                  "Token Vesting",
                                  style: TextStyle(
                                    letterSpacing: 0.3,
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                  ),
                                  maxLines: 1,
                                  presetFontSizes: [
                                    16,
                                    15,
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

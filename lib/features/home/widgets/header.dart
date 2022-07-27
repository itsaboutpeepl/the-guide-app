import 'package:flutter/material.dart';
import 'package:guide_liverpool/features/home/widgets/balance.dart';
// import 'package:guide_liverpool/features/shared/widgets/barcode_scanner.dart';
import 'package:guide_liverpool/generated/l10n.dart';
import 'package:guide_liverpool/redux/viewsmodels/header.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, HeaderViewModel>(
      distinct: true,
      converter: HeaderViewModel.fromStore,
      builder: (_, viewModel) {
        return Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryVariant,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Flexible(
                child: viewModel.firstName() == "Anom"
                    ? Text.rich(
                        TextSpan(
                          text: "Welcome to \n",
                          children: [
                            TextSpan(
                              text: "The Guide Liverpool",
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                        style: TextStyle(
                          color: Theme.of(context).canvasColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w200,
                        ),
                      )
                    : Text(
                        '${I10n.of(context).hi} ${viewModel.firstName()}',
                        style: TextStyle(
                          color: Theme.of(context).canvasColor,
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
              ),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      child: viewModel.firstName() == "Anom" ? SizedBox.shrink() : Balance(),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

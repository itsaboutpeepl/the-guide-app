import 'package:auto_route/auto_route.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/redux/viewsmodels/network_screen.dart';
import 'package:marketing_cards/marketing_cards.dart';

@RoutePage()
class NetworkPage extends StatelessWidget {
  const NetworkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, NetworkScreenViewModel>(
      distinct: true,
      converter: NetworkScreenViewModel.fromStore,
      onInit: (store) {},
      builder: (_, viewmodel) => MarketingCards(
        appName: 'The Guide',
        onBack: () {
          context.router.back();
        },
        onPayClick: (productId) => viewmodel.onPayClick(productId, context),
        pplBalance: viewmodel.pplBalance,
      ),
    );
  }
}

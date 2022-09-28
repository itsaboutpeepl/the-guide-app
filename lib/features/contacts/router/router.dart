import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:guide_liverpool/common/router/route_guards.dart';
import 'package:guide_liverpool/features/contacts/screens/contacts_list.dart';
import 'package:guide_liverpool/features/contacts/screens/send_amount.dart';
import 'package:guide_liverpool/features/contacts/screens/send_review.dart';
import 'package:guide_liverpool/features/contacts/screens/send_success.dart';

const contactsTab = AutoRoute(
  path: 'contacts',
  name: 'contactsTab',
  page: EmptyRouterPage,
  guards: [AuthGuard],
  children: [
    AutoRoute(
      initial: true,
      page: ContactsList,
      name: 'contactsList',
      guards: [AuthGuard],
    ),
    AutoRoute(
      path: 'send-amount',
      page: SendAmountScreen,
      guards: [AuthGuard],
    ),
    AutoRoute(
      path: 'send-review',
      page: SendReviewScreen,
      guards: [AuthGuard],
    ),
    AutoRoute(
      path: 'send-success',
      page: SendSuccessScreen,
      guards: [AuthGuard],
    ),
  ],
);

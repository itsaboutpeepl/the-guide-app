import 'package:peepl/redux/actions/user_actions.dart';

import '../../models/peepl_pay.dart';

List<PeeplPay> peeplpaysReducer(List<PeeplPay> peeplpay, dynamic action) {
  if (action is GetUserCartItems) {
    return action.peeplpay;
  }
  return peeplpay;
}

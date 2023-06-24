// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:charge_wallet_sdk/charge_wallet_sdk.dart';
import 'package:flutter/material.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux/redux.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:guide_liverpool/common/di/di.dart';
import 'package:guide_liverpool/features/shared/payment/paymentSheet.dart';
import 'package:guide_liverpool/features/topup/dialogs/processing_payment.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/services.dart';
import 'package:guide_liverpool/utils/constants.dart';
import 'package:guide_liverpool/utils/log/log.dart';

// class UpdateFeaturedVideos {
//   UpdateFeaturedVideos({required this.featuredVideos});
//   final List<VideoArticle> featuredVideos;
// }

class ClearCart {
  ClearCart();

  @override
  String toString() => 'ClearCart';
}

class UpdateCartTotal {
  UpdateCartTotal(this.cartTotal);
  int cartTotal;

  @override
  String toString() => 'UpdateCartTotal : cartTotal: $cartTotal';
}

class UpdateRestaurantName {
  UpdateRestaurantName(this.restaurantName);
  String restaurantName;

  @override
  String toString() => 'UpdateRestaurantName : restaurantName: $restaurantName';
}

class UpdateRestaurantWalletAddress {
  UpdateRestaurantWalletAddress(this.restaurantWalletAddress);
  String restaurantWalletAddress;

  @override
  String toString() =>
      'UpdateRestaurantWalletAddress : restaurantWalletAddress: $restaurantWalletAddress';
}

class SetTransferringPayment {
  SetTransferringPayment({required this.flag});
  bool flag;

  @override
  String toString() => 'SetTransferringPayment : flag: $flag';
}

class SetLoadingPaymentButton {
  SetLoadingPaymentButton({required this.flag});
  bool flag;

  @override
  String toString() => 'SetLoadingPaymentButton : flag: $flag';
}

class SetError {
  SetError({required this.flag});
  bool flag;

  @override
  String toString() => 'SetError : flag: $flag';
}

class SetConfirmed {
  SetConfirmed({required this.flag});
  bool flag;

  @override
  String toString() => 'SetConfirmed : flag: $flag';
}

class SetShouldShowPaymentSheet {
  SetShouldShowPaymentSheet(this.flag);
  bool flag;

  @override
  String toString() => 'SetShouldShowPaymentSheet : flag: $flag';
}

class UpdatePaymentIntentID {
  UpdatePaymentIntentID(this.paymentIntentID);
  String paymentIntentID;

  @override
  String toString() =>
      'UpdatePaymentIntentID : paymentIntentID: $paymentIntentID';
}

class UpdateSelectedAmounts {
  UpdateSelectedAmounts({required this.gbpxAmount, required this.pplAmount});
  final double gbpxAmount;
  final double pplAmount;

  @override
  String toString() =>
      'UpdateSelectedAmounts : gbpxAmount: $gbpxAmount, pplAmount: $pplAmount';
}

ThunkAction<AppState> createOrder(String productId, BuildContext context) {
  return (Store<AppState> store) async {
    final String? paymentIntent = await marketService.createMarketOrder(
      walletAddress: store.state.userState.walletAddress,
      productId: productId,
      email: store.state.userState.email,
      phone: store.state.userState.phoneNumber,
    );

    if (paymentIntent != null) {
      store
        ..dispatch(UpdatePaymentIntentID(paymentIntent))
        ..dispatch(queryOrderDetailsFromPaymentIntentID(context));
    }
  };
}

ThunkAction<AppState> queryOrderDetailsFromPaymentIntentID(
    BuildContext context) {
  return (Store<AppState> store) async {
    try {
      final Map<dynamic, dynamic> details = await peeplPayService
          .checkOrderValidity(store.state.networkTabState.paymentIntentID);

      if (details.containsKey('amount') &&
          details.containsKey('recipientWalletAddress')) {
        store
          ..dispatch(
            UpdateCartTotal(
              details['amount'] as int? ?? 0,
            ),
          )
          ..dispatch(
            UpdateRestaurantWalletAddress(
              details['recipientWalletAddress'] as String? ?? '',
            ),
          );
        await showModalBottomSheet<Widget>(
          useRootNavigator: true,
          backgroundColor: Colors.grey[900],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          elevation: 5,
          context: context,
          builder: (context) => const PaymentSheet(),
        );
      } else {
        throw Exception('Payment Intent failed');
      }
    } catch (e, s) {
      store.dispatch(SetError(flag: true));
      log.error('ERROR - queryOrderDetailsFromPaymentIntentID $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
      );
    }
  };
}

// ThunkAction<AppState>sendTokenPayment(
//     VoidCallback successCallback, VoidCallback errorCallback) {
//   return (Store store) async {
//     try {
//       print("PAYMENT INTENT ID" + store.state.networkTabState.paymentIntentID);
//       //Set loading to true
//       store.dispatch(SetTransferringPayment(flag: true));

//       //Get tokens for GBPx and PPL
//       Token GBPxToken = store.state.cashWalletState.tokens.values.firstWhere(
//         (token) =>
//             token.symbol.toLowerCase() == "GBPx".toString().toLowerCase(),
//       );

//       Token PPLToken = store.state.cashWalletState.tokens.values.firstWhere(
//         (token) => token.symbol.toLowerCase() == "PPL".toString().toLowerCase(),
//       );

//       //If Selected GBPx amount is not 0, transfer GBPx
//       Map<String, dynamic> GBPxResponse =
//           store.state.networkTabState.selectedGBPxAmount != 0.0
//               ? double.parse(GBPxToken.getBalance().replaceAll(",", "")) >
//                       store.state.networkTabState.selectedGBPxAmount
//                   ? await chargeApi.tokenTransfer(
//                       getIt<Web3>(),
//                       store.state.userState.walletAddress,
//                       GBPxToken.address,
//                       store.state.networkTabState.restaurantWalletAddress,
//                       tokensAmount: store
//                           .state.networkTabState.selectedGBPxAmount
//                           .toString(),
//                       externalId: store.state.networkTabState.paymentIntentID,
//                     )
//                   : {}
//               : {};

//       print(GBPxResponse);

//       //If Selected PPL Amount is not 0, transfer PPL
//       Map<String, dynamic> PPLResponse =
//           store.state.networkTabState.selectedPPLAmount != 0.0
//               ? double.parse(PPLToken.getBalance().replaceAll(",", "")) >
//                       store.state.networkTabState.selectedPPLAmount
//                   ? await chargeApi.tokenTransfer(
//                       getIt<Web3>(),
//                       store.state.userState.walletAddress,
//                       PPLToken.address,
//                       store.state.networkTabState.restaurantWalletAddress,
//                       tokensAmount: store
//                           .state.networkTabState.selectedPPLAmount
//                           .toString(),
//                       externalId: store.state.networkTabState.paymentIntentID,
//                     )
//                   : {}
//               : {};

//       print(PPLResponse);

//       if (GBPxResponse.isNotEmpty || PPLResponse.isNotEmpty) {
//         Future.delayed(Duration(seconds: 2), () {
//           store.dispatch(SetTransferringPayment(flag: false));
//           store.dispatch(SetConfirmed(true));
//           successCallback();
//         });
//       }
//     } catch (e, s) {
//       store.dispatch(SetError(flag: true));
//       log.error('ERROR - sendTokenPayment $e');
//       await Sentry.captureException(
//         e,
//         stackTrace: s,
//         hint: 'ERROR - sendTokenPayment $e',
//       );
//     }
//   };
// }

ThunkAction<AppState> startPeeplPayProcess({
  required BuildContext context,
  required bool isPlatformPay,
}) {
  return (Store<AppState> store) async {
    try {
      store.dispatch(SetLoadingPaymentButton(flag: true));
      final double currentGBPXAmount =
          store.state.cashWalletState.tokens[gbpxToken.address]!.getAmount();

      final double selectedGBPXAmount =
          store.state.networkTabState.selectedGBPxAmount;

      final hasSufficientGbpxBalance =
          selectedGBPXAmount.compareTo(currentGBPXAmount) <= 0;

      if (hasSufficientGbpxBalance) {
        store.dispatch(startTokenPaymentToRestaurant());
      } else {
        if (isPlatformPay) {
          await stripeService
              .handleApplePay(
                  walletAddress: store.state.userState.walletAddress,
                  amount: (selectedGBPXAmount * 100).ceil(),
                  context: context,
                  shouldPushToHome: false,
                  productName: 'Peepl Market')
              .then(
            (value) {
              if (!value) {
                store.dispatch(SetLoadingPaymentButton(flag: false));
                store.dispatch(SetTransferringPayment(flag: false));
                return;
              } else {
                store.dispatch(SetTransferringPayment(flag: true));
                store.dispatch(startTokenPaymentToRestaurant());
              }
            },
          );
        } else {
          await stripeService
              .handleStripe(
            walletAddress: store.state.userState.walletAddress,
            amount: (selectedGBPXAmount * 100).ceil(),
            context: context,
            shouldPushToHome: false,
          )
              .then(
            (value) {
              if (!value) {
                store.dispatch(SetLoadingPaymentButton(flag: false));
                store.dispatch(SetTransferringPayment(flag: false));
                return;
              } else {
                store.dispatch(SetTransferringPayment(flag: true));
                store.dispatch(startTokenPaymentToRestaurant());
              }
            },
          );
        }
      }
    } catch (e, s) {
      log.error('ERROR - sendOrderObject $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
      );
    }
  };
}

ThunkAction<AppState> startTokenPaymentToRestaurant() {
  return (Store<AppState> store) async {
    try {
      //Set loading to true
      store.dispatch(SetTransferringPayment(flag: true));

      final BigInt currentGBPXAmount =
          store.state.cashWalletState.tokens[gbpxToken.address]!.amount;

      final BigInt currentPPLAmount =
          store.state.cashWalletState.tokens[gbpxToken.address]!.amount;

      final BigInt selectedGBPXAmount =
          BigInt.from(store.state.networkTabState.selectedGBPxAmount);

      final BigInt selectedPPLAmount =
          BigInt.from(store.state.networkTabState.selectedPPLAmount);

      final bool isGBPXSelected = selectedGBPXAmount.compareTo(BigInt.zero) > 0;
      final bool isPPLSelected = selectedPPLAmount.compareTo(BigInt.zero) > 0;

      Map<String, dynamic> gbpxResponse = {};
      Map<String, dynamic> pplResponse = {};
      bool isGBPxConfirmed = false;
      bool isPPLConfirmed = false;

      if (isGBPXSelected) {
        if (currentGBPXAmount.compareTo(selectedGBPXAmount) > 0) {
          gbpxResponse = await chargeApi.tokenTransfer(
            getIt<Web3>(),
            store.state.userState.walletAddress,
            gbpxToken.address,
            store.state.networkTabState.restaurantWalletAddress,
            tokensAmount:
                store.state.networkTabState.selectedGBPxAmount.toString(),
            externalId: store.state.networkTabState.paymentIntentID,
          ) as Map<String, dynamic>;
        }
      }

      if (isPPLSelected) {
        if (currentPPLAmount.compareTo(selectedPPLAmount) > 0) {
          pplResponse = await chargeApi.tokenTransfer(
            getIt<Web3>(),
            store.state.userState.walletAddress,
            pplToken.address,
            store.state.networkTabState.restaurantWalletAddress,
            tokensAmount:
                store.state.networkTabState.selectedPPLAmount.toString(),
            externalId: store.state.networkTabState.paymentIntentID,
          ) as Map<String, dynamic>;
        }
      }

      if (isGBPXSelected) {
        if (gbpxResponse.isEmpty) {
          throw Exception('Error transferring GBPX token: $gbpxResponse');
        } else {
          log.info(gbpxResponse);
          final jobId = gbpxResponse['job']['_id'];

          final Timer timer =
              Timer.periodic(const Duration(seconds: 1), (timer) async {
            final jobInfo = await chargeApi.getJob(jobId as String);
            if (jobInfo['status'] == 'succeeded') {
              isGBPxConfirmed = true;
              timer.cancel();
            }
          });
        }
      }

      if (isPPLSelected) {
        if (pplResponse.isEmpty) {
          throw Exception('Error transferring PPL token: $pplResponse');
        } else {
          log.info(pplResponse);
          final jobId = pplResponse['job']['_id'];

          final Timer timer =
              Timer.periodic(const Duration(seconds: 1), (timer) async {
            final jobInfo = await chargeApi.getJob(jobId as String);
            if (jobInfo['status'] == 'succeeded') {
              isPPLConfirmed = true;
              timer.cancel();
              return;
            }
          });
        }
      }

      Timer timer = Timer.periodic(const Duration(seconds: 2), (timer) {
        if (isGBPXSelected && isPPLSelected) {
          if (isGBPxConfirmed && isPPLConfirmed) {
            store.dispatch(SetConfirmed(flag: true));
            store.dispatch(SetLoadingPaymentButton(flag: false));
            timer.cancel();
            return;
          }
        } else if (isGBPXSelected) {
          if (isGBPxConfirmed) {
            store.dispatch(SetLoadingPaymentButton(flag: false));
            store.dispatch(SetConfirmed(flag: true));
            timer.cancel();
            return;
          }
        } else if (isPPLSelected) {
          if (isPPLConfirmed) {
            store.dispatch(SetLoadingPaymentButton(flag: false));
            store.dispatch(SetConfirmed(flag: true));
            timer.cancel();
            return;
          }
        }
      });

      // final jobId = gbpxResponse['job']['_id'];

      // final jobInfo = await chargeApi.getJob(jobId as String);

      // print(jobInfo);

      // store.dispatch(SetConfirmed(flag: true));
    } catch (e, s) {
      store.dispatch(SetError(flag: true));
      log.error('ERROR - startTokenPaymentToRestaurant $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
      );
    }
  };
}

// ThunkAction<AppState> startPaymentConfirmationCheck() {
//   return (Store<AppState> store) async {
//     int counter = 0;
//     Timer.periodic(
//       const Duration(seconds: 4),
//       (timer) async {
//         try {
//           final Future<Map<dynamic, dynamic>> checkOrderResponse =
//               marketService.checkOrderStatus(store.state.cartState.orderID);

//           await checkOrderResponse.then(
//             (completedValue) {
//               counter++;
//               log.info(
//                 'PaymentStatus: ${completedValue["paymentStatus"]}, '
//                 'counter: $counter',
//               );
//               if (completedValue['paymentStatus'] == 'paid') {
//                 store
//                   ..dispatch(SetTransferringPayment(flag: false))
//                   ..dispatch(SetConfirmed(flag: true));
//                 timer.cancel();
//               }
//             },
//           );

//           if (counter > 15) {
//             timer.cancel();
//             throw Exception('Payment checks exceeded time limit: '
//                 'orderID: ${store.state.cartState.orderID}');
//           }
//         } catch (e, s) {
//           timer.cancel();
//           store.dispatch(SetError(flag: true));
//           log.error('ERROR - startPaymentConfirmationCheck $e');
//           await Sentry.captureException(
//             e,
//             stackTrace: s,
//           );
//         }
//       },
//     );
//   };
// }

// ThunkAction<AppState> fetchFeaturedVideos() {
//   return (Store<AppState> store) async {
//     try {
//       await peeplMediaService.loginToDashboard();
//       final List<VideoArticle> videoArticles =
//           await peeplMediaService.featuredVideos();
//       store.dispatch(UpdateFeaturedVideos(featuredVideos: videoArticles));
//     } catch (e, s) {
//       log.error('ERROR - fetchFeaturedVideos $e');
//       await Sentry.captureException(
//         e,
//         stackTrace: s,
//       );
//     }
//   };
// }

// ThunkAction<AppState> createVideoView(
//     String videoID,
//     void Function(int rewardAmount) successCallback,
//     VoidCallback errorCallback) {
//   return (Store<AppState> store) async {
//     try {
//       final int rewardsIssued = await peeplMediaService.createVideoView(
//         videoID,
//         store.state.userState.walletAddress,
//       );
//       if (rewardsIssued > 0) {
//         successCallback(rewardsIssued);
//       }
//     } catch (e, s) {
//       errorCallback();
//       log.error('ERROR - createVideoView $e');
//       await Sentry.captureException(
//         e,
//         stackTrace: s,
//       );
//     }
//   };
// }

import 'dart:async';
import 'dart:math';
import 'package:charge_wallet_sdk/charge_wallet_sdk.dart';
import 'package:collection/collection.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:guide_liverpool/common/di/di.dart';
import 'package:guide_liverpool/constants/analytics_events.dart';
import 'package:guide_liverpool/constants/analytics_props.dart';
import 'package:guide_liverpool/constants/variables.dart';
import 'package:guide_liverpool/models/actions/actions.dart';
import 'package:guide_liverpool/models/actions/wallet_action.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/models/cash_wallet_state.dart';
import 'package:guide_liverpool/models/tokens/price.dart';
import 'package:guide_liverpool/models/tokens/token.dart';
import 'package:guide_liverpool/redux/actions/user_actions.dart';
import 'package:guide_liverpool/utils/analytics.dart';
import 'package:guide_liverpool/utils/connectionChecker.dart';
import 'package:guide_liverpool/utils/constants.dart';
import 'package:guide_liverpool/utils/format.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:guide_liverpool/services.dart';
import 'package:guide_liverpool/utils/log/log.dart';
import 'package:wallet_connect/wallet_connect.dart';

bool clearTokensWithZero(String key, Token token) {
  if (token.timestamp == 0) return false;
  final double formattedValue = token.amount /
      BigInt.from(
        pow(10, token.decimals),
      );
  return num.parse(formattedValue.toString()).compareTo(0) != 1;
}

class AddSession {
  AddSession(this.session);
  final WCSessionStore session;

  @override
  String toString() {
    return 'AddSession : session: $session';
  }
}

class RemoveSession {
  RemoveSession(this.session);
  final WCSessionStore session;

  @override
  String toString() {
    return 'RemoveSession : session: $session';
  }
}

class AddCashTokens {
  AddCashTokens({
    required this.tokens,
  });
  final Map<String, Token> tokens;

  @override
  String toString() {
    return 'AddCashTokens : tokens: $tokens';
  }
}

class AddCashToken {
  AddCashToken({
    required this.token,
  });
  final Token token;

  @override
  String toString() {
    return 'AddCashToken : token: $token';
  }
}

class UpdateTokenPrice {
  UpdateTokenPrice({
    required this.price,
    required this.tokenAddress,
  });
  final Price price;
  final String tokenAddress;

  @override
  String toString() {
    return 'UpdateTokenPrice : price: $price, tokenAddress: $tokenAddress';
  }
}

class GetWalletDataSuccess {
  GetWalletDataSuccess({
    required this.contractVersion,
    required this.backup,
    required this.networks,
    required this.walletAddress,
    required this.walletModules,
  });
  final List<String> networks;
  final String walletAddress;
  final bool backup;
  final WalletModules walletModules;
  final String? contractVersion;

  @override
  String toString() {
    return 'GetWalletDataSuccess : walletAddress: $walletAddress'
        ',networks: $networks, backup: $backup, walletModules:'
        ' $walletModules, contractVersion: $contractVersion';
  }
}

class GetTokenBalanceSuccess {
  GetTokenBalanceSuccess({
    required this.tokenBalance,
    required this.tokenAddress,
  });
  final String tokenAddress;
  final BigInt tokenBalance;

  @override
  String toString() {
    return 'GetTokenBalanceSuccess : tokenAddress: '
        '$tokenAddress, tokenBalance: $tokenBalance';
  }
}

class GetTokenIntervalStatsSuccess {
  GetTokenIntervalStatsSuccess({
    required this.intervalStats,
    required this.tokenAddress,
    required this.timeFrame,
    required this.priceChange,
  });
  final String tokenAddress;
  final List<IntervalStats> intervalStats;
  final TimeFrame timeFrame;
  final num priceChange;

  @override
  String toString() {
    return 'GetTokenIntervalStatsSuccess : tokenAddress: '
        '$tokenAddress, intervalStats: $intervalStats, '
        'timeFrame: $timeFrame, priceChange: $priceChange';
  }
}

class GetActionsSuccess {
  GetActionsSuccess({
    required this.walletActions,
    this.nextPage,
  });
  final List<WalletAction> walletActions;
  final int? nextPage;

  @override
  String toString() =>
      'GetActionsSuccess : walletActions: $walletActions, nextPage: $nextPage';
}

class GetTokenWalletActionsSuccess {
  GetTokenWalletActionsSuccess({
    required this.updateAt,
    required this.walletActions,
    required this.token,
    this.nextPage,
  });
  final Token token;
  final List<WalletAction> walletActions;
  final num updateAt;
  final int? nextPage;

  @override
  String toString() => 'GetTokenWalletActionsSuccess : token: $token, '
      'walletActions: $walletActions, updateAt: $updateAt, nextPage: $nextPage';
}

class StartBalanceFetchingSuccess {
  StartBalanceFetchingSuccess();

  @override
  String toString() {
    return 'StartBalanceFetchingSuccess';
  }
}

class SetIsTransfersFetching {
  SetIsTransfersFetching({
    required this.isFetching,
  });
  final bool isFetching;

  @override
  String toString() {
    return 'SetIsTransfersFetching : isFetching: $isFetching';
  }
}

class ResetTokenTxs {
  ResetTokenTxs();

  @override
  String toString() {
    return 'ResetTokenTxs';
  }
}

class SetIsFetchingBalances {
  SetIsFetchingBalances({
    required this.isFetching,
  });
  final bool isFetching;

  @override
  String toString() {
    return 'SetIsFetchingBalances : isFetching: $isFetching';
  }
}

class FetchNewPage {
  FetchNewPage({required this.page});
  final int page;

  @override
  String toString() {
    return 'FetchNewPage : page: $page';
  }
}

ThunkAction<AppState> enablePushNotifications(String walletAddress) {
  return (Store<AppState> store) async {
    try {
      await getIt<FirebaseMessaging>().requestPermission();
      final String? token = await getIt<FirebaseMessaging>().getToken();
      if (token != null) {
        log.info('Firebase messaging token $token');
        await chargeApi.updateFirebaseToken(walletAddress, token);
      }
    } catch (e, s) {
      log.error(
        'ERROR - Enable push notifications: $e',
        error: e,
        stackTrace: s,
      );
      await Sentry.captureException(
        Exception('ERROR - Enable push notifications: $e'),
        stackTrace: s,
        hint: 'ERROR - Enable push notifications',
      );
    }
  };
}

ThunkAction<AppState> startFetchTokensBalances() {
  return (Store<AppState> store) async {
    final bool isFetchingBalances =
        store.state.cashWalletState.isFetchingBalances;
    final String walletAddress = store.state.userState.walletAddress;
    if (!isFetchingBalances) {
      log.info('Start Fetching token balances');
      Timer.periodic(
        const Duration(seconds: Variables.intervalSeconds),
        (Timer timer) async {
          final String currentWalletAddress =
              store.state.userState.walletAddress;
          if (currentWalletAddress != walletAddress) {
            log.error('Timer stopped - startFetchTokensBalances');
            store.dispatch(SetIsFetchingBalances(isFetching: false));
            timer.cancel();
          } else {
            final NetworkInfo networkInfo = getIt<NetworkInfo>();
            if (await networkInfo.isConnected) {
              try {
                final Map<String, Token> tokens =
                    store.state.cashWalletState.tokens;
                for (final Token token in tokens.values) {
                  await token.fetchBalance(
                    walletAddress,
                    onDone: (balance) {
                      if (balance.compareTo(token.amount) != 0) {
                        store.dispatch(
                          GetTokenBalanceSuccess(
                            tokenBalance: balance,
                            tokenAddress: token.address,
                          ),
                        );
                      }
                    },
                    onError: (
                      Object e,
                      StackTrace s,
                    ) {
                      log.error(
                        'Error - fetch token balance ${token.name}',
                        error: e,
                        stackTrace: s,
                      );
                    },
                  );
                }
              } catch (e, s) {
                log.error(
                  'Error fetch tokens balances - ${e.toString()}',
                  error: e,
                  stackTrace: s,
                );
                await Sentry.captureException(
                  Exception('Error fetch tokens balances - $e'),
                  stackTrace: s,
                  hint: 'Error fetch tokens balances',
                );
              }
            } else {
              log.error("Looks like you're offline");
            }
          }
        },
      );
      store.dispatch(SetIsFetchingBalances(isFetching: true));
    }
  };
}

ThunkAction<AppState> createAccountWalletCall() {
  return (Store<AppState> store) async {
    try {
      final Map<String, dynamic> response =
          await chargeApi.createWallet() as Map<String, dynamic>;
      if (!response.containsKey('job')) {
        log.info('Wallet already exists');
        final Map<String, dynamic> data = Map<String, dynamic>.from({
          ...response,
        });
        store.dispatch(generateWalletSuccessCall(data));
      } else {
        final Map<String, dynamic> jobData =
            response['job']['data'] as Map<String, dynamic>;
        final Map<String, dynamic> walletData = Map<String, dynamic>.from({
          ...jobData,
          'networks': ['fuse'],
        });
        store.dispatch(generateWalletSuccessCall(walletData));
      }
    } catch (e, s) {
      log.error(
        'ERROR - createAccountWalletCal',
        error: e,
        stackTrace: s,
      );
      await Sentry.captureException(
        Exception('ERROR - createAccountWalletCal - $e'),
        stackTrace: s,
        hint: 'ERROR - createAccountWalletCal',
      );
    }
  };
}

ThunkAction<AppState> generateWalletSuccessCall(
  Map<String, dynamic> walletData,
) {
  return (Store<AppState> store) async {
    final String? walletAddress = walletData['walletAddress'] as String?;
    log.info('walletAddress walletAddress $walletAddress');
    if (walletAddress != null && walletAddress.isNotEmpty) {
      store
        ..dispatch(enablePushNotifications(walletAddress))
        ..dispatch(setupWalletCall(walletData))
        ..dispatch(saveUserProfile(walletAddress))
        ..dispatch(identifyCall(wallet: walletAddress));
    }
  };
}

ThunkAction<AppState> fetchTokenList() {
  return (Store<AppState> store) async {
    try {
      final String walletAddress = store.state.userState.walletAddress;
      final TokenList tokensList = await getIt<FuseExplorer>().getTokenList(
        walletAddress,
      );
      final CashWalletState cashWalletState = store.state.cashWalletState;
      final Map<String, Token> newTokens =
          tokensList.result.whereType<ERC20>().fold<Map<String, Token>>(
        {},
        (Map<String, Token> previousValue, ERC20 element) {
          final Token token = Token(
            address: element.address,
            name: element.name,
            symbol: element.symbol,
            amount: element.amount,
            decimals: element.decimals,
          );
          if (!cashWalletState.tokens.containsKey(element.address) &&
              num.parse(token.getBalance(withPrecision: true)).compareTo(0) ==
                  1) {
            log.info('New token added ${element.name}');
            previousValue[element.address] = token;
          }
          return previousValue;
        },
      );
      if (newTokens.isNotEmpty) {
        store.dispatch(AddCashTokens(tokens: newTokens));
        Future.delayed(const Duration(seconds: Variables.intervalSeconds), () {
          store.dispatch(updateTokensPrices());
        });
      }
    } catch (e, s) {
      log.error(
        'ERROR - fetchTokenList',
        error: e,
        stackTrace: s,
      );
      await Sentry.captureException(
        Exception('ERROR - fetchTokenList - $e'),
        stackTrace: s,
        hint: 'ERROR - fetchTokenList',
      );
    }
  };
}

ThunkAction<AppState> sendNativeTokenCall(
  String receiverAddress,
  String tokensAmount,
  VoidCallback sendSuccessCallback,
  VoidCallback sendFailureCallback,
) {
  return (Store<AppState> store) async {
    try {
      final String walletAddress = store.state.userState.walletAddress;
      final BigInt amount = Formatter.toBigInt(tokensAmount, 18);
      final Map<String, dynamic> transactionBody = Map.from({
        'status': 'pending',
        'from': walletAddress,
        'to': receiverAddress,
        'value': amount.toString(),
        'type': 'SEND',
        'asset': fuseToken.symbol,
        'tokenName': fuseToken.name,
        'tokenSymbol': fuseToken.symbol,
        'tokenDecimal': fuseToken.decimals,
        'tokenAddress': fuseToken.address,
      });
      final dynamic response = await chargeApi.transfer(
        getIt<Web3>(),
        walletAddress,
        receiverAddress,
        amountInWei: amount,
        transactionBody: transactionBody,
      );

      final String jobId = response['job']['_id'] as String;
      await Analytics.identify({
        AnalyticsProps.fundSending: true,
      });
      store.dispatch(
        fetchJobCall(
          jobId,
          (Map jobData) {},
          (dynamic failReason) {},
        ),
      );
      log
        ..info('sendNativeTokenCall')
        ..info('Job $jobId for sending native token sent to the relay service');

      sendSuccessCallback();
    } catch (e, s) {
      log.error(
        'ERROR - sendNativeTokenCall',
        error: e,
        stackTrace: s,
      );
      await Sentry.captureException(
        Exception('ERROR - sendNativeTokenCall - $e'),
        stackTrace: s,
        hint: 'ERROR - sendNativeTokenCall',
      );
    }
  };
}

ThunkAction<AppState> sendTokenCall(
  Token token,
  String receiverAddress,
  String tokensAmount,
  VoidCallback sendSuccessCallback,
  VoidCallback sendFailureCallback,
) {
  return (Store<AppState> store) async {
    try {
      final String walletAddress = store.state.userState.walletAddress;
      if (token.isNative) {
        store.dispatch(
          sendNativeTokenCall(
            receiverAddress,
            tokensAmount,
            sendSuccessCallback,
            sendFailureCallback,
          ),
        );
      } else {
        log.info(
          'Sending ${token.name} $tokensAmount from $walletAddress to $receiverAddress',
        );
        final dynamic response = await chargeApi.tokenTransfer(
          getIt<Web3>(),
          walletAddress,
          token.address,
          receiverAddress,
          tokensAmount: tokensAmount,
        );
        await Analytics.identify({
          AnalyticsProps.fundSending: true,
        });

        final String jobId = response['job']['_id'] as String;
        log.info('Job $jobId for sending token sent to the relay service');
        store.dispatch(
          fetchJobCall(
            jobId,
            (Map jobData) {},
            (dynamic failReason) {},
          ),
        );
        sendSuccessCallback();
      }
    } catch (e, s) {
      log.error(
        'ERROR - sendTokenCall',
        error: e,
        stackTrace: s,
      );
      await Sentry.captureException(
        Exception('ERROR - sendTokenCall - $e'),
        stackTrace: s,
        hint: 'ERROR - sendTokenCall',
      );
    }
  };
}

ThunkAction<AppState> getWalletActionsCall({
  int? pageIndex,
  VoidCallback? onSuccess,
}) {
  return (Store<AppState> store) async {
    try {
      final String walletAddress = store.state.userState.walletAddress;
      final WalletActions walletActions =
          store.state.cashWalletState.walletActions ?? WalletActions.initial();
      final Map<String, dynamic> response =
          await chargeApi.getPaginatedActionsByWalletAddress(
        walletAddress,
        pageIndex ?? walletActions.currentPage,
      );
      final Iterable<dynamic> docs = response['docs'] as Iterable? ?? [];
      final bool hasNextPage = response['hasNextPage'] as bool? ?? false;
      final int nextPage = response['nextPage'] as int? ?? 1;
      final List<WalletAction> actions = WalletAction.actionsFromJson(docs);
      final List<WalletAction> arr =
          walletActions.list.reversed.take(actions.length).toList();

      if (actions.isNotEmpty &&
          !(const ListEquality<WalletAction>().equals(actions, arr))) {
        final int next = hasNextPage && nextPage > walletActions.currentPage
            ? nextPage
            : walletActions.currentPage;
        store.dispatch(
          GetActionsSuccess(
            walletActions: actions,
            nextPage: next,
          ),
        );
        onSuccess?.call();
      }
    } catch (e, s) {
      log.error(
        'ERROR - getWalletActionsCall',
        error: e,
        stackTrace: s,
      );
      await Sentry.captureException(
        Exception('ERROR - getWalletActionsCall - $e'),
        stackTrace: s,
        hint: 'ERROR - getWalletActionsCall',
      );
    }
  };
}

ThunkAction<AppState> updateTokensPrices() {
  return (Store<AppState> store) async {
    final Map<String, Token> tokens = store.state.cashWalletState.tokens;
    for (final Token token in tokens.values) {
      store
        ..dispatch(getTokenPriceCall(token))
        ..dispatch(
          getTokenIntervalStatsCall(
            token,
          ),
        );
    }
  };
}

ThunkAction<AppState> getTokenPriceCall(Token token) {
  return (Store<AppState> store) async {
    try {
      void onDone(Price priceInfo) {
        store.dispatch(
          UpdateTokenPrice(
            price: priceInfo,
            tokenAddress: token.address,
          ),
        );
      }

      void onError(Object error, StackTrace stackTrace) {
        log.error('Fetch token price error for - ${token.name} - $error ');
      }

      await token.fetchLatestPrice(
        onDone: onDone,
        onError: onError,
      );
    } catch (e, s) {
      log.error(
        'Error getTokenPriceCall for ${token.name}',
        error: e,
        stackTrace: s,
      );
      await Sentry.captureException(
        Exception('Error getTokenPriceCall for ${token.name}'),
        stackTrace: s,
        hint: 'Error getTokenPriceCall for ${token.name}',
      );
    }
  };
}

ThunkAction<AppState> getTokenIntervalStatsCall(
  Token token, {
  TimeFrame timeFrame = TimeFrame.day,
}) {
  return (Store<AppState> store) async {
    try {
      await token.fetchIntervalStats(
        timeFrame: timeFrame,
        onDone: (List<IntervalStats> data) {
          if (!(const ListEquality<IntervalStats>()
              .equals(data, token.intervalStats))) {
            store.dispatch(
              GetTokenIntervalStatsSuccess(
                intervalStats: data,
                tokenAddress: token.address,
                timeFrame: timeFrame,
                priceChange: getPercentChange(
                  data.last.currentPrice,
                  data.first.currentPrice,
                ),
              ),
            );
          }
        },
        onError: (
          Object error,
          StackTrace stackTrace,
        ) {
          log.error(
            'Error getTokenIntervalStatsCall - ${token.name} - $error ',
          );
        },
      );
    } catch (e, s) {
      log.error(
        'Error getTokenIntervalStatsCall - ${token.name} - ${e.toString()} ',
        error: e,
        stackTrace: s,
      );
      await Sentry.captureException(
        Exception(
          'Error getTokenIntervalStatsCall - ${token.name} - ${e.toString()} ',
        ),
        stackTrace: s,
        hint:
            'Error getTokenIntervalStatsCall - ${token.name} - ${e.toString()} ',
      );
    }
  };
}

ThunkAction<AppState> getTokenWalletActionsCall(Token token) {
  return (Store<AppState> store) async {
    try {
      final String walletAddress = store.state.userState.walletAddress;
      final Map<String, dynamic> response =
          await chargeApi.getPaginatedActionsByWalletAddress(
        walletAddress,
        1,
        tokenAddress: token.address,
      );
      final Iterable<dynamic> docs = response['docs'] as Iterable? ?? [];
      // final bool hasNextPage = response['hasNextPage'];
      // final int nextPage = response['nextPage'] ?? 1;
      final List<WalletAction> actions = WalletAction.actionsFromJson(docs)
        ..sort(((a, b) => a.timestamp.compareTo(b.timestamp)));
      final List<WalletAction> arr = (token.walletActions?.list.reversed
              .take(actions.length)
              .toList() ??
          [])
        ..sort(((a, b) => a.timestamp.compareTo(b.timestamp)));
      if (actions.isNotEmpty) {
        if (!(const ListEquality<WalletAction>().equals(actions, arr))) {
          store.dispatch(
            GetTokenWalletActionsSuccess(
              walletActions: actions,
              updateAt: actions.last.timestamp,
              token: token,
            ),
          );
        } else {
          log.info('GetTokenWalletActionsSuccess nothing new');
        }
      }
    } catch (e, s) {
      log.error(
        'Error getTokenWalletActionsCall for ${token.name}',
        error: e,
        stackTrace: s,
      );
      await Sentry.captureException(
        Exception('Error getTokenWalletActionsCall for ${token.name}'),
        stackTrace: s,
        hint: 'Error getTokenWalletActionsCall for ${token.name}',
      );
    }
  };
}

ThunkAction<AppState> refresh() {
  return (Store<AppState> store) async {
    store
      ..dispatch(getWalletActionsCall(pageIndex: 1))
      ..dispatch(ResetTokenTxs())
      ..dispatch(startFetchTokensBalances())
      ..dispatch(updateTokensPrices());
  };
}

// ThunkAction sendTokenFromPeeplPaySheet({
//   required String currency,
//   required String receiverAddress,
//   required double tokensAmount,
//   required String orderId,
// }) {
//   return (Store store) async {
//     try {
//       Token token = store.state.cashWalletState.tokens.values.firstWhere(
//         (token) =>
//             token.symbol.toLowerCase() == currency.toString().toLowerCase(),
//       );
//       String walletAddress = store.state.userState.walletAddress;
//       // dynamic response = await walletApi.tokenTransfer(
//       //   fuseWeb3!,
//       //   walletAddress,
//       //   token.address,
//       //   receiverAddress,
//       //   tokensAmount.toString(),
//       //   externalId: orderId,
//       // );
//       //Create a call to check if the payment is gone through
//     } catch (e) {
//       log.error('ERROR - sendTokenFromWebViewCall $e');
//     }
//   };
// }

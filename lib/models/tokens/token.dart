import 'package:charge_wallet_sdk/charge_wallet_sdk.dart';
import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:guide_liverpool/common/di/di.dart';
import 'package:guide_liverpool/models/actions/actions.dart';
import 'package:guide_liverpool/models/cash_wallet_state.dart';
import 'package:guide_liverpool/models/tokens/price.dart';
import 'package:guide_liverpool/services.dart';
import 'package:guide_liverpool/utils/format.dart';
import 'package:guide_liverpool/utils/log/log.dart';

part 'token.freezed.dart';
part 'token.g.dart';

@Freezed()
class Token with _$Token implements Comparable<Token> {
  factory Token({
    required String address,
    required String name,
    required String symbol,
    required BigInt amount,
    required int decimals,
    @Default(false) bool isNative,
    String? imageUrl,
    int? timestamp,
    Price? priceInfo,
    String? communityAddress,
    @Default(TimeFrame.day) TimeFrame timeFrame,
    @Default(0) num priceChange,
    @Default([]) List<IntervalStats> intervalStats,
    @JsonKey(fromJson: walletActionsFromJson) WalletActions? walletActions,
  }) = _Token;

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  const Token._();

  @override
  int compareTo(Token? other) {
    if (other == null) return 1;
    return num.parse(getFiatBalance(withPrecision: true))
        .compareTo(num.parse(other.getFiatBalance(withPrecision: true)));
  }

  double getAmount() => Formatter.fromWei(amount, decimals).toDouble();

  String getBalance({bool withPrecision = false}) => Formatter.formatValue(
        amount,
        decimals,
        withPrecision,
      );

  String getFiatBalance({bool withPrecision = false}) => hasPriceInfo
      ? Formatter.formatValueToFiat(
          amount,
          decimals,
          double.parse(priceInfo!.quote),
          withPrecision,
        )
      : '0';

  bool get hasPriceInfo => priceInfo != null && priceInfo?.hasPriceInfo == true;

  Future<dynamic> fetchBalance(
    String accountAddress, {
    required void Function(BigInt) onDone,
    Function? onError,
  }) async {
    if ([null, ''].contains(accountAddress) || [null, ''].contains(address)) {
      return;
    }
    try {
      final dynamic balance = isNative
          ? await getIt<Web3>().getBalance(address: address)
          : await getIt<Web3>().getTokenBalance(
              address,
              address: accountAddress,
            );

      final BigInt value =
          balance is EtherAmount ? balance.getInWei : balance as BigInt;

      onDone(value);
    } catch (e, s) {
      log.error(
        'Error - fetch token balance $name',
        error: e,
        stackTrace: s,
      );
      onError?.call(e, s);
      rethrow;
    }
  }

  Future<dynamic> fetchLatestPrice({
    String currency = 'usd',
    required void Function(Price) onDone,
    required Function onError,
  }) async {
    try {
      final String price = await chargeApi.price(address);
      onDone(Price(currency: currency, quote: Decimal.parse(price).toString()));
    } catch (e, s) {
      onError(e, s);
    }
  }

  Future<dynamic> fetchPriceChange({
    required void Function(num) onDone,
    required Function onError,
  }) async {
    try {
      final String priceChange = await chargeApi.priceChange(address);
      onDone(num.parse(Decimal.parse(priceChange).toString()));
    } catch (e, s) {
      onError(e, s);
    }
  }

  Future<dynamic> fetchIntervalStats({
    required void Function(List<IntervalStats>) onDone,
    required Function onError,
    required TimeFrame timeFrame,
  }) async {
    try {
      final List<IntervalStats> intervalStats = await chargeApi.interval(
        address,
        timeFrame,
      );
      onDone(intervalStats);
    } catch (e, s) {
      onError(e, s);
    }
  }
}

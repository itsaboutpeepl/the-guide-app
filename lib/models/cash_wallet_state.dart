import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:guide_liverpool/constants/addresses.dart';
import 'package:guide_liverpool/models/actions/actions.dart';
import 'package:guide_liverpool/models/actions/wallet_action.dart';
import 'package:guide_liverpool/models/tokens/token.dart';
import 'package:guide_liverpool/utils/constants.dart';
import 'package:wallet_connect/wallet_connect.dart';

part 'cash_wallet_state.freezed.dart';
part 'cash_wallet_state.g.dart';

WalletActions walletActionsFromJson(Map<String, dynamic>? json) {
  if (json == null) {
    return WalletActions.initial();
  } else {
    return WalletActions(
      list: WalletAction.actionsFromJson(
        json['list'] as Iterable<dynamic>,
      ),
      updatedAt: json['updatedAt'] as num? ?? 0,
      currentPage: json['currentPage'] as int? ?? 1,
    );
  }
}

Map<String, Token> tokensFromJson(Map<String, dynamic> tokens) => tokens.map(
      (k, e) {
        if (k == Addresses.zeroAddress) {
          return MapEntry(
            Addresses.nativeTokenAddress,
            Token.fromJson(
              {
                ...e as Map<String, dynamic>,
                'address': Addresses.nativeTokenAddress,
              },
            ),
          );
        } else {
          return MapEntry(
            k,
            Token.fromJson(
              e as Map<String, dynamic>,
            ),
          );
        }
      },
    )
      ..putIfAbsent(gbpxToken.address, () => gbpxToken)
      ..putIfAbsent(pplToken.address, () => pplToken);

@freezed
class CashWalletState with _$CashWalletState {
  factory CashWalletState({
    @JsonKey(fromJson: tokensFromJson) @Default({}) Map<String, Token> tokens,
    @JsonKey(fromJson: walletActionsFromJson) WalletActions? walletActions,
    @JsonKey(ignore: true) @Default(false) bool isTransfersFetchingStarted,
    @JsonKey(ignore: true) @Default(false) bool isFetchingBalances,
    @Default([]) List<WCSessionStore> wcSessionStores,
  }) = _CashWalletState;

  const CashWalletState._();

  factory CashWalletState.initial() {
    return CashWalletState(
      tokens: Map<String, Token>.fromIterables(
        {
          gbpxToken.address,
          pplToken.address,
        },
        [
          gbpxToken.copyWith(),
          pplToken.copyWith(),
        ],
      ),
      walletActions: WalletActions().copyWith(
        list: <WalletAction>[],
        updatedAt: 0,
      ),
    );
  }

  factory CashWalletState.fromJson(Map<String, dynamic> json) =>
      _$CashWalletStateFromJson(json);
}

class CashWalletStateConverter
    implements JsonConverter<CashWalletState, Map<String, dynamic>?> {
  const CashWalletStateConverter();

  @override
  CashWalletState fromJson(Map<String, dynamic>? json) =>
      json != null ? CashWalletState.fromJson(json) : CashWalletState.initial();

  @override
  Map<String, dynamic> toJson(CashWalletState instance) => instance.toJson();
}

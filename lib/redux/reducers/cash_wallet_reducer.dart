import 'package:ethereum_addresses/ethereum_addresses.dart';
import 'package:redux/redux.dart';
import 'package:guide_liverpool/models/actions/actions.dart';
import 'package:guide_liverpool/models/actions/wallet_action.dart';
import 'package:guide_liverpool/models/cash_wallet_state.dart';
import 'package:guide_liverpool/models/tokens/token.dart';
import 'package:guide_liverpool/redux/actions/cash_wallet_actions.dart';
import 'package:guide_liverpool/redux/actions/user_actions.dart';
import 'package:wallet_connect/wc_session_store.dart';

final cashWalletReducers = combineReducers<CashWalletState>([
  TypedReducer<CashWalletState, GetTokenIntervalStatsSuccess>(
    _getTokenIntervalStatsSuccess,
  ),
  TypedReducer<CashWalletState, AddSession>(_addSession),
  TypedReducer<CashWalletState, RemoveSession>(
    _removeSession,
  ),
  TypedReducer<CashWalletState, CreateLocalAccountSuccess>(
    _createNewWalletSuccess,
  ),
  TypedReducer<CashWalletState, UpdateTokenPrice>(_updateTokenPrice),
  TypedReducer<CashWalletState, GetActionsSuccess>(_getActionsSuccess),
  TypedReducer<CashWalletState, GetTokenWalletActionsSuccess>(
    _getTokenWalletActionsSuccess,
  ),
  TypedReducer<CashWalletState, AddCashTokens>(_addCashTokens),
  TypedReducer<CashWalletState, AddCashToken>(_addCashToken),
  TypedReducer<CashWalletState, GetTokenBalanceSuccess>(
    _getTokenBalanceSuccess,
  ),
  TypedReducer<CashWalletState, ResetTokenTxs>(_resetTokensTxs),
  TypedReducer<CashWalletState, SetIsTransfersFetching>(
    _setIsTransfersFetching,
  ),
  TypedReducer<CashWalletState, SetIsFetchingBalances>(_setIsFetchingBalances),
]);

CashWalletState _getTokenIntervalStatsSuccess(
  CashWalletState state,
  GetTokenIntervalStatsSuccess action,
) {
  final String tokenAddress = action.tokenAddress;
  final Token current = state.tokens[action.tokenAddress]!;
  final Map<String, Token> newOne = Map<String, Token>.from(state.tokens);
  newOne[tokenAddress] = current.copyWith(
    intervalStats: action.intervalStats,
    timeFrame: action.timeFrame,
    priceChange: action.priceChange,
  );
  return state.copyWith(tokens: newOne);
}

CashWalletState _addSession(
  CashWalletState state,
  AddSession action,
) {
  final List<WCSessionStore> currentSessions = state.wcSessionStores.toList()
    ..removeWhere(
      (element) =>
          action.session.remotePeerMeta.name == element.remotePeerMeta.name,
    )
    ..toList();
  return state.copyWith(
    wcSessionStores: [
      ...currentSessions,
      action.session,
    ],
  );
}

CashWalletState _removeSession(
  CashWalletState state,
  RemoveSession action,
) {
  final List<WCSessionStore> wcSessionStores = state.wcSessionStores
    ..remove(
      action.session,
    )
    ..toList();
  return state.copyWith(
    wcSessionStores: wcSessionStores,
  );
}

CashWalletState _createNewWalletSuccess(
  CashWalletState state,
  CreateLocalAccountSuccess action,
) {
  return CashWalletState.initial();
}

CashWalletState _updateTokenPrice(
  CashWalletState state,
  UpdateTokenPrice action,
) {
  final Token token = state.tokens[action.tokenAddress]!;
  final Map<String, Token> newOne = Map<String, Token>.from(state.tokens);
  newOne[token.address] = token.copyWith(priceInfo: action.price);
  return state.copyWith(tokens: newOne);
}

CashWalletState _getTokenWalletActionsSuccess(
  CashWalletState state,
  GetTokenWalletActionsSuccess action,
) {
  final Token token = state.tokens[action.token.address]!;
  final List<WalletAction> walletActions = token.walletActions!.list.toList();
  for (final WalletAction walletAction in action.walletActions) {
    final int savedIndex = walletActions.indexWhere(
      (action) => action.id == walletAction.id,
    );
    if (savedIndex != -1) {
      walletActions[savedIndex] = walletAction;
    } else {
      walletActions.add(walletAction);
    }
  }

  final Map<String, Token> newOne = Map<String, Token>.from(state.tokens);
  newOne[token.address] = token.copyWith(
    walletActions: WalletActions().copyWith(
      list: walletActions..sort(),
      updatedAt: action.updateAt + 1,
      currentPage: action.nextPage ?? token.walletActions?.currentPage ?? 1,
    ),
  );
  return state.copyWith(
    tokens: newOne,
  );
}

CashWalletState _getActionsSuccess(
  CashWalletState state,
  GetActionsSuccess action,
) {
  final List<WalletAction> list = state.walletActions!.list.toList();
  for (final WalletAction walletAction in action.walletActions) {
    final int savedIndex = list.indexWhere(
      (action) => action.id == walletAction.id,
    );
    if (savedIndex != -1) {
      list[savedIndex] = walletAction.copyWith();
    } else {
      list.add(walletAction);
    }
  }
  return state.copyWith(
    walletActions: WalletActions().copyWith(
      list: list..sort(),
      currentPage: action.nextPage ?? state.walletActions!.currentPage,
    ),
  );
}

CashWalletState _addCashTokens(
  CashWalletState state,
  AddCashTokens action,
) {
  final Map<String, Token> newOne = Map<String, Token>.from(state.tokens)
    ..removeWhere(clearTokensWithZero);
  for (final String tokenAddress in action.tokens.keys) {
    if (newOne.containsKey(tokenAddress)) {
      newOne[tokenAddress] = newOne[tokenAddress]!.copyWith(
        amount: action.tokens[tokenAddress]!.amount,
      );
    } else {
      newOne[tokenAddress] = action.tokens[tokenAddress]!;
    }
  }
  return state.copyWith(tokens: newOne);
}

CashWalletState _addCashToken(
  CashWalletState state,
  AddCashToken action,
) {
  final Token token = action.token;
  final Map<String, Token> newOne = Map<String, Token>.from(state.tokens)
    ..removeWhere(clearTokensWithZero);
  if (!newOne.containsKey(token.address)) {
    newOne[token.address] = token;
  } else {
    newOne[token.address] = newOne[token.address]!.copyWith(
      name: token.name,
    );
  }
  return state.copyWith(tokens: newOne);
}

CashWalletState _resetTokensTxs(
  CashWalletState state,
  ResetTokenTxs action,
) {
  final Map<String, Token> newOne = Map<String, Token>.from(state.tokens);
  final Map<String, Token> tokens = {};
  final List<String> tokenAddresses = List<String>.from(
    newOne.keys.map((e) => e.toLowerCase()).toSet().toList(),
  );
  for (final String tokenAddress in tokenAddresses) {
    final Token token =
        newOne.containsKey(checksumEthereumAddress(tokenAddress))
            ? newOne[checksumEthereumAddress(tokenAddress)]!
            : newOne[tokenAddress]!;
    tokens[tokenAddress] = token.copyWith(
      walletActions: token.walletActions!.copyWith(
        updatedAt: 0,
      ),
    );
  }
  return state.copyWith(
    tokens: tokens,
    walletActions: state.walletActions!.copyWith(
      updatedAt: 0,
    ),
  );
}

CashWalletState _getTokenBalanceSuccess(
  CashWalletState state,
  GetTokenBalanceSuccess action,
) {
  final String tokenAddress = action.tokenAddress;
  final Token current = state.tokens[action.tokenAddress]!;
  final Map<String, Token> newOne = Map<String, Token>.from(state.tokens);
  newOne[tokenAddress] = current.copyWith(amount: action.tokenBalance);
  return state.copyWith(tokens: newOne);
}

CashWalletState _setIsTransfersFetching(
  CashWalletState state,
  SetIsTransfersFetching action,
) {
  return state.copyWith(isTransfersFetchingStarted: action.isFetching);
}

CashWalletState _setIsFetchingBalances(
  CashWalletState state,
  SetIsFetchingBalances action,
) {
  return state.copyWith(isFetchingBalances: action.isFetching);
}

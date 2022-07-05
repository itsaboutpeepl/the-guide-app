import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_cart_state.freezed.dart';
part 'user_cart_state.g.dart';

@freezed
class UserCartState with _$UserCartState {
  const UserCartState._();

  @JsonSerializable()
  factory UserCartState({
    required String paymentIntentID,
    required double selectedGBPxAmount,
    required double selectedPPLAmount,
    required bool transferringTokens,
    required bool errorCompletingPayment,
    required bool confirmedPayment,
    required String restaurantName,
    required int cartTotal,
    required String restaurantWalletAddress,
  }) = _UserCartState;

  factory UserCartState.initial() => UserCartState(
        paymentIntentID: "",
        selectedGBPxAmount: 0.0,
        selectedPPLAmount: 0.0,
        transferringTokens: false,
        errorCompletingPayment: false,
        confirmedPayment: false,
        restaurantName: "",
        cartTotal: 0,
        restaurantWalletAddress: "",
      );

  factory UserCartState.fromJson(dynamic json) => _$UserCartStateFromJson(json);
}

class UserCartStateConverter implements JsonConverter<UserCartState, Map<String, dynamic>?> {
  const UserCartStateConverter();

  @override
  UserCartState fromJson(Map<String, dynamic>? json) => UserCartState.initial();

  @override
  Map<String, dynamic> toJson(UserCartState instance) => instance.toJson();
}

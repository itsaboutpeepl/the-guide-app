import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_tab_state.freezed.dart';
part 'network_tab_state.g.dart';

@freezed
class NetworkTabState with _$NetworkTabState {
  @JsonSerializable()
  factory NetworkTabState({
    @JsonKey(ignore: true) @Default('') String paymentIntentID,
    @JsonKey(ignore: true) @Default(0.0) double selectedGBPxAmount,
    @JsonKey(ignore: true) @Default(0.0) double selectedPPLAmount,
    @JsonKey(ignore: true) @Default(false) bool transferringTokens,
    @JsonKey(ignore: true) @Default(false) bool errorCompletingPayment,
    @JsonKey(ignore: true) @Default(false) bool confirmedPayment,
    @JsonKey(ignore: true) @Default(0) int cartTotal,
    @JsonKey(ignore: true) @Default('') String restaurantName,
    @JsonKey(ignore: true) @Default('') String restaurantWalletAddress,
    @JsonKey(ignore: true) @Default('') String currentUrl,
  }) = _NetworkTabState;

  const NetworkTabState._();

  factory NetworkTabState.initial() {
    return NetworkTabState(
      paymentIntentID: '',
      selectedGBPxAmount: 0,
      selectedPPLAmount: 0,
      transferringTokens: false,
      errorCompletingPayment: false,
      confirmedPayment: false,
      cartTotal: 0,
      restaurantName: '',
    );
  }

  factory NetworkTabState.fromJson(dynamic json) =>
      _$NetworkTabStateFromJson(json as Map<String, dynamic>);
}

class NetworkTabStateConverter
    implements JsonConverter<NetworkTabState, Map<String, dynamic>?> {
  const NetworkTabStateConverter();

  @override
  NetworkTabState fromJson(Map<String, dynamic>? json) =>
      json != null ? NetworkTabState.fromJson(json) : NetworkTabState.initial();

  @override
  Map<String, dynamic> toJson(NetworkTabState instance) => instance.toJson();
}

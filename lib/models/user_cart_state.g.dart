// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_cart_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserCartState _$$_UserCartStateFromJson(Map<String, dynamic> json) =>
    _$_UserCartState(
      paymentIntentID: json['paymentIntentID'] as String,
      selectedGBPxAmount: (json['selectedGBPxAmount'] as num).toDouble(),
      selectedPPLAmount: (json['selectedPPLAmount'] as num).toDouble(),
      transferringTokens: json['transferringTokens'] as bool,
      errorCompletingPayment: json['errorCompletingPayment'] as bool,
      confirmedPayment: json['confirmedPayment'] as bool,
      restaurantName: json['restaurantName'] as String,
      cartTotal: json['cartTotal'] as int,
      restaurantWalletAddress: json['restaurantWalletAddress'] as String,
    );

Map<String, dynamic> _$$_UserCartStateToJson(_$_UserCartState instance) =>
    <String, dynamic>{
      'paymentIntentID': instance.paymentIntentID,
      'selectedGBPxAmount': instance.selectedGBPxAmount,
      'selectedPPLAmount': instance.selectedPPLAmount,
      'transferringTokens': instance.transferringTokens,
      'errorCompletingPayment': instance.errorCompletingPayment,
      'confirmedPayment': instance.confirmedPayment,
      'restaurantName': instance.restaurantName,
      'cartTotal': instance.cartTotal,
      'restaurantWalletAddress': instance.restaurantWalletAddress,
    };

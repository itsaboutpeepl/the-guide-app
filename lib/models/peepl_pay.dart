import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class PeeplPay {
  String token;
  String itemId;
  String contractAddress;
  String vendorWalletId;

  PeeplPay({
    @required this.itemId,
    @required this.token,
    @required this.contractAddress,
    @required this.vendorWalletId,
  });

  factory PeeplPay.fromJson(Map<String, dynamic> json) {
    return PeeplPay(
        itemId: json['itemId'],
        token: json['token'],
        contractAddress: json['contractAddress'],
        vendorWalletId: json['vendorWalletId']);
  }

  //TODO: Change names to match json data

  // Future<void> _paymentsetup(String payable, String currency, String availableTokens, String urlsegment, String apiKey, String contractAddress) async {
  //   final url = 'https://api.itsaboutpeepl.com/v1/paymentintent/create';

  //   //if _token == 'PPL' {convert = 10/1000 PPL}

  //     final response = await http.post(
  //       url, body: json.encode({
  //         'payable': payable,
  //         'currency': currency,
  //         'availableTokens': availableTokens,
  //         'contractAddress': contractAddress,

  //       }),

  //     );
  //     if (response.statusCode == 200) {
  //       return //Todo return walletID for Vendor
  //       /* tbd will we be sending GBPX and PPL on the fuse network?
  //       if so need contract abi/human readable */
  //     }

  // }
  // )
}

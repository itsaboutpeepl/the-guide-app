import 'package:flutter/material.dart';
import 'package:guide_liverpool/constants/enums.dart';
import 'package:guide_liverpool/models/tokens/token.dart';

class SendFlowArguments {
  String? name;
  final bool isMultiBridge;
  String? phoneNumber;
  String? accountAddress;
  double? amount;
  ImageProvider? avatar;
  SendType? sendType;
  Token? tokenToSend;
  final bool useBridge;

  SendFlowArguments({
    this.sendType,
    this.useBridge = false,
    this.tokenToSend,
    this.name,
    this.phoneNumber,
    this.isMultiBridge = false,
    this.accountAddress,
    this.amount,
    this.avatar,
  });
}

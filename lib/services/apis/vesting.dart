import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';
import '../../constants/urls.dart';
import '../../models/vestingInfo/schedule.dart';

class VestingService {
  List<Schedules> schedules = [];
  late Web3Client _web3client;
  final String _rpcUrl = UrlConstants.FUSE_RPC_URL;
  final String _wsUrl = UrlConstants.FUSE_WS_URL;
  final Dio dio;

  VestingService(this.dio) {
    dio.options.baseUrl = UrlConstants.FUSE_RPC_URL;
    dio.options.headers = Map.from({"Content-Type": 'application/json'});

    init();
  }

  Future<void> init() async {
    _web3client = Web3Client(
      _rpcUrl,
      http.Client(),
      socketConnector: () {
        return IOWebSocketChannel.connect(_wsUrl).cast<String>();
      },
    );
  }

  late ContractAbi _abiCode;
  late EthereumAddress _contractAddress;
  Future<void> getABI() async {
    String abiFile = await rootBundle.loadString('assets/vestingAbi.json');
    var jsonABI = jsonDecode(abiFile);
    _abiCode =
        ContractAbi.fromJson(jsonEncode(jsonABI['abi']), 'VestingContract');
    _contractAddress =
        EthereumAddress.fromHex('0xfC75C482058d7f521Db493D103247953d5C9d2AF');
  }
}

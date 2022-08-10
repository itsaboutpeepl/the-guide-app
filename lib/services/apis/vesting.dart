import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:guide_liverpool/models/vesting_state.dart';
import 'package:injectable/injectable.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/io.dart';
import '../../constants/urls.dart';

@lazySingleton
class VestingService {
  List<VestingState> schedules = [];
  late Web3Client web3client;
  final String _rpcUrl = UrlConstants.FUSE_RPC_URL;
  final String _wsUrl = UrlConstants.FUSE_WS_URL;
  final Dio dio;

  VestingService(this.dio) {
    dio.options.baseUrl = UrlConstants.FUSE_RPC_URL;
    dio.options.headers = Map.from({"Content-Type": 'application/json'});

    init();
  }

  Future<void> init() async {
    web3client = Web3Client(
      _rpcUrl,
      http.Client(),
      socketConnector: () {
        return IOWebSocketChannel.connect(_wsUrl).cast<String>();
      },
    );

    // await getCredentials();
  }

  Future<void> initAbi() async {
    await getABI(); // <- initial
    await getDeployedContract();
  }

  late ContractAbi _abiCode;
  late EthereumAddress _contractAddress;
  Future<void> getABI() async {
    String abiFile = await rootBundle.loadString('assets/vestingAbi.json');
    var jsonABI = jsonDecode(abiFile);
    _abiCode =
        ContractAbi.fromJson(jsonEncode(jsonABI['abi']), 'VestingContract');
    _contractAddress =
        // EthereumAddress.fromHex('0xfC75C482058d7f521Db493D103247953d5C9d2AF');
        EthereumAddress.fromHex('0x5bb44ae7226d777D77BCe67Ea4935F159D6B6d52');
  }

  // late EthPrivateKey _creds;
  //TODO: need user priv key to sign transaction
  // Future<void> getCredentials() async {
  //   // _creds = EthPrivateKey.fromHex();
  // }

  late DeployedContract deployedContract;
  late ContractFunction release;
  late ContractFunction computeReleasableAmount;
  late ContractFunction getVestingScheduleByAddressAndIndex;
  late ContractFunction getVestingSchedulesCountByBeneficiary;
  late ContractFunction getWithdrawableAmount;
  late ContractFunction getSchedulesIDsList;

  Future<void> getDeployedContract() async {
    deployedContract = DeployedContract(_abiCode, _contractAddress);
    getVestingScheduleByAddressAndIndex =
        deployedContract.function('getVestingScheduleByAddressAndIndex');
    getVestingSchedulesCountByBeneficiary =
        deployedContract.function('getVestingSchedulesCountByBeneficiary');
    computeReleasableAmount =
        deployedContract.function('computeReleasableAmount');
    release = deployedContract.function('release');
    getWithdrawableAmount = deployedContract.function('getWithdrawableAmount');

    getSchedulesIDsList =
        deployedContract.function('computeVestingScheduleIdForAddressAndIndex');
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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

  Future<void> getABI async {
    
  }

}

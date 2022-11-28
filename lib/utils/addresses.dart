import 'package:flutter_dotenv/flutter_dotenv.dart';

final String foreignNetwork =
    int.parse(dotenv.env['FOREIGN_NETWORK_ID']!) == 1 ? 'mainnet' : 'ropsten';

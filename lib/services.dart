import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:peepl/common/di/di.dart';
import 'package:peepl/common/router/routes.gr.dart';
import 'package:peepl/constants/urls.dart';
import 'package:peepl/services/apis/explorer.dart';
import 'package:peepl/services/apis/fuseswap.dart';
import 'package:peepl/services/apis/news.dart';
import 'package:peepl/utils/onboard/Istrategy.dart';
import 'package:phone_number/phone_number.dart';
import 'package:wallet_core/wallet_core.dart';

Web3? fuseWeb3;
Web3? ethereumWeb3;
final RootRouter rootRouter = getIt<RootRouter>();

final Explorer fuseExplorerApi = getIt<Explorer>(
  param1: UrlConstants.FUSE_EXPLORER_URL,
);

final Explorer ethereumExplorerApi = getIt<Explorer>(
  param1: UrlConstants.FUSE_EXPLORER_URL,
  param2: dotenv.env['ETHERSCAN_API_KEY'],
);

final API api = getIt<API>();

final FuseSwapService fuseSwapService = getIt<FuseSwapService>();

final NewsService newsService = getIt<NewsService>();

final Graph graph = getIt<Graph>();

final FirebaseAuth firebaseAuth = getIt<FirebaseAuth>();

final PhoneNumberUtil phoneNumberUtil = getIt<PhoneNumberUtil>();

final IOnBoardStrategy onBoardStrategy = getIt<IOnBoardStrategy>();

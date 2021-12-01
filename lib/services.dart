import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:guide_liverpool/common/di/di.dart';
import 'package:guide_liverpool/common/router/routes.gr.dart';
import 'package:guide_liverpool/constants/urls.dart';
import 'package:guide_liverpool/services/apis/explorer.dart';
import 'package:guide_liverpool/services/apis/fuseswap.dart';
import 'package:guide_liverpool/services/apis/news.dart';
import 'package:guide_liverpool/utils/onboard/Istrategy.dart';
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

import 'package:charge_wallet_sdk/charge_wallet_sdk.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:guide_liverpool/common/di/di.dart';
import 'package:guide_liverpool/common/router/routes.gr.dart';
import 'package:guide_liverpool/services/apis/news.dart';
import 'package:guide_liverpool/services/apis/peeplMedia.dart';
import 'package:guide_liverpool/services/apis/peeplPay.dart';
import 'package:guide_liverpool/services/apis/stripePay.dart';
import 'package:guide_liverpool/services/apis/vesting.dart';
import 'package:guide_liverpool/utils/onboard/Istrategy.dart';
import 'package:guide_liverpool/utils/stripe.dart';
import 'package:phone_number/phone_number.dart';

final RootRouter rootRouter = getIt<RootRouter>();

final ChargeApi chargeApi = getIt<ChargeApi>();

final NewsService newsService = getIt<NewsService>();

final VestingService vestingService = getIt<VestingService>();

final PeeplMediaService peeplMediaService = getIt<PeeplMediaService>();

final StripePayService stripePayService = getIt<StripePayService>();

final PeeplPayService peeplPaySerivce = getIt<PeeplPayService>();

final Graph graph = getIt<Graph>();

final FirebaseAuth firebaseAuth = getIt<FirebaseAuth>();

final FirebaseMessaging firebaseMessaging = getIt<FirebaseMessaging>();

final PhoneNumberUtil phoneNumberUtil = getIt<PhoneNumberUtil>();

final IOnBoardStrategy onBoardStrategy = getIt<IOnBoardStrategy>();

final StripeService stripeService = getIt<StripeService>();

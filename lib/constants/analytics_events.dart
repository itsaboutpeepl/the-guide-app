class AnalyticsEvents {
  static const String applicationInstalled = 'application_installed';
  static const String applicationOpened = 'application_opened';
  static const String requestReview = 'review_request';

  //Auth
  static const String login = 'login';
  static const String logout = 'logout';

  //Onboarding
  static const String createWallet = 'create_wallet'; //
  static const String restoreWallet = 'restore_wallet'; //
  static const String loginWithPhone = 'login_with_phone'; //
  static const String verify = 'verify_phone'; //
  static const String securityScreen = 'security_screen'; //
  static const String pincodeScreen = 'pincode_screen'; //
  static const String fillUserName = 'fill_user_name'; //
  static const String onboardingCompleted = 'onboarding_completed'; //

  //Home Screen
  static const String viewRestaurant = 'view_restaurant'; //
  static const String switchFulfilmentMethod = 'switch_fulfilment_method'; //
  static const String openDrawer = 'open_drawer'; //
  static const String changeOutcode = 'change_outcode'; //

  //Drawer
  static const String viewAllOrders = 'view_all_orders'; //
  static const String viewSchOrders = 'view_sch_orders'; //
  static const String viewAccount = 'view_account'; //
  static const String viewFAQ = 'view_faq'; //
  static const String viewAbout = 'view_about'; //

  //Restaurant Menu Screen
  static const String viewItem = 'view_item'; //
  static const String addItem = 'add_item'; //

  //Checkout
  static const String viewCheckout = 'view_checkout'; //
  static const String clearCart = 'clear_cart'; //
  static const String changeTimeSlot = 'change_timeslot'; //
  static const String addInstructions = 'add_instructions'; //
  static const String addDiscount = 'add_discount'; //
  static const String changeAddress = 'change_address'; //
  static const String changePaymentMethod = 'change_payment_method'; //
  static const String placeOrder = 'place_order'; //
  static const String updateQuantity = 'update_quantity'; //
  static const String selectTip = 'select_tip';

  //Address
  static const String addAddress = 'add_address'; //
  static const String editAddress = 'edit_address'; //
  static const String deleteAddress = 'delete_address'; //
  static const String selectAddress = 'select_address'; //

  //Payment
  static const String payStripe = 'pay_stripe';
  static const String payPeepl = 'pay_peepl';
  static const String payQRVegi = 'pay_QR_vegi';
  static const String payment = 'payment';
  static const String mint = 'mint';
  static const String orderGen = 'order_generated';

  static const String getHelp = 'get_help';
}

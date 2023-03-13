import 'dart:convert';

import 'package:sekure/services/auth_service.dart';

const String secret = "5c55QGEdvE6HXoM4MFL72G5S";

const String key = "rzp_live_GU39x6rnevKg3d";

const String mapsApikey = "AIzaSyAvilSJMgjUct1JT0CYcmAm4f8rPbbp2RQ";

const String mapUrl = 'https://tile.openstreetmap.org/{z}/{x}/{y}.png';

const String ordersRootUrl = "https://api.razorpay.com/v1/orders";

const String paymentRootUrl = "https://api.razorpay.com/v1/payments";

const String rootUrl = "http://3.108.130.244/sekureapis";

const String userControllerUrl = "$rootUrl/api";

const String authenticateUrl = "$rootUrl/authenticate";

const String allUsersUrl = "$rootUrl/user/getall";

const String allActiveUsersUrl = "$rootUrl/user/all";

const String userByUsernameUrl = "$rootUrl/user/userName";

const String userByMobileNumUrl = "$rootUrl/user/mobile";

const String updateUserUrl = "$rootUrl/user";

const String forgotPwdUrl = "$rootUrl/user/forgot";

const String otpLoginUrl = "$rootUrl/user/otp-login";

const String requestOtpUrl = "$rootUrl/user/request-otp";

const String verifyMobileNoUrl = "$rootUrl/user/verify-phone-number";

const String cpmsRootUrl = "https://ninedots.axonifytech.com/avocado/api";

const String startTranxUrl = "$cpmsRootUrl/transaction";

const String stopTranxUrl = "$cpmsRootUrl/transaction";

const String getAllTranxUrl = "$cpmsRootUrl/transaction";

const String allTranxByStatusUrl = "$cpmsRootUrl/transaction/all/sessionStatus";

const String failedTranxUrl = "$cpmsRootUrl/transaction/failed";

const String meterValuesUrl = "$cpmsRootUrl/transaction/meterValues";

const String tranxByUserNameUrl = "$cpmsRootUrl/transaction";

const String tranxBySessionIdUrl = "$cpmsRootUrl/transaction/sessionId";

const String tranxByStatusUrl = "$cpmsRootUrl/transaction/sessionStatus";

const String tranxByStatusAndDateRangeUrl =
    "$cpmsRootUrl/transaction/dateRange/sessionStatus";

const String tranxByDateRangeUrl = "$cpmsRootUrl/transaction";

const String walletTranxUrl = "$cpmsRootUrl/userWallet";

const String allWalletTranxByTypeUrl =
    "$cpmsRootUrl/userWallet/all/transactionType";

const String walletTranxByUserNameUrl = "$cpmsRootUrl/userWallet/userName";

const String walletTranxByTypeUrl = "$cpmsRootUrl/userWallet/transactionType";

const String walletTranxByTypeAndDateRangeUrl =
    "$cpmsRootUrl/userWallet/dateRange/transactionType";

const String walletTranxByStatusAndDateRangeUrl =
    "$cpmsRootUrl/userWallet/dateRange/transactionStatus";

const String walletTranxByStatusUrl =
    "$cpmsRootUrl/userWallet/transactionStatus";

const String walletTranxByOrderUrl = "$cpmsRootUrl/userWallet/orderId";

const String walletTranxByTransactionIdUrl =
    "$cpmsRootUrl/userWallet/walletTransactionId";

const String walletTranxBySessionIdUrl = "$cpmsRootUrl/userWallet/sessionId";

const String walletBalanceUrl = "$cpmsRootUrl/userWalletAmount";

const String raiseATicketUrl = "$cpmsRootUrl/support";

const String allTicketsUrl = "$cpmsRootUrl/support";

const String ticketsByTicketStatusUrl = "$cpmsRootUrl/support/ticketStatus";

const String ticketsByUsernameUrl = "$cpmsRootUrl/support";

const String deviceManagementRootUrl =
    "https://ninedots.axonifytech.com/banana/api";

const String addDeviceUrl = "$deviceManagementRootUrl/devices";

const String getAllDevicesUrl = "$deviceManagementRootUrl/devices";

const String getAllDevicesConfig = "$deviceManagementRootUrl/deviceConfig";

Map<String, String> basicHeader = {'Content-Type': 'application/json; charset=UTF-8'};

Map<String, String> authHeader() => {
  'Content-Type': 'application/json; charset=UTF-8',
  'Authorization': 'Bearer ${AuthService.to.authToken}'
};

Map<String, String> ordersHeader = {
  'Content-Type': 'application/json; charset=UTF-8',
  "Authorization": "Basic ${base64Encode(utf8.encode('$key:$secret'))} "
};

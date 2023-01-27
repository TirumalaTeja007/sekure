import 'dart:convert';

import 'package:get/get.dart';
import 'package:smartsocket/utils/local_storage.dart';

import '../../../../constants/network_constants.dart';
import '../../../../models/user_model.dart';
import '../../../../services/auth_service.dart';

enum MessageProcessingState { initiated, processing, completed, failed }

class UserProfileController extends GetxController {
  final idRepo = IdRepository();

  RxBool refreshSessionsChart = false.obs;

  RxDouble walletBalance = 0.0.obs;

  Rx<UserData> userData = UserData(
          userId: 0,
          firstName: "firstName",
          lastName: "lastName",
          userName: "userName",
          email: "email",
          profilePicture: "profilePicture",
          countryCallingCode: "countryCallingCode",
          countryCode: "countryCode",
          phoneNumber: "phoneNumber",
          role: "role",
          isLoggedIn: true)
      .obs;

  Rx<MessageProcessingState> fetchUserInfoState =
      MessageProcessingState.initiated.obs;

  Rx<MessageProcessingState> fetchWalletBalanceState =
      MessageProcessingState.initiated.obs;

  Rx<MessageProcessingState> fetchSessionInfoState =
      MessageProcessingState.initiated.obs;

  RxMap walletBalanceResponse = {"errorInfo": "N/A", "data": ""}.obs;

  RxMap userInfoResponse = {"errorInfo": "N/A"}.obs;

  RxMap sessionInfoResponse = {"errorInfo": "N/A"}.obs;

  @override
  void onInit() async {
    await fetchUserInfo();
    await fetchUserWalletBalance();
    await fetchUserSessionInfo();
    super.onInit();
  }

  fetchUserInfo() async {
    fetchUserInfoState.value = MessageProcessingState.processing;

    late UserData userData;

    if (idRepo.isStackedArgsPresent('userInfoArgs')) {
      String? jsonString = await idRepo.getStackedArgs('userInfoArgs');
      userData = UserData.fromMap(jsonDecode(jsonString!));
    } else {
      String? jsonString = await idRepo.getUserData();
      userData = UserData.fromMap(jsonDecode(jsonString!));
    }

    dynamic authResponse = await AuthService.to
        .authenticate({"userName": "SS-0001", "password": "123456"});

    if (AuthService.to.authToken.isNotEmpty && authResponse.isEmpty) {
      await GetConnect()
          .get("$rootUrl/api/${userData.userName}", headers: authHeader())
          .then((response) async {
        if (!response.hasError && response.body["status"] == "true") {
          Map data = response.body["data"];

          userInfoResponse.value["userId"] = userData.userId.toString();

          userInfoResponse.value["role"] = userData.role;

          userInfoResponse.value["userName"] = data["userName"];

          userInfoResponse.value["firstName"] = data["firstName"];

          userInfoResponse.value["lastName"] = data["lastName"];

          userInfoResponse.value["phoneNumber"] =
              data["phoneNumber"].toString();

          userInfoResponse.value["email"] = data["email"];

          fetchUserInfoState.value = MessageProcessingState.completed;
        } else {
          userInfoResponse.value["errorInfo"] =
              response.body["message"] ?? "No Data";
          fetchUserInfoState.value = MessageProcessingState.completed;
        }
      });
    } else {
      userInfoResponse.value["errorInfo"] =
          authResponse.body["message"] ?? "No Data";
      fetchUserInfoState.value = MessageProcessingState.completed;
    }
  }

  fetchUserWalletBalance() async {
    fetchWalletBalanceState.value = MessageProcessingState.processing;

    dynamic authResponse = await AuthService.to
        .authenticate({"userName": "SS-0001", "password": "123456"});

    if (AuthService.to.authToken.isNotEmpty && authResponse.isEmpty) {
      await GetConnect()
          .get("$walletBalanceUrl/SS-8598", headers: basicHeader)
          .then((response) async {
        if (!response.hasError) {
          Map data = response.body;

          walletBalanceResponse.value["totalWalletAmount"] =
              data["totalWalletAmount"].toStringAsFixed(2);

          walletBalanceResponse.value["updatedTime"] = data["updatedTime"];

          fetchWalletBalanceState.value = MessageProcessingState.completed;
        } else {
          walletBalanceResponse["errorInfo"] =
              response.body["message"] ?? "No Data";
          fetchWalletBalanceState.value = MessageProcessingState.failed;
        }
      });
    } else {
      walletBalanceResponse["errorInfo"] =
          authResponse.body["message"] ?? "No Data";
      fetchWalletBalanceState.value = MessageProcessingState.failed;
    }
  }

  fetchUserSessionInfo() async {
    fetchSessionInfoState.value = MessageProcessingState.processing;

    dynamic authResponse = await AuthService.to
        .authenticate({"userName": "SS-0001", "password": "123456"});

    if (AuthService.to.authToken.isNotEmpty && authResponse.isEmpty) {
      await GetConnect()
          .get("$walletBalanceUrl/SS-8598", headers: basicHeader)
          .then((response) async {
        if (!response.hasError) {
          Map data = response.body;

          sessionInfoResponse.value["totalWalletAmount"] =
              data["totalWalletAmount"].toStringAsFixed(2);

          sessionInfoResponse.value["updatedTime"] = data["updatedTime"];

          fetchSessionInfoState.value = MessageProcessingState.completed;
        } else {
          sessionInfoResponse["errorInfo"] =
              response.body["message"] ?? "No Data";
          fetchSessionInfoState.value = MessageProcessingState.failed;
        }
      });
    } else {
      sessionInfoResponse["errorInfo"] =
          authResponse.body["message"] ?? "No Data";
      fetchSessionInfoState.value = MessageProcessingState.failed;
    }
  }
}

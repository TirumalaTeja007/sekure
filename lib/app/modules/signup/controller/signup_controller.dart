import 'dart:convert';
import 'package:get/get.dart';
import 'package:smartsocket/api/efi_http_exception_handler.dart';
import 'package:smartsocket/app/routes/app_pages.dart';
import 'package:smartsocket/constants/network_constants.dart';
import 'package:smartsocket/services/auth_service.dart';
import 'package:smartsocket/utils/local_storage.dart';

class SignupController extends GetxController {
  RxBool showPassword = false.obs;

  RxBool agreedToTerms = false.obs;

  RxString userRole = "User Role".obs;

  addAUser(Map payload) async {
    dynamic errorMessage = "";

    errorMessage = await AuthService.to
        .authenticate({"userName": "SS-0001", "password": "123456"});

    if (AuthService.to.authToken.isNotEmpty && errorMessage.isEmpty) {
      payload["roleId"] =
          ["User Role", "Super Admin", "User", "CPO"].indexOf(userRole.value);
      await GetConnect()
          .post("$userControllerUrl/registeruser", payload,
              headers: authHeader())
          .then((response) async {
        if (!response.hasError && response.body["status"] == "true") {
          AuthService.to.isLoggedIn ? "" : Get.toNamed(Routes.login);
        } else {
          errorMessage = response;
        }
      });
    }

    if (errorMessage != "") httpException(errorMessage);
  }
}

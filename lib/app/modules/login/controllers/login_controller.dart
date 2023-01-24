import 'dart:convert';

import 'package:smartsocket/api/api_calls.dart';
import 'package:smartsocket/api/efi_http_exception_handler.dart';
import 'package:smartsocket/app/routes/app_pages.dart';
import 'package:smartsocket/constants/network_constants.dart';
import 'package:smartsocket/services/app_state_service.dart';
import 'package:smartsocket/services/auth_service.dart';
import 'package:smartsocket/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool showPassword = false.obs;

  @override
  void onInit() async {
    super.onInit();
  }

  login(args) async {
    dynamic errorMessage = "";

    errorMessage = await AuthService.to.authenticate(args);

    if (AuthService.to.authToken.isNotEmpty && errorMessage.isEmpty) {
      await GetConnect()
          .post("$userControllerUrl/login", args, headers: authHeader())
          .then((response) async {
        if (!response.hasError && response.body["status"] == "true") {
          errorMessage = await _fetchUserInfoByUsername(args);
        } else {
          errorMessage = response;
        }
      });
    }

    if (errorMessage != "") httpException(errorMessage);
  }

  _fetchUserInfoByUsername(args) async {
    dynamic errorMessage = "";

    errorMessage = await AuthService.to.authenticate(args);

    if (AuthService.to.authToken.isNotEmpty && errorMessage.isEmpty) {
      await GetConnect()
          .get("$userControllerUrl/${args["userName"]}", headers: authHeader())
          .then((response) async {
        print(response.body);
        if (!response.hasError && response.body["status"] == "true") {
          Map data = response.body["data"];

          data["password"] = args["password"];

          data["isLoggedIn"] = true;

          await IdRepository().saveUserData(jsonEncode(data));

          AuthService.to.login();

          Get.toNamed(Routes.dashboard);
        } else {
          errorMessage = response;
        }
      });
    }

    return errorMessage;
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:smartsocket/api/efi_http_exception_handler.dart';
import 'package:smartsocket/app/routes/app_pages.dart';
import 'package:smartsocket/constants/network_constants.dart';
import 'package:smartsocket/services/auth_service.dart';
import 'package:smartsocket/utils/debouncer.dart';
import 'package:smartsocket/api/api_calls.dart';

class UserSignupController extends GetxController {
  RxBool showPassword = false.obs;

  RxBool agreedToTerms = false.obs;

  @override
  void onInit() async {
    super.onInit();
  }

  addAUser(Map payload) async {
    dynamic errorMessage = "";

    errorMessage = await AuthService.to.authenticate();

    if (AuthService.to.authToken.isNotEmpty && errorMessage.isEmpty) {
      await GetConnect()
          .post("https://ninedots.axonifytech.com/apple/api/user", payload,
          headers: basicHeader)
          .then((response) async {
        print(response.body);
        if (!response.hasError) {
          if (response.body["status"] == "true") {
            payload["id"] = response.body["data"];
            Get.toNamed(Routes.login);
          } else {
            errorMessage = response;
          }
        } else {
          errorMessage = response;
        }
      });
    }

    if (errorMessage != "") httpException(errorMessage);
  }
}
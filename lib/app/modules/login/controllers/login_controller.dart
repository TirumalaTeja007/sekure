import 'dart:convert';

import 'package:smartsocket/api/api_calls.dart';
import 'package:smartsocket/app/routes/app_pages.dart';
import 'package:smartsocket/constants/network_constants.dart';
import 'package:smartsocket/services/auth_service.dart';
import 'package:smartsocket/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController instance = Get.find();

  RxString countryCode = "IN".obs;

  RxString dialCode = "+91".obs;

  RxString receivedOtp = "".obs;

  RxBool agreedToTerms = false.obs;

  RxInt forgotPwdScreenIndex = 0.obs;

  RxInt loginScreenIndex = 0.obs;

  // GetStorage users = GetStorage("Users");

  RxBool showPassword = false.obs;

  RxString _token = "".obs;

  @override
  onInit() {
    super.onInit();
  }

  authenticate(BuildContext context, GlobalKey<FormState> formKey,
      Map<String, dynamic> payload) async {
    FocusScope.of(context).unfocus();
    if (formKey.currentState!.validate()) {
      switch (loginScreenIndex.value) {
        case 0:
          final response = await callPostRequest(
              routeID: "/Login",
              api: authenticateUrl,
              payload: payload,
              header: {'Content-Type': 'application/json'});

          if (response.runtimeType != String) {
            if (response.statusCode == 200) {
              _token.value = jsonDecode(response.body)["jwtToken"];

              IdRepository().saveUserData(
                  jsonEncode({"isLoggedIn": true, "token": _token.value}));

              AuthService.to.login();

              final thenTo = context.params['then'];

              Get.offNamed(thenTo ?? Routes.home);
            } else {
              return "Exception";
            }
          } else {
            return "Exception";
          }
          break;
        case 1:
          break;
      }
    }
  }


  signup(GlobalKey<FormState> formKey, Map<String, String> payload) async {
    FocusScope.of(Get.key.currentContext!).unfocus();
    if (agreedToTerms.value == true) {
      if (formKey.currentState!.validate()) {
        // final response = await userSignUp(payload);
        // if (response.runtimeType != String) clearTextFields();
      }
    }
  }

  forgotPassword(
      GlobalKey<FormState> formKey, Map<String, String> textControllers) async {
    FocusScope.of(Get.key.currentContext!).unfocus();
    if (formKey.currentState!.validate()) {
      switch (forgotPwdScreenIndex.value) {
        case 0:
          forgotPwdScreenIndex.value = 1;
          break;
        case 1:
          forgotPwdScreenIndex.value = 2;
          break;
        case 2:
          forgotPwdScreenIndex.value = 3;
      }
    }
  }

  void clearTextFields() {
    receivedOtp.value = "";
    agreedToTerms.value = false;
  }
}

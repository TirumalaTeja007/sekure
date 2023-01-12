import 'dart:convert';

import 'package:smartsocket/api/api_calls.dart';
import 'package:smartsocket/api/efi_http_exception_handler.dart';
import 'package:smartsocket/app/routes/app_pages.dart';
import 'package:smartsocket/constants/network_constants.dart';
import 'package:smartsocket/services/auth_service.dart';
import 'package:smartsocket/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool showPassword = false.obs;

  authenticate(BuildContext context, GlobalKey<FormState> formKey,
      Map<String, dynamic> payload) async {
    FocusScope.of(context).unfocus();

    final response = await callPostRequest(
        routeID: "/Login",
        api: "https://ninedots.axonifytech.com/apple/api/user/login",
        payload: payload,
        header: {'Content-Type': 'application/json'});

    if (response.runtimeType != String) {
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body)["data"];

        data["isLoggedIn"] = true;

        IdRepository().saveUserData(jsonEncode(data));

        AuthService.to.login();

        final thenTo = context.params['then'];

        Get.offNamed(thenTo ?? Routes.dashboard);
      } else {
        return "Exception";
      }
    } else {
      return "Exception";
    }
  }

  login(args) async {
    await _findUserByMobileNumber(args["phoneNumber"]);
  }

  _findUserByMobileNumber(String phoneNumber) async {
    dynamic errorMessage = "";

    bool recordFound = false;

    errorMessage = await AuthService.to.authenticate();

    if (AuthService.to.authToken.isNotEmpty && errorMessage.isEmpty) {
      await GetConnect()
          .get("$userControllerUrl/getallUsers", headers: authHeader())
          .then((response) async {
        if (!response.hasError) {
          if (response.body["status"] == "true") {
            List data = response.body["data"];
            for (var i in data) {
              if (i["phoneNumber"] == phoneNumber.toString()) {
                i["isLoggedIn"] = true;

                await IdRepository().saveUserData(jsonEncode(i));

                AuthService.to.login();

                Get.offNamed(Routes.dashboard);
              }
            }
          } else {
            if (response.body["message"] != "No User Details found") {
              errorMessage = response;
            }
          }
        } else {
          errorMessage = response;
        }
      });
    }

    if (errorMessage != "") httpException(errorMessage);

    return {"recordFound": recordFound, "error": errorMessage};
  }
}

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

class UsersManagementController extends GetxController {
  late LinkedScrollControllerGroup controllers;

  late ScrollController bodyController;

  RxBool processing = false.obs;

  RxList usersList = [].obs;

  RxString errorMessage = "".obs;

  TextEditingController searchController = TextEditingController();

  Debouncer searchDebouncer = Debouncer(milliseconds: 300);

  RxString searchedKeyword = "".obs;

  RxBool showPassword = false.obs;

  static const tableHeaders = {
    "id": "ID",
    "userName": "Username",
    "mobileNumber": "Mobile Number",
    "name": "Name",
    "email": "Email Address",
    "createdTime": "Created Time",
    "createdBy": "Created By",
    "updatedTime": "Updated Time",
    "updatedBy": "Updated By",
    "status": "Status"
  };

  @override
  void onInit() async {
    controllers = LinkedScrollControllerGroup();
    bodyController = controllers.addAndGet();
    getAllUsers();
    super.onInit();
  }

  addAUser(Map payload) async {
    dynamic errorMessage = "";

    errorMessage = await AuthService.to
        .authenticate({"userName": "SS-0001", "password": "123456"});

    if (AuthService.to.authToken.isNotEmpty && errorMessage.isEmpty) {
      await GetConnect()
          .post("$userControllerUrl/registeruser", payload,
              headers: authHeader())
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

  getAllUsers() async {
    processing.value = true;
    errorMessage.value = "";
    final response = await callGetRequestWithoutParameters(
        routeID: "/UserInfo", api: allUsersUrl, header: basicHeader);
    if (response.runtimeType != String) {
      if (jsonDecode(response.body).length != 0) {
        usersList.value = jsonDecode(response.body);

        usersList.insert(0, tableHeaders);

        await Future.delayed(const Duration(milliseconds: 500));

        print(usersList.length);

        processing.value = false;
      } else {
        processing.value = false;

        errorMessage.value = "No data";
      }
    } else {
      processing.value = false;

      errorMessage.value = response;
    }
  }
}

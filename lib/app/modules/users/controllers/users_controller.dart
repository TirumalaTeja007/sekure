import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:smartsocket/api/efi_http_exception_handler.dart';
import 'package:smartsocket/app/routes/app_pages.dart';
import 'package:smartsocket/constants/network_constants.dart';
import 'package:smartsocket/services/app_state_service.dart';
import 'package:smartsocket/services/auth_service.dart';
import 'package:smartsocket/utils/debouncer.dart';
import 'package:smartsocket/api/api_calls.dart';
import 'package:smartsocket/utils/local_storage.dart';

class UsersController extends GetxController {
  late LinkedScrollControllerGroup controllers;

  late ScrollController bodyController;

  RxBool processing = false.obs;

  RxList usersList = [].obs;

  RxString errorMessage = "".obs;

  TextEditingController searchController = TextEditingController();

  Debouncer searchDebouncer = Debouncer(milliseconds: 300);

  RxString searchedKeyword = "".obs;

  RxString userRole = "User".obs;

  RxBool showPassword = false.obs;

  RxString sortByRole = "All".obs;

  final tableHeaders = {
    "userId": "ID",
    "userName": "Username",
    "firstName": "First Name",
    "lastName": "Last Name",
    "phoneNumber": "Phone Number",
    "email": "Email Address",
    "role": "Role",
    "active": "Status",
    "actions": "Actions"
  };

  @override
  void onInit() async {
    if (AppStateService.to.delegate.pageSettings!.path ==
        "/dashboard/usersOverview") {
      controllers = LinkedScrollControllerGroup();
      bodyController = controllers.addAndGet();
      fetchAllUsers();
    }
    super.onInit();
  }

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

  fetchAllUsers() async {
    processing.value = true;

    String? jsonString = await IdRepository().getUserData();

    Map userData = jsonDecode(jsonString!);

    dynamic authResponse = await AuthService.to
        .authenticate({"userName": "SS-0001", "password": "123456"});

    if (AuthService.to.authToken.isNotEmpty && authResponse.isEmpty) {
      await GetConnect()
          .get("$rootUrl/api/getallUsers", headers: authHeader())
          .then((response) async {
        print(response.body);
        if (!response.hasError && response.body["status"] == "true") {
          usersList.value = response.body["data"];
          usersList.insert(0, tableHeaders);
          processing.value = false;
        } else {
          processing.value = false;
          errorMessage.value = response.body["message"];
        }
      });
    } else {
      processing.value = false;
      errorMessage.value = authResponse.body["message"];
    }
  }
}

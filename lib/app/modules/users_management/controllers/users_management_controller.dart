import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:smartsocket/constants/network_constants.dart';
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
    final response = await callPostRequest(
        routeID: "/SignUp",
        api: signUpUrl,
        payload: payload,
        header: basicHeader);

    if (response.runtimeType != String) {
      if (response.statusCode == 200 &&
          jsonDecode(response.body)["status"] == true) {
        //  callSnackBar("Sign-up", "Registration successful! Please Login");
        //Get.rootDelegate.toNamed(Routes.login);
      } else {}
    }
    return response;
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

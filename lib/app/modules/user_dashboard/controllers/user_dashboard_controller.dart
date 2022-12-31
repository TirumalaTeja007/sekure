import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:smartsocket/api/api_calls.dart';
import 'package:smartsocket/constants/network_constants.dart';
import 'package:smartsocket/models/user_model.dart';
import 'package:smartsocket/utils/local_storage.dart';

class UserDashboardController extends GetxController {
  final tabList = [
    "Overview",
    "Session History",
    "Payment History",
    "Tickets Raised",
    "User Settings"
  ];
  late LinkedScrollControllerGroup controllers;

  late ScrollController bodyController;

  final idRepo = IdRepository();

  RxBool processing = false.obs;

  UserData userData = UserData(
      id: 0,
      name: "name",
      userName: "userName",
      password: "password",
      email: "email",
      profilePicture: "profilePicture",
      countryCallingCode: "countryCallingCode",
      countryCode: "countryCode",
      mobileNumber: "mobileNumber",
      isLoggedIn: true);

  @override
  onInit() async {
    super.onInit();
    getUserInfo();
    controllers = LinkedScrollControllerGroup();
    bodyController = controllers.addAndGet();
  }

  getUserInfo() async {
    processing.value = true;
    if (idRepo.isStackedArgsPresent('userInfoArgs')) {
      String? jsonString = await idRepo.getStackedArgs('userInfoArgs');
      userData = UserData.fromMap(jsonDecode(jsonString!));
    } else {
      String? jsonString = await idRepo.getUserData();
      userData = UserData.fromMap(jsonDecode(jsonString!));
    }
    final response = await callGetRequestWithoutParameters(
        routeID: "/UserInfo",
        api: "$userByUsernameUrl/${userData.userName}",
        header: basicHeader);
    if (response.runtimeType != String) {
      if (jsonDecode(response.body).length != 0) {
        userData = UserData.fromMap(jsonDecode(response.body));
      }
    }
    update();
    processing.value = false;
  }
}

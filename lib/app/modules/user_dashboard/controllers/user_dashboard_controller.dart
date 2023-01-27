import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:smartsocket/api/api_calls.dart';
import 'package:smartsocket/constants/network_constants.dart';
import 'package:smartsocket/models/user_model.dart';
import 'package:smartsocket/utils/local_storage.dart';

import '../../../../services/auth_service.dart';

class UserDashboardController extends GetxController {
  final tabList = [
    "User Dashboard",
    "User Session History",
    "User Payment History",
    "User Support Tickets",
    "User Settings"
  ];
  late LinkedScrollControllerGroup controllers;

  late ScrollController bodyController;

  final idRepo = IdRepository();

  RxBool processing = false.obs;

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
      userData.value = UserData.fromMap(jsonDecode(jsonString!));
    } else {
      String? jsonString = await idRepo.getUserData();
      userData.value = UserData.fromMap(jsonDecode(jsonString!));
    }

    update();
    processing.value = false;
  }

  onTapTabButtons() {}
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:smartsocket/constants/network_constants.dart';
import 'package:smartsocket/services/auth_service.dart';
import 'package:smartsocket/utils/debouncer.dart';
import 'package:smartsocket/api/api_calls.dart';
import 'package:smartsocket/utils/local_storage.dart';

class SessionManagementController extends GetxController {
  late LinkedScrollControllerGroup controllers;

  late ScrollController bodyController;

  RxBool processing = false.obs;

  RxList sessionInfo = [].obs;

  RxString errorMessage = "".obs;

  TextEditingController searchController = TextEditingController();

  Debouncer searchDebouncer = Debouncer(milliseconds: 300);

  RxString searchedKeyword = "".obs;

  final idRepo = IdRepository();

  static const tableHeaders = {
    "id": "ID",
    "userName": "Username",
    'chargePointId': "Charge Point ID",
    "sessionId": "Session ID",
    "sessionStatusEnum": "Session Status",
    "chargingDuration": "Charging Duration",
    "timeLimit": "Time Limit",
    "startDateTime": "Start Time",
    "endDateTime": "End Time",
    "energyConsumed": "Energy Consumed",
    "sessionTypeEnum": "Session Type",
    "stopChargeReason": "Stop Charge Reason",
    "createdTime": "Created Time",
    "createdBy": "Created By",
    "updatedTime": "Updated Time",
    "updatedBy": "Updated By",
  };

  @override
  void onInit() async {
    controllers = LinkedScrollControllerGroup();
    bodyController = controllers.addAndGet();
    getUserSessionHistory();
    super.onInit();
  }

  getUserSessionHistory() async {
    processing.value = true;

    String? jsonString = await IdRepository().getUserData();

    Map userData = jsonDecode(jsonString!);

    bool isAdmin =
        userData["roleName"].toString().toLowerCase().contains("user")
            ? false
            : true;

    dynamic authResponse = await AuthService.to
        .authenticate({"userName": "SS-0001", "password": "123456"});

    if (AuthService.to.authToken.isNotEmpty && authResponse.isEmpty) {
      await GetConnect()
          .get("$rootUrl/sessioninfoapi/getsessionbystatus",
              headers: authHeader())
          .then((response) async {
        if (!response.hasError && response.body["status"] == "true") {
          sessionInfo.value = response.body["data"];
          sessionInfo.insert(0, tableHeaders);
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

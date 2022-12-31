import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:smartsocket/constants/network_constants.dart';
import 'package:smartsocket/utils/debouncer.dart';
import 'package:smartsocket/api/api_calls.dart';
import 'package:smartsocket/utils/local_storage.dart';

class SessionInformationController extends GetxController {
  late LinkedScrollControllerGroup controllers;

  late ScrollController bodyController;

  RxBool processing = false.obs;

  RxMap sessionInfo = {}.obs;

  RxString errorMessage = "".obs;

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
    super.onInit();
  }

  streamSessionInfo() async {
    processing.value = true;
    errorMessage.value = "";
    String? jsonString = await idRepo.getStackedArgs('sessionInfoArgs');
    Map data = jsonDecode(jsonString!);
    final response = await callGetRequestWithoutParameters(
        routeID: "/SessionInformation",
        api: "$tranxBySessionIdUrl/${data["sessionId"]}",
        header: {'Content-Type': 'application/json; charset=UTF-8'});

    if (response.runtimeType != String && response.statusCode == 200) {
      final sessionInfo = jsonDecode(response.body)["data"];
      if (sessionInfo != []) {
        return sessionInfo;
      } else {
        return "No data";
      }
    } else {
      return response;
    }
  }
}

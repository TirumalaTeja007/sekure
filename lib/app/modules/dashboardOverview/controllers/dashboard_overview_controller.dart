import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:smartsocket/utils/local_storage.dart';

import '../../../../constants/network_constants.dart';
import '../../../../services/auth_service.dart';
import '../../user_profile/controller/user_profile_controller.dart';

class DashboardOverviewController extends GetxController {
  final now = DateTime.now().obs;

  LinkedScrollControllerGroup controllers = LinkedScrollControllerGroup();

  final idRepository = IdRepository();

  late ScrollController headerController;

  late ScrollController bodyController;

  RxBool refreshDevicesChart = true.obs;

  RxBool refreshSessionsChart = true.obs;

  Rx<MessageProcessingState> fetchSessionInfoState =
      MessageProcessingState.initiated.obs;

  RxMap<dynamic, dynamic> sessionInfoResponse = {"errorInfo": "N/A"}.obs;

  @override
  void onReady() async {
    await fetchSessionInfo();
    super.onReady();
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        now.value = DateTime.now();
      },
    );
  }

  fetchSessionInfo() async {
    fetchSessionInfoState.value = MessageProcessingState.processing;

    dynamic authResponse = await AuthService.to
        .authenticate({"userName": "SS-0001", "password": "123456"});

    if (AuthService.to.authToken.isNotEmpty && authResponse.isEmpty) {
      await GetConnect()
          .get("$tranxByUserNameUrl/SS-8598", headers: basicHeader)
          .then((response) async {
        print(response.body);
        if (!response.hasError) {
          List data = response.body["data"];

          int ongoingCount = 0,
              completedCount = 0,
              pendingCount = 0,
              miscellaneousCount = 0;

          for (var x in data) {
            if (x["startDateTime"].runtimeType != Null) {
              int startTime = DateTime.parse(x["startDateTime"])
                  .toLocal()
                  .millisecondsSinceEpoch;
              int epochTime = DateTime.now().millisecondsSinceEpoch;
              if (x["sessionStatusEnum"] == "START" &&
                  startTime - epochTime > 86400000) {
                ongoingCount++;
              } else if (x["sessionStatusEnum"] == "START" &&
                  startTime - epochTime <= 86400000) {
                pendingCount++;
              } else if (x["sessionStatusEnum"] == "STOP" &&
                  x["stopChargeReason"] == "Charging completed") {
                completedCount++;
              } else {
                miscellaneousCount++;
              }
            }
          }

          print(data);

          sessionInfoResponse["data"] = jsonEncode({
            "sessionInfo": [
              {
                "name": "Total",
                "value": data.length.toDouble(),
                "color": 0,
                "radius": "90%"
              },
              {
                "name": "Ongoing",
                "value": ongoingCount.toDouble(),
                "color": 1,
                "radius": "90%"
              },
              {
                "name": "Completed",
                "value": completedCount.toDouble(),
                "color": 2,
                "radius": "90%"
              },
              {
                "name": "Pending",
                "value": pendingCount.toDouble(),
                "color": 3,
                "radius": "90%"
              },
              {
                "name": "Miscellaneous",
                "value": miscellaneousCount.toDouble(),
                "color": 4,
                "radius": "90%"
              },
            ]
          });

          print(sessionInfoResponse);

          fetchSessionInfoState.value = MessageProcessingState.completed;
        } else {
          sessionInfoResponse.value["errorInfo"] =
              response.body["message"] ?? "No Data";
          fetchSessionInfoState.value = MessageProcessingState.failed;
        }
      });
    } else {
      sessionInfoResponse.value["errorInfo"] =
          authResponse.body["message"] ?? "No Data";
      fetchSessionInfoState.value = MessageProcessingState.failed;
    }
  }
}

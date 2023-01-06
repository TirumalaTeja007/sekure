import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:smartsocket/utils/local_storage.dart';

class DashboardOverviewController extends GetxController {
  final now = DateTime.now().obs;

  LinkedScrollControllerGroup controllers = LinkedScrollControllerGroup();

  final idRepository = IdRepository();

  late ScrollController headerController;

  late ScrollController bodyController;

  RxBool refreshDevicesChart = true.obs;

  RxBool refreshSessionsChart = true.obs;

  Map args = {"type": "INDIVIDUAL", "userName": "SS-8598"};

  @override
  void onReady() {
    super.onReady();
    Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        now.value = DateTime.now();
      },
    );
  }
}

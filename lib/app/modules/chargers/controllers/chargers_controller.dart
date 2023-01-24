import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:smartsocket/constants/network_constants.dart';
import 'package:smartsocket/services/auth_service.dart';
import 'package:smartsocket/utils/debouncer.dart';
import 'package:smartsocket/api/api_calls.dart';
import 'package:smartsocket/utils/local_storage.dart';

class ChargersController extends GetxController {
  late LinkedScrollControllerGroup controllers;

  late ScrollController bodyController;

  RxBool processing = false.obs;

  RxList devicesList = [].obs;

  RxString errorMessage = "".obs;

  TextEditingController searchController = TextEditingController();

  Debouncer searchDebouncer = Debouncer(milliseconds: 300);

  RxString searchedKeyword = "".obs;

  RxString startDateRange = "".obs;

  RxString endDateRange = "".obs;

  RxString selectedDateRange = "Last 7 days".obs;

  RxString sortByStatus = "All".obs;

  RxString defaultSortByValue = "None".obs;

  RxString sortByNetworkStatus = "All".obs;

  RxString sortBySessionStatus = "All".obs;

  final tableHeaders = {
    "id": "S.No",
    "name": "Device Name",
    "serialNumber": "Serial Number",
    "type": "Model",
    "macAddress": "MAC Address",
    "location": "Station Name",
    "deviceAddress": "Device Address",
    "actions": "Actions"
  };

  @override
  void onInit() async {
    controllers = LinkedScrollControllerGroup();
    bodyController = controllers.addAndGet();
    fetchAllChargers();
    super.onInit();
  }

  @override
  onClose() {
    bodyController.dispose();
    super.dispose();
  }

  addCPID(Map<String, dynamic> payload) async {
    final response = await callPostRequest(
        routeID: "/ChargersOverview",
        api: addDeviceUrl,
        header: {'Content-Type': 'application/json; charset=UTF-8'},
        payload: payload);

    if (response.runtimeType != String && response.statusCode == 200) {
      if (jsonDecode(response.body)["data"].length == 0) {
        return "No data";
      } else {
        return "Success";
      }
    } else {
      return "Exception";
    }
  }

  fetchAllChargers() async {
    processing.value = true;

    String? jsonString = await IdRepository().getUserData();

    Map userData = jsonDecode(jsonString!);

    dynamic authResponse = await AuthService.to
        .authenticate({"userName": "SS-0001", "password": "123456"});

    if (AuthService.to.authToken.isNotEmpty && authResponse.isEmpty) {
      await GetConnect()
          .get("$rootUrl/deviceapi/getalldevices", headers: authHeader())
          .then((response) async {
        if (!response.hasError && response.body["status"] == "true") {
          devicesList.value = response.body["data"];
          devicesList.insert(0, tableHeaders);
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

  getAllDevicesConfiguration() async {
    final response = await callGetRequestWithoutParameters(
        routeID: "/ChargersOverview",
        api: getAllDevicesConfig,
        header: {'Content-Type': 'application/json; charset=UTF-8'});

    if (response.runtimeType != String && response.statusCode == 200) {
      return jsonDecode(response.body)["data"].length == 0
          ? "No data"
          : jsonDecode(response.body)["data"];
    } else {
      return "Exception";
    }
  }
}

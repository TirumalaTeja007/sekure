import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:smartsocket/constants/network_constants.dart';
import 'package:smartsocket/services/auth_service.dart';
import 'package:smartsocket/utils/debouncer.dart';
import 'package:smartsocket/api/api_calls.dart';
import 'package:smartsocket/utils/local_storage.dart';

class StationsController extends GetxController {
  late LinkedScrollControllerGroup controllers;

  late ScrollController bodyController;

  RxBool processing = false.obs;

  RxString errorMessage = "".obs;

  RxList stationsList = [].obs;

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
    "addressId": "S.No",
    "addressName1": "Address Name1",
    "addressName2": "Address Name2",
    "addressName3": "Address Name3",
    "city": "City",
    "state": "State",
    "pincode": "Pincode",
    "locationName": "Location Name",
    "actions": "Actions"
  };

  @override
  void onInit() async {
    controllers = LinkedScrollControllerGroup();
    bodyController = controllers.addAndGet();
    fetchAllStations();
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

  fetchAllStations() async {
    processing.value = true;

    String? jsonString = await IdRepository().getUserData();

    Map userData = jsonDecode(jsonString!);

    dynamic authResponse = await AuthService.to
        .authenticate({"userName": "SS-0001", "password": "123456"});

    if (AuthService.to.authToken.isNotEmpty && authResponse.isEmpty) {
      await GetConnect()
          .get("$rootUrl/addressapi/getalladdresses", headers: authHeader())
          .then((response) async {
        if (!response.hasError && response.body["status"] == "true") {
          stationsList.value = response.body["data"];
          //print("StationsList-$stationsList");
          stationsList.insert(0, tableHeaders);
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

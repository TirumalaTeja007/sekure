import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:smartsocket/constants/network_constants.dart';
import 'package:smartsocket/utils/debouncer.dart';
import 'package:smartsocket/api/api_calls.dart';

class ChargersController extends GetxController {
  late LinkedScrollControllerGroup controllers;

  late ScrollController bodyController;

  RxBool processing = false.obs;

  RxList devicesList = [].obs;

  RxString errorMessage = "".obs;

  TextEditingController searchController = TextEditingController();

  Debouncer searchDebouncer = Debouncer(milliseconds: 300);

  RxString searchedKeyword = "".obs;

  static const tableHeaders = {
    "id": "ID",
    "chargePointID": "CPID",
    "chargeBoxSerialNumber": "Serial Number",
    "chargePointModel": "Model",
    "macAddress": "MAC Address",
    "vendorId": "Vendor ID",
    "evseVersion": "EVSE Version",
    "efiVersion": "EFI Version",
    "address": "Address",
    "latitude": "Latitude",
    "longitude": "Longitude",
    "createdTime": "Created Time",
    "createdBy": "Created By",
    "updatedTime": "Updated Time",
    "updatedBy": "Updated By",
  };

  @override
  void onInit() async {
    controllers = LinkedScrollControllerGroup();
    bodyController = controllers.addAndGet();
    streamDeviceInfo();
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

  streamDeviceInfo() async {
    processing.value = true;
    errorMessage.value = "";
    final response = await callGetRequestWithoutParameters(
        routeID: "/EVStations",
        api: getAllDevicesUrl,
        header: {'Content-Type': 'application/json; charset=UTF-8'});

    if (response.runtimeType != String && response.statusCode == 200) {
      if (jsonDecode(response.body)["data"].length != 0) {
        final devList = jsonDecode(response.body)["data"];
        devicesList.value = devList;
        devicesList.insert(0, tableHeaders);
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

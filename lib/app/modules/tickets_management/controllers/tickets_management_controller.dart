import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:smartsocket/constants/network_constants.dart';
import 'package:smartsocket/utils/debouncer.dart';
import 'package:smartsocket/api/api_calls.dart';
import 'package:smartsocket/utils/local_storage.dart';

class TicketsManagementController extends GetxController {
  late LinkedScrollControllerGroup controllers;
  late ScrollController bodyController;

  RxBool processing = false.obs;

  RxList tickets = [].obs;

  RxString errorMessage = "".obs;

  TextEditingController searchController = TextEditingController();

  Debouncer searchDebouncer = Debouncer(milliseconds: 300);

  RxString searchedKeyword = "".obs;

  final idRepo = IdRepository();

  static const tableHeaders = {
    "id": "ID",
    "userName": "Username",
    "mobileNumber": "Mobile Number",
    "ticketTypeEnum": "Ticket Type",
    "tranxIdTypeEnum": "Transaction Type",
    "ticketStatusEnum": "Ticket Status",
    "description": "Description",
    "issueType": "Issue Type",
    "tranxId": "Transaction ID",
    "ticketId": "Ticket ID",
    "createdTime": "Created Time",
    "createdBy": "Created By",
    "updatedTime": "Updated Time",
    "updatedBy": "Updated By",
  };

  @override
  void onInit() async {
    controllers = LinkedScrollControllerGroup();
    bodyController = controllers.addAndGet();
    supportTickets();
    super.onInit();
  }

  supportTickets() async {
    processing.value = true;
    errorMessage.value = "";
    String? jsonString = idRepo.isStackedArgsPresent('userInfoArgs')
        ? await idRepo.getStackedArgs('userInfoArgs')
        : await idRepo.getUserData();
    Map userData = jsonDecode(jsonString!);
    final response = await callGetRequestWithoutParameters(
        routeID: "/SupportTickets",
        api: userData["userType"] == "User"
            ? "$ticketsByUsernameUrl/${userData["userName"]}"
            : allTicketsUrl,
        header: {'Content-Type': 'application/json; charset=UTF-8'});
    if (response.runtimeType != String && response.statusCode == 200) {
      final ticketsList = jsonDecode(response.body)["data"];
      print("ticketsList-$ticketsList");
      if (ticketsList != []) {
        tickets.value = ticketsList;
        tickets.insert(0, tableHeaders);
        if (tickets.length == 1) errorMessage.value = "No data";
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

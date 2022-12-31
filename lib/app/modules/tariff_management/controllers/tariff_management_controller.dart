import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:smartsocket/constants/network_constants.dart';
import 'package:smartsocket/utils/debouncer.dart';
import 'package:smartsocket/api/api_calls.dart';
import 'package:smartsocket/utils/local_storage.dart';

class TariffManagementController extends GetxController {
  late LinkedScrollControllerGroup controllers;

  late ScrollController bodyController;

  RxBool processing = false.obs;

  RxList transactions = [].obs;

  RxString errorMessage = "".obs;

  TextEditingController searchController = TextEditingController();

  Debouncer searchDebouncer = Debouncer(milliseconds: 300);

  RxString searchedKeyword = "".obs;

  final idRepo = IdRepository();

  static const tableHeaders = {
    "id": "ID",
    "userName": "Username",
    "sessionId": "Session ID",
    "orderId": "Order ID",
    "walletAmount": "Wallet Amount",
    "onHoldAmount": "On-hold Amount",
    "transactionAmount": "Transaction Amount",
    "walletTransactionId": "Wallet Transaction ID",
    "transactionType": "Transaction Type",
    "transactionStatus": "Transaction Status",
    "createdTime": "Created Time",
    "createdBy": "Created By",
    "updatedTime": "Updated Time",
    "updatedBy": "Updated By",
  };

  @override
  void onInit() async {
    controllers = LinkedScrollControllerGroup();
    bodyController = controllers.addAndGet();
    getAllWalletTransactions();
    super.onInit();
  }

  getAllWalletTransactions() async {
    processing.value = true;

    errorMessage.value = "";

    String? jsonString = idRepo.isStackedArgsPresent('userInfoArgs')
        ? await idRepo.getStackedArgs('userInfoArgs')
        : await idRepo.getUserData();

    Map userData = jsonDecode(jsonString!);

    print(userData);

    final response = await callGetRequestWithoutParameters(
        routeID: "/WalletHistory",
        api:
            // userData["userType"] == "User"
            //     ?
            "$walletTranxByUserNameUrl/${userData["userName"]}",
        //     :
        // walletTranxUrl,
        header: {'Content-Type': 'application/json; charset=UTF-8'});

    if (response.runtimeType != String && response.statusCode == 200) {
      final tranxList = jsonDecode(response.body)["data"];
      if (tranxList != []) {
        transactions.value = tranxList;
        transactions.insert(0, tableHeaders);
        if (transactions.length == 1) errorMessage.value = "No data";
      } else {
        errorMessage.value = "No data";
      }
    } else {
      errorMessage.value = response;
    }

    processing.value = false;
  }
}

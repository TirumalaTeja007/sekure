import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:smartsocket/api/efi_http_exception_handler.dart';
import 'package:smartsocket/app/routes/app_pages.dart';
import 'package:smartsocket/constants/network_constants.dart';
import 'package:smartsocket/services/auth_service.dart';
import 'package:smartsocket/utils/debouncer.dart';
import 'package:smartsocket/api/api_calls.dart';

class ForgotPasswordController extends GetxController {
  RxBool showPassword = false.obs;

  RxBool otpReceived = false.obs;


  @override
  void onInit() async {
    super.onInit();
  }

  sendOtp() async {

  }
}

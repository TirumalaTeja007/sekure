import 'dart:convert';

import 'package:get/get.dart';
import 'package:smartsocket/utils/local_storage.dart';

class UserProfileController extends GetxController {
  final idRepo = IdRepository();

  RxBool refreshDevicesChart = true.obs;

  RxBool refreshSessionsChart = true.obs;

  @override
  void onInit() async {
    super.onInit();
  }

  streamUserInfo() async {
    String? jsonString = idRepo.isStackedArgsPresent('userInfoArgs')
        ? await idRepo.getStackedArgs('userInfoArgs')
        : await idRepo.getUserData();
    return jsonDecode(jsonString!);
  }
}

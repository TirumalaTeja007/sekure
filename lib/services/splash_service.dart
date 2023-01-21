import 'dart:async';
import 'dart:convert';

import 'package:async/async.dart';
import 'package:get/get.dart';
import 'package:smartsocket/services/auth_service.dart';
import 'package:smartsocket/utils/local_storage.dart';

class SplashService extends GetxService {
  final welcomeStr = ['GetX', 'Rules!'];
  final activeStr = 0.obs;

  final memo = AsyncMemoizer<void>();

  Future<void> init() {
    return memo.runOnce(_initFunction);
  }

  void _changeActiveString() {
    activeStr.value = (activeStr.value + 1) % welcomeStr.length;
  }

  Future<void> _initFunction() async {
    bool isFound = IdRepository().isUserDataPresent();
    if (!isFound) {
      AuthService.to.logout();
    } else {
      String? jsonString = await IdRepository().getUserData();
      Map userData = jsonDecode(jsonString!);
      if (!userData["isLoggedIn"]) {
        AuthService.to.logout();
      } else if (userData["isLoggedIn"]) {
        AuthService.to.login();
      }
    }
    await Future.delayed(const Duration(seconds: 2));
  }
}

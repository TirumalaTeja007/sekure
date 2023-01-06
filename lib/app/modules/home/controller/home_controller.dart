import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  late LinkedScrollControllerGroup _controllers;
  late ScrollController _bodyController;
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    _controllers = LinkedScrollControllerGroup();
    _bodyController = _controllers.addAndGet();
  }

  @override
  void dispose() {
    _bodyController.dispose();
    super.dispose();
  }

  RxInt tabIndex = 0.obs;

  RxList isHovering =
      [false, false, false, false, false, false, false, false].obs;

  RxString pageView = "HOME".obs;

  changeScrollPosition() {
    if (scrollController.hasClients) {
      final position = scrollController.position.minScrollExtent;
      print(position);
      scrollController.animateTo(
        position,
        duration: const Duration(seconds: 1),
        curve: Curves.easeOut,
      );
    }
  }
}

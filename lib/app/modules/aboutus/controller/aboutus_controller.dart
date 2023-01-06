import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AboutUsController extends GetxController {
  final ScrollController scrollController = ScrollController();

  @override
  onInit() {
    super.onInit();
    if (scrollController.hasClients) {
      final position = scrollController.position.minScrollExtent;
      scrollController.animateTo(
        position,
        duration: const Duration(seconds: 1),
        curve: Curves.easeOut,
      );
    }
  }
}

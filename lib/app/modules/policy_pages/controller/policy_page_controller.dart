import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PolicyPageController extends GetxController {
  final ScrollController scrollController = ScrollController();

  @override
  onReady() {
    super.onReady();
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
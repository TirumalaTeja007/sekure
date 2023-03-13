import 'package:get/get.dart';
import 'package:sekure/services/app_state_service.dart';

class RootController extends GetxController {
  //TODO: Implement RootController

  final count = 0.obs;

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;
}

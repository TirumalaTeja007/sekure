import 'package:get/get.dart';

import '../controller/services_controller.dart';

class ServicesPageBinding extends Bindings {
  @override
  dependencies() {
    return Get.lazyPut<ServicesController>(
      () => ServicesController(),
    );
  }
}

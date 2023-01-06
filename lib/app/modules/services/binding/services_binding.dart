import 'package:get/get.dart';
import 'package:smartsocket/app/modules/aboutus/controller/aboutus_controller.dart';

import '../controller/services_controller.dart';

class ServicesPageBinding extends Bindings {
  @override
  dependencies() {
    return Get.lazyPut<ServicesController>(
      () => ServicesController(),
    );
  }
}

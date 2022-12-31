import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
   dependencies() {
    return Get.lazyPut<HomeController>(
        () => HomeController(),
      )
    ;
  }
}

import 'package:get/get.dart';
import 'package:smartsocket/app/modules/aboutus/controller/aboutus_controller.dart';

class AboutUsBinding extends Bindings {
  @override
  dependencies() {
    return Get.lazyPut<AboutUsController>(
      () => AboutUsController(),
    );
  }
}

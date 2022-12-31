import 'package:get/get.dart';
import 'package:smartsocket/app/modules/session_information/controller/session_information_controller.dart';

class SessionInformationBinding extends Bindings {
  @override
  dependencies() {
    return Get.lazyPut<SessionInformationController>(
          () => SessionInformationController(),
    );
  }
}

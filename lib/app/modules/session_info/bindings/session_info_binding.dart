import 'package:get/get.dart';
import 'package:smartsocket/app/modules/session_info/controllers/session_info_controller.dart';

class SessionInfoBinding extends Bindings {
  @override
  dependencies() {
    return Get.lazyPut<SessionInfoController>(
          () => SessionInfoController(),
    );
  }
}

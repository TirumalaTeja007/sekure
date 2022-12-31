import 'package:get/get.dart';
import 'package:smartsocket/app/modules/sessions_management/controllers/session_management_controller.dart';

class SessionManagementBinding extends Bindings {
  @override
  dependencies() {
    return Get.lazyPut<SessionManagementController>(
          () => SessionManagementController(),
    );
  }
}

import 'package:get/get.dart';
import 'package:smartsocket/app/modules/user_dashboard/controllers/user_dashboard_controller.dart';

class UserDashboardBinding extends Bindings {
  @override
  dependencies() {
    return Get.lazyPut<UserDashboardController>(
      () => UserDashboardController(),
    );
  }
}

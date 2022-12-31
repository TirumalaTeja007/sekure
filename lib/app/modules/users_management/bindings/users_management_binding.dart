import 'package:get/get.dart';
import 'package:smartsocket/app/modules/users_management/controllers/users_management_controller.dart';

class UsersManagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UsersManagementController>(() =>UsersManagementController());
  }
}

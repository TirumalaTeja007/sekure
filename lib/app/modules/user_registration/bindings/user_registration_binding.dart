import 'package:get/get.dart';
import 'package:smartsocket/app/modules/user_registration/controller/user_registration_controller.dart';
import 'package:smartsocket/app/modules/users_management/controllers/users_management_controller.dart';

class UserRegistrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserRegistrationController>(() =>UserRegistrationController());
  }
}

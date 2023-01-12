import 'package:get/get.dart';
import 'package:smartsocket/app/modules/signup/controller/user_signup_controller.dart';
import 'package:smartsocket/app/modules/users_management/controllers/users_management_controller.dart';

class UserSignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserSignupController>(() =>UserSignupController());
  }
}

import 'package:get/get.dart';
import 'package:smartsocket/app/modules/signup/controller/signup_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(() =>SignupController());
  }
}

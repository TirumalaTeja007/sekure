import 'package:get/get.dart';
import '../controllers/splash_controller.dart';

class DashboardSplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
  }
}

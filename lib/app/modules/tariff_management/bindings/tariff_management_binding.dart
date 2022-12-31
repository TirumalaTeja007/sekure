import 'package:get/get.dart';
import 'package:smartsocket/app/modules/tariff_management/controllers/tariff_management_controller.dart';

class TariffManagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TariffManagementController>(()=>TariffManagementController());
  }
}

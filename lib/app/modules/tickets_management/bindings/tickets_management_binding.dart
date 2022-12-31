import 'package:get/get.dart';
import 'package:smartsocket/app/modules/tickets_management/controllers/tickets_management_controller.dart';

class TicketsManagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TicketsManagementController>(()=>TicketsManagementController());
  }
}

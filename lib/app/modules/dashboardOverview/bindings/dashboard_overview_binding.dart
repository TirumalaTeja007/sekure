import 'package:get/get.dart';
import 'package:smartsocket/app/modules/dashboardOverview/controllers/dashboard_overview_controller.dart';

class DashboardOverviewBinding extends Bindings {
  @override
  dependencies() {
    return Get.lazyPut<DashboardOverviewController>(
      () => DashboardOverviewController(),
    );
  }
}

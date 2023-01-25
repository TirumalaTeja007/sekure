import 'package:get/get.dart';
import 'package:smartsocket/services/app_state_service.dart';

class DashboardController extends GetxController {
  final List tabList = [
    "Dashboard",
    "Stations Overview",
    "Add Stations",
    "Chargers Overview",
    "Add Devices",
    "Session Info",
    "Payments",
    'Add Users',
    "End Users",
    "Station Admins",
    "Super Admins",
    "Customer Support",
    "Settings",
    "Logout"
  ];

  @override
  onInit() async {
    super.onInit();
  }
}

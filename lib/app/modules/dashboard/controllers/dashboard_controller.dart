import 'package:get/get.dart';

class DashboardController extends GetxController {
  final List tabList = [
    "Dashboard",
    "Stations Overview",
    "Add Stations",
    "Chargers Overview",
    "Add Devices",
    "Session Info",
    "Payments",
    'Users Overview',
    "Add Users",
    'User Information',
    "Customer Support",
    "Settings",
    "Logout"
  ];

  @override
  onInit() async {
    super.onInit();
  }
}

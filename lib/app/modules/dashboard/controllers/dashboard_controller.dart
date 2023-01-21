import 'package:get/get.dart';
import 'package:smartsocket/services/app_state_service.dart';

class DashboardController extends GetxController {
  final List tabList = [
    "Dashboard",
    "Generate CPID's",
    "Chargers Report",
    "Add New Sites",
    "Stations Report",
    "Session Management",
    "Tariff Management",
    'Add New Users',
    "End Users",
    "Station Admins",
    "Super Admins",
    "Tickets Management",
    "Settings",
    "Logout"
  ];

  @override
  onInit() async {
    super.onInit();
  }
}

import 'package:sekure/utils/responsive.dart';
import 'package:flutter/cupertino.dart';
const kUserRepoToken = 'sekure_user_repo';
const kUserDataId = 'sekure_user_data';
const kPickUpMarkerId = 'Pickup';
const kAppLogo = "assets/images/logo/app_logo.png";
const kSedanCarImage = "assets/images/sedan.png";
const kSedanCarLineImage = "assets/images/sedan_car_line_image.png";
const double costPerKwhINR = 6;

const double kwhConsumedPerHour = 3;

const double costPerMinute = costPerKwhINR * kwhConsumedPerHour / 60;

const int maxNumber = 11;

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

const kDrawerWidth = 304;

kFilterButtonWidth(BuildContext context) {
  return ResponsiveWidget.isSmallScreen(context) ? 135 : 155;
}

kSearchFieldWidth(BuildContext context) {
  return ResponsiveWidget.isSmallScreen(context) ? 150 : 230;
}

kCellWidth(BuildContext context) {
  return ResponsiveWidget.isSmallScreen(context) ? 100 : 140;
}

kTextFieldWidth(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  return ResponsiveWidget.isSmallScreen(context) ? width * 0.45 : 250;
}

kLineChartWidth(BuildContext context) {
  final screenSize = MediaQuery.of(context).size;
  return ResponsiveWidget.isLargeScreen(context)
      ? (screenSize.width - 304) < 1000
          ? screenSize.width - 369
          : (screenSize.width - 384) * 0.65
      : screenSize.width > 900
          ? (screenSize.width - 90) * 0.5
          : screenSize.width - 50;
}

final devicesSortByFiltersList = [
  "None",
  "Created Time",
  "Serial Number",
  "Device Name",
  "Station Name"
];

final stationsSortByFiltersList = [
  "None",
  "Created Time",
  "Updated Time",
  "City Name",
  "Station Name"
];

final deviceStatusFiltersList = [
  "All",
  "Available",
  "Unavailable",
  "Preparing",
  "Charging"
];

final deviceNetworkStatusFiltersList = ["All", "Online", "Offline"];

final sessionStatusFiltersList = ["All", "Ongoing", "Completed", "Failed"];

final stationsStatusFiltersList = ["All", "Functional", "Non-Functional"];

final paymentsStatusFiltersList = ["All", "Initiated", "Success", "Failed"];

final usersStatusFiltersList = ["All", "Active", "Inactive"];

final ticketsStatusFiltersList = ["All", "Resolved", "Created", "In-Progress"];

final dateRangeFiltersList = [
  "Last 7 days",
  "Last 30 days",
  "Last 90 days",
  "All time",
  "Custom Range"
];

final userRoleFiltersList = ["All", "User", "CPO", "Super Admin"];

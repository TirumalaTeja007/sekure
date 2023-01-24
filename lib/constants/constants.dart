import 'package:smartsocket/utils/responsive.dart';
import 'package:flutter/cupertino.dart';

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
  return ResponsiveWidget.isLargeScreen(context) ? 160 : 130;
}

kCellWidth(BuildContext context) {
  return ResponsiveWidget.isLargeScreen(context) ? 160 : 100;
}

kTextFieldWidth(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  return ResponsiveWidget.isSmallScreen(context) ? width * 0.7 : 250;
}

final devicesSortByFiltersList = [
  "None",
  "Created Time",
  "Serial Number",
  "Device Name",
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
  "Custom Date"
];

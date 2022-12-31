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
  return ResponsiveWidget.isSmallScreen(context) ? 100 : 125;
}

kSearchFieldWidth(BuildContext context) {
  return ResponsiveWidget.isSmallScreen(context) ? 150 : 200;
}

kTextFieldWidth(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  return ResponsiveWidget.isSmallScreen(context) ? width * 0.7 : 250;
}
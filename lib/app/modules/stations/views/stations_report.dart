import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartsocket/app/modules/stations/controllers/stations_controller.dart';
import 'package:smartsocket/app/widgets/nodata_widget.dart';
import 'package:smartsocket/app/widgets/search_textfield.dart';
import 'package:smartsocket/app/widgets/table_body.dart';
import 'package:smartsocket/constants/color_constants.dart';
import 'package:smartsocket/constants/constants.dart';
import 'package:smartsocket/utils/responsive.dart';
import 'package:smartsocket/utils/scroll_behaviour.dart';

import '../../../widgets/date_range.dart';
import '../../../widgets/popup_menu.dart';

class StationsReportView extends GetView<StationsController> {
  const StationsReportView({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return ResponsiveWidget.isLargeScreen(context)
        ? SizedBox(height: screenSize.height - 80, child: body(context))
        : SizedBox(height: screenSize.height - 55, child: body(context));
  }

  Widget body(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final List<Widget> filtersChildren = [
      SearchTextFieldWidget(controller.searchController,
          controller.searchedKeyword, controller.searchDebouncer),
      PopupMenuWidget(
          deviceStatusFiltersList, controller.sortByStatus, "Status"),
      PopupMenuWidget(deviceNetworkStatusFiltersList,
          controller.sortByNetworkStatus, "Network Status"),
      DateRangeWidget(controller.startDateRange, controller.endDateRange,
          controller.selectedDateRange)
    ];
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: ResponsiveWidget.isSmallScreen(context) ? 30 : 50,
              bottom: ResponsiveWidget.isSmallScreen(context) ? 20 : 35,
              left: ResponsiveWidget.isLargeScreen(context) ? 50 : 30),
          child: screenSize.width > 1570
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: filtersChildren,
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: ResponsiveWidget.isLargeScreen(context) &&
                              screenSize.width > 1150
                          ? filtersChildren.sublist(0, 4)
                          : ResponsiveWidget.isMediumScreen(context) &&
                                  screenSize.width > 700
                              ? filtersChildren.sublist(0, 4)
                              : ResponsiveWidget.isSmallScreen(context)
                                  ? filtersChildren.sublist(0, 2)
                                  : filtersChildren.sublist(0, 3),
                    ),
                    SizedBox(height: ResponsiveWidget.isSmallScreen(context) ? 10: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: ResponsiveWidget.isSmallScreen(context)
                          ? filtersChildren.sublist(2, 4)
                          : ResponsiveWidget.isMediumScreen(context) &&
                                      screenSize.width < 700 ||
                                  ResponsiveWidget.isLargeScreen(context) &&
                                      screenSize.width < 1150
                              ? filtersChildren.sublist(3, 5)
                              : filtersChildren.sublist(4),
                    ),
                  ],
                ),
        ),
        Expanded(
          child: ScrollConfiguration(
            behavior: MyCustomScrollBehavior(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Obx(
                    () => controller.processing.value == false &&
                            controller.errorMessage.value.isEmpty
                        ? TableBody(
                            scrollController: controller.bodyController,
                            cells: controller.stationsList,
                            refresh: controller.fetchAllStations,
                            searchedKeyword: controller.searchedKeyword.value,
                            infoType: "StationsReport")
                        : controller.errorMessage.value.isNotEmpty
                            ? NoDataWidget(controller.errorMessage.value)
                            : const CupertinoActivityIndicator(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget filterWidget(BuildContext context, Size screenSize) {
    return Card(
      color: kGrey,
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Container(
        height: 50,
        width: kFilterButtonWidth(context),
        alignment: Alignment.center,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Sort By",
                style: TextStyle(
                    fontFamily: 'MontserratRegular',
                    color: kPrimaryTextColor,
                    fontSize: 14)),
            const SizedBox(width: 20),
            PopupMenuButton(
              constraints: BoxConstraints.expand(
                  width: kFilterButtonWidth(context), height: 200),
              icon: const Icon(Icons.filter_list, color: Color(0xff6cfc2c)),
              onSelected: (value) {},
              offset: const Offset(30, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              itemBuilder: (ctx) {
                return ["filters"].toList().map((element) {
                  return PopupMenuItem(
                    value: element,
                    child: const Text("Filter",
                        style: TextStyle(
                            fontFamily: 'MontserratRegular',
                            color: kPrimaryTextColor,
                            fontSize: 14)),
                  );
                }).toList();
              },
            ),
          ],
        ),
      ),
    );
  }
}

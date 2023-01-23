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
    double availableWidth = screenSize.width -
        (ResponsiveWidget.isLargeScreen(context) ? kDrawerWidth : 0.0) -
        (controller.tableHeaders.length * kCellWidth(context));
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: ResponsiveWidget.isSmallScreen(context) ? 30 : 50,
              bottom: 20,
              right: availableWidth < kCellWidth(context)
                  ? kCellWidth(context) * 0.5
                  : availableWidth * 0.5 + 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SearchTextFieldWidget(controller.searchController,
                  controller.searchedKeyword, controller.searchDebouncer),
              const SizedBox(width: 20),
              filterWidget(context, screenSize),
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

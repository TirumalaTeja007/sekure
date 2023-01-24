import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartsocket/app/modules/chargers/controllers/chargers_controller.dart';
import 'package:smartsocket/app/widgets/popup_menu.dart';
import 'package:smartsocket/app/widgets/table_cell.dart';
import 'package:smartsocket/constants/color_constants.dart';
import 'package:smartsocket/constants/constants.dart';
import 'package:smartsocket/utils/responsive.dart';
import 'package:smartsocket/utils/scroll_behaviour.dart';
import 'package:smartsocket/app/widgets/nodata_widget.dart';
import 'package:smartsocket/app/widgets/search_textfield.dart';
import 'package:smartsocket/app/widgets/table_body.dart';
import '../../../widgets/date_range.dart';

class ChargersReportsScreen extends GetView<ChargersController> {
  const ChargersReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return ResponsiveWidget.isLargeScreen(context)
        ? SizedBox(
            height: screenSize.height - 80,
            child: body(context),
          )
        : SizedBox(height: screenSize.height - 55, child: body(context));
  }

  Widget body(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    print(screenSize);
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
              bottom: 20,
              left: ResponsiveWidget.isLargeScreen(context) ? 50 : 30),
          child: screenSize.width > 1400
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
                      children: ResponsiveWidget.isMediumScreen(context)
                          ? screenSize.width > 900
                              ? filtersChildren.sublist(0, 4)
                              : filtersChildren.sublist(0, 3)
                          : filtersChildren.sublist(0, 3),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: ResponsiveWidget.isSmallScreen(context) ||
                              (ResponsiveWidget.isMediumScreen(context) &&
                                  screenSize.width < 900) ||
                              (ResponsiveWidget.isLargeScreen(context) &&
                                  screenSize.width < 1150)
                          ? filtersChildren.sublist(3)
                          : [const SizedBox()],
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
                            cells: controller.devicesList,
                            refresh: controller.fetchAllChargers,
                            searchedKeyword: controller.searchedKeyword.value,
                            infoType: "ChargersReport")
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
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:smartsocket/app/modules/stations/controllers/stations_controller.dart';
import 'package:smartsocket/app/widgets/nodata_widget.dart';
import 'package:smartsocket/app/widgets/search_textfield.dart';
import 'package:smartsocket/app/widgets/table_body.dart';
import 'package:smartsocket/constants/color_constants.dart';
import 'package:smartsocket/constants/constants.dart';
import 'package:smartsocket/utils/responsive.dart';
import 'package:smartsocket/utils/scroll_behaviour.dart';

import '../../../../services/app_state_service.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/date_range.dart';
import '../../../widgets/popup_menu.dart';

class StationsOverview extends GetView<StationsController> {
  const StationsOverview({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return ResponsiveWidget.isLargeScreen(context)
        ? SizedBox(height: screenSize.height - 80, child: body(context))
        : SizedBox(height: screenSize.height - 55, child: body(context));
  }

  Widget body(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double horizontalPadding =
        ResponsiveWidget.isLargeScreen(context) ? 50 : 30;
    double rightPadding = controller.tableHeaders.length.toDouble() *
                kCellWidth(context) <
            screenSize.width -
                (ResponsiveWidget.isLargeScreen(context) ? kDrawerWidth : 0)
        ? screenSize.width -
            horizontalPadding -
            (ResponsiveWidget.isLargeScreen(context) ? kDrawerWidth : 0) -
            (controller.tableHeaders.length.toDouble() * kCellWidth(context))
        : horizontalPadding;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: 30,
              bottom: 20,
              left: horizontalPadding,
              right: rightPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SearchTextFieldWidget(controller.searchController,
                        controller.searchedKeyword, controller.searchDebouncer),
                    PopupMenuWidget(stationsSortByFiltersList,
                        controller.defaultSortByValue, "Sort By"),
                  ]),
              SizedBox(
                width: kFilterButtonWidth(context) + 10,
                child: Card(
                  elevation: 1,
                  color: Colors.green.shade900,
                  margin: EdgeInsets.only(
                      top: ResponsiveWidget.isLargeScreen(context) ? 14 : 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  child: InkWell(
                    onTap: () =>
                        AppStateService.to.delegate.toNamed(Routes.addStations),
                    child: SizedBox(
                      height: 40,
                      width: kFilterButtonWidth(context) + 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(MdiIcons.evStation, color: Colors.white),
                          Text("Add stations",
                              style: TextStyle(
                                  fontFamily: 'MontserratRegular',
                                  color: Colors.white,
                                  fontSize:
                                  ResponsiveWidget.isSmallScreen(
                                      context)
                                      ? 12
                                      : 14)),
                        ],
                      ),
                    ),
                  ),
                ),
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
}

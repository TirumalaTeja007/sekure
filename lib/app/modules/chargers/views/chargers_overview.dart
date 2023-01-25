import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
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
import '../../../../services/app_state_service.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/date_range.dart';

class ChargersOverview extends GetView<ChargersController> {
  const ChargersOverview({super.key});

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
    double horizontalPadding =
        ResponsiveWidget.isLargeScreen(context) ? 50 : 30;
    double drawerWidth =
        ResponsiveWidget.isLargeScreen(context) ? kDrawerWidth.toDouble() : 0;
    double tableWidth =
        controller.tableHeaders.length.toDouble() * kCellWidth(context);
    double usableWidth =
        screenSize.width - drawerWidth - horizontalPadding * 2 > tableWidth
            ? tableWidth
            : screenSize.width - horizontalPadding * 2 - drawerWidth;
    double filtersWidth =
        (kFilterButtonWidth(context) * 3) + kSearchFieldWidth(context);
    double leftPadding =
        filtersWidth < usableWidth ? usableWidth - filtersWidth : 0;
    return Column(
      children: [
        Row(
          children: [
            Container(
                margin: EdgeInsets.only(
                    top: 30,
                    bottom: 20,
                    left: horizontalPadding,
                    right: horizontalPadding),
                width: usableWidth,
                child: Wrap(
                  direction: Axis.horizontal,
                  spacing: 0.0,
                  children: [
                    SearchTextFieldWidget(controller.searchController,
                        controller.searchedKeyword, controller.searchDebouncer),
                    PopupMenuWidget(deviceStatusFiltersList,
                        controller.sortByStatus, "Status"),
                    PopupMenuWidget(deviceNetworkStatusFiltersList,
                        controller.sortByNetworkStatus, "Network Status"),
                    SizedBox(width: leftPadding),
                    SizedBox(
                      width: kFilterButtonWidth(context),
                      child: Card(
                        elevation: 1,
                        color: Colors.green.shade900,
                        margin: EdgeInsets.only(
                            top: ResponsiveWidget.isSmallScreen(context)
                                ? 22
                                : 25),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: InkWell(
                          onTap: () => AppStateService.to.delegate
                              .toNamed(Routes.addChargers),
                          child: SizedBox(
                            height: 40,
                            width: kFilterButtonWidth(context),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Icon(MdiIcons.evPlugType1,
                                    color: Colors.white),
                                Text("Add chargers",
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
                )),
          ],
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

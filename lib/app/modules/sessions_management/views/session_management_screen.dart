import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartsocket/app/modules/sessions_management/controllers/session_management_controller.dart';
import 'package:smartsocket/app/widgets/date_range.dart';
import 'package:smartsocket/app/widgets/nodata_widget.dart';
import 'package:smartsocket/app/widgets/popup_menu.dart';
import 'package:smartsocket/app/widgets/search_textfield.dart';
import 'package:smartsocket/app/widgets/table_body.dart';
import 'package:smartsocket/constants/color_constants.dart';
import 'package:smartsocket/constants/constants.dart';
import 'package:smartsocket/utils/responsive.dart';
import 'package:smartsocket/utils/scroll_behaviour.dart';

class SessionManagementScreen extends GetView<SessionManagementController> {
  const SessionManagementScreen({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return ResponsiveWidget.isLargeScreen(context)
        ? SizedBox(
            height: screenSize.height - 80,
            child: body(context),
          )
        : SizedBox(
            height: screenSize.height - 55,
            child: body(context),
          );
  }

  Widget body(context) {
    var screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: 30,
              bottom: 20,
              left: ResponsiveWidget.isLargeScreen(context) ? 50 : 30),
          child: SizedBox(
            width: ResponsiveWidget.isLargeScreen(context)
                ? screenSize.width - kDrawerWidth - 50
                : screenSize.width - 30,
            child: Wrap(direction: Axis.horizontal, children: [
              SearchTextFieldWidget(controller.searchController,
                  controller.searchedKeyword, controller.searchDebouncer),
              PopupMenuWidget(sessionStatusFiltersList, controller.sortByStatus,
                  "Session Status"),
              DateRangeWidget(controller.startDateRange,
                  controller.endDateRange, controller.selectedDateRange)
            ]),
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
                            cells: controller.sessionInfo,
                            refresh: controller.getUserSessionHistory,
                            searchedKeyword: controller.searchedKeyword.value,
                            infoType: "SessionManagement")
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartsocket/app/modules/payments/controllers/payments_controller.dart';
import 'package:smartsocket/app/widgets/nodata_widget.dart';
import 'package:smartsocket/app/widgets/search_textfield.dart';
import 'package:smartsocket/app/widgets/table_body.dart';
import 'package:smartsocket/constants/constants.dart';
import 'package:smartsocket/utils/responsive.dart';
import 'package:smartsocket/utils/scroll_behaviour.dart';

import '../../../widgets/date_range.dart';
import '../../../widgets/popup_menu.dart';

class PaymentsView extends GetView<PaymentsController> {
  const PaymentsView({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return ResponsiveWidget.isLargeScreen(context)
        ? SizedBox(height: screenSize.height - 80, child: body(context))
        : SizedBox(height: screenSize.height - 55, child: body(context));
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SearchTextFieldWidget(controller.searchController,
                  controller.searchedKeyword, controller.searchDebouncer),
              PopupMenuWidget(
                  deviceStatusFiltersList, controller.sortByStatus, "Status"),
              DateRangeWidget(controller.startDateRange,
                  controller.endDateRange, controller.selectedDateRange)
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
                            cells: controller.transactions,
                            refresh: controller.getAllWalletTransactions,
                            searchedKeyword: controller.searchedKeyword.value,
                            infoType: "Payments")
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

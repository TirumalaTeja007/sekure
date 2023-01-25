import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartsocket/app/modules/tickets_management/controllers/tickets_management_controller.dart';
import 'package:smartsocket/constants/color_constants.dart';
import 'package:smartsocket/constants/constants.dart';
import 'package:smartsocket/app/widgets/nodata_widget.dart';
import 'package:smartsocket/utils/responsive.dart';
import 'package:smartsocket/utils/scroll_behaviour.dart';
import 'package:smartsocket/app/widgets/search_textfield.dart';
import 'package:smartsocket/app/widgets/table_body.dart';

class TicketsManagementScreen extends GetView<TicketsManagementController> {
  const TicketsManagementScreen({Key? key})
      : super(key: key);

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

  Widget body(context) {
    var screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: ResponsiveWidget.isSmallScreen(context) ? 30 : 50,
              bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SearchTextFieldWidget(controller.searchController,
                  controller.searchedKeyword, controller.searchDebouncer),
              const SizedBox(width: 20),
              filterWidget(context, screenSize),
              const SizedBox(width: 20),
              filterWidget(context, screenSize),
              SizedBox(
                  width: ResponsiveWidget.isSmallScreen(context) ? 20 : 40),
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
                            cells: controller.tickets,
                            refresh: controller.supportTickets,
                            searchedKeyword:
                                controller.searchedKeyword.value,
                            infoType: "TicketsManagement")
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

  Widget filterWidget(context, Size screenSize) {
    return Container(
      height: 50,
      width: kFilterButtonWidth(context),
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          color: kGrey,
          boxShadow: const [BoxShadow(color: kBoxShadowColor, blurRadius: 4)],
          borderRadius: BorderRadius.circular(8.0)),
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Filter",
              style: TextStyle(
                  fontFamily: 'MontserratRegular',
                  color: kPrimaryTextColor,
                  fontSize: 14)),
          PopupMenuButton(
            constraints: const BoxConstraints.expand(width: 100, height: 200),
            icon: const Icon(Icons.filter_list, color: Color(0xff6cfc2c)),
            onSelected: (value) {},
            offset: const Offset(0.0, 200),
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
    );
  }
}

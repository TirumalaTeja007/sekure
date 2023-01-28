import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:smartsocket/app/modules/dashboardOverview/controllers/dashboard_overview_controller.dart';
import 'package:smartsocket/app/widgets/devices_chart_widget.dart';
import 'package:smartsocket/app/widgets/line_chart.dart';
import 'package:smartsocket/app/widgets/session_chart_widget.dart';
import 'package:smartsocket/constants/color_constants.dart';
import 'package:smartsocket/utils/responsive.dart';

class DashboardOverview extends GetView<DashboardOverviewController> {
  const DashboardOverview({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double width = ResponsiveWidget.isLargeScreen(context)
        ? (screenSize.width - 334)
        : screenSize.width - 30;
    return SingleChildScrollView(
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            width: width,
            child: Wrap(
              direction: Axis.vertical,
              spacing: 15,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 30),
                  child: SizedBox(
                    width: width - 30,
                    child: Wrap(
                      direction: Axis.horizontal,
                      spacing: 15,
                      runSpacing: 15,
                      children: [
                        header(context, "ACTIVE USERS", "152",
                            MdiIcons.accountGroup),
                        header(context, "OPERABLE DEVICES", "546",
                            MdiIcons.evPlugType1),
                        header(context, "CHARGING STATIONS", "26",
                            MdiIcons.evStation),
                        header(
                            context, "OPERATING CITIES", "14", MdiIcons.city),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: SizedBox(
                    width: width - 30,
                    child: Wrap(
                      direction: Axis.horizontal,
                      spacing: 25,
                      runSpacing: 15,
                      children: [
                        const LineChartWidget(),
                        SessionChartWidget(
                            controller.fetchSessionInfoState,
                            controller.sessionInfoResponse,
                            controller.fetchSessionInfo)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget header(
      BuildContext context, String title, String value, IconData icon) {
    var screenSize = MediaQuery.of(context).size;
    double width = ResponsiveWidget.isLargeScreen(context)
        ? (screenSize.width - 304) < 900
            ? (screenSize.width - 380) * 0.5
            : (screenSize.width - 410) * 0.25
        : ResponsiveWidget.isMediumScreen(context) ||
                (ResponsiveWidget.isSmallScreen(context) &&
                    screenSize.width > 500)
            ? (screenSize.width - 75) * 0.5
            : screenSize.width - 30;
    return SizedBox(
      width: width,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontFamily: 'MontserratRegular',
                          color: kPrimaryTextColor,
                          fontSize: 12)),
                  Text(value,
                      style: const TextStyle(
                          fontFamily: 'MontserratBold',
                          color: kPrimaryTextColor,
                          fontSize: 20)),
                ],
              ),
              Icon(icon, color: Colors.grey.shade300, size: 35),
            ],
          ),
        ),
      ),
    );
  }
}

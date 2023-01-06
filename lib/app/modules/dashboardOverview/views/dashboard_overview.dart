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
    return SingleChildScrollView(
      child: (ResponsiveWidget.isLargeScreen(context) &&
                  screenSize.width - 304 < 1000) ||
              screenSize.width < 1000
          ? Column(
              children: [
                headerScrollWidget(context, screenSize),
                SessionChartWidget(
                    controller.refreshSessionsChart, controller.args),
                DevicesChartWidget(
                    controller.refreshDevicesChart, controller.args),
                const Padding(
                  padding: EdgeInsets.only(right: 30.0),
                  child: LineChartWidget(),
                ),
                const SizedBox(height: 20),
              ],
            )
          : Column(
              children: [
                headerScrollWidget(context, screenSize),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        LineChartWidget(),
                      ],
                    ),
                    Column(
                      children: [
                        SessionChartWidget(
                            controller.refreshSessionsChart, controller.args),
                        DevicesChartWidget(
                            controller.refreshDevicesChart, controller.args),
                        const SizedBox(height: 30)
                      ],
                    ),
                  ],
                ),
              ],
            ),
    );
  }

  Widget headerScrollWidget(context, Size screenSize) {
    final width = ResponsiveWidget.isLargeScreen(context)
        ? (screenSize.width - 304)
        : screenSize.width;
    return screenSize.width < 1000 && screenSize.width > 600 ||
            (ResponsiveWidget.isLargeScreen(context) &&
                (screenSize.width - 304) < 950)
        ? Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Row(
                  children: [
                    header(30, "ACTIVE USERS", "152", MdiIcons.accountGroup,
                        width * 0.5),
                    header(0, "OPERABLE DEVICES", "546", MdiIcons.evPlugType1,
                        width * 0.5),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Row(
                  children: [
                    header(30, "FUNCTIONAL STATIONS", "26", MdiIcons.evStation,
                        width * 0.5),
                    header(0, "OPERATING CITIES", "14", MdiIcons.city,
                        width * 0.5),
                  ],
                ),
              ),
            ],
          )
        : screenSize.width < 600
            ? Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Column(
                  children: [
                    header(30, "ACTIVE USERS", "152", MdiIcons.accountGroup,
                        width),
                    const SizedBox(height: 30),
                    header(30, "OPERABLE DEVICES", "546", MdiIcons.evPlugType1,
                        width),
                    const SizedBox(height: 30),
                    header(30, "FUNCTIONAL STATIONS", "26", MdiIcons.evStation,
                        width),
                    const SizedBox(height: 30),
                    header(30, "OPERATING CITIES", "14", MdiIcons.city, width),
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Row(
                  children: [
                    header(30, "ACTIVE USERS", "152", MdiIcons.accountGroup,
                        width * 0.25),
                    header(0, "OPERABLE DEVICES", "546", MdiIcons.evPlugType1,
                        width * 0.25),
                    header(0, "FUNCTIONAL STATIONS", "26", MdiIcons.evStation,
                        width * 0.25),
                    header(0, "OPERATING CITIES", "14", MdiIcons.city,
                        width * 0.25),
                  ],
                ),
              );
  }

  Widget header(double leftMargin, String title, String value, IconData icon,
      double width) {
    return SizedBox(
      width: width,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        margin: EdgeInsets.fromLTRB(leftMargin, 0, 30, 0),
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
              Icon(icon, color: Colors.grey.shade300, size: 40),
            ],
          ),
        ),
      ),
    );
  }
}

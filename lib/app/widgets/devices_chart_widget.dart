import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:smartsocket/api/api_calls.dart';
import 'package:smartsocket/app/widgets/piecchart.dart';
import 'package:smartsocket/constants/color_constants.dart';
import 'package:smartsocket/constants/network_constants.dart';
import 'package:smartsocket/models/chart_data_model.dart';
import 'package:smartsocket/utils/responsive.dart';
import 'package:smartsocket/app/widgets/dot.dart';
import 'package:smartsocket/app/widgets/efi_http_error_message_widget.dart';

class DevicesChartWidget extends StatelessWidget {
  const DevicesChartWidget(this.refreshDevicesChart, this.args, {Key? key})
      : super(key: key);
  final RxBool refreshDevicesChart;
  final Map args;

  streamAllDevicesInfo() async* {
    // if (refreshDevicesChart.value == true) {
    final response = await callGetRequestWithoutParameters(
        routeID: "/EVStations",
        api: getAllDevicesConfig,
        header: {'Content-Type': 'application/json; charset=UTF-8'});

    if (response.runtimeType != String && response.statusCode == 200) {
      yield jsonDecode(response.body)["data"].length == 0
          ? "No data"
          : jsonDecode(response.body)["data"];
    } else {
      yield "Exception";
    }

    //   refreshDevicesChart.value = false;
    // }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: (ResponsiveWidget.isLargeScreen(context) &&
                  screenSize.width - 304 < 1000) ||
              screenSize.width < 1000
          ? screenSize.width
          : 500,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
        child: Column(
          children: [
            ListTile(
              tileColor: kGrey,
              dense: true,
              leading: Text(
                "Smart Devices",
                style: TextStyle(
                    fontFamily: 'MontserratBold',
                    color: kPrimaryTextColor,
                    fontSize:
                        ResponsiveWidget.isSmallScreen(context) ? 18 : 20),
              ),
              trailing: const Icon(Icons.more_vert, color: kPrimaryTextColorShade),
            ),
            // Container(
            //   decoration: BoxDecoration(
            //       color: Colors.white, borderRadius: BorderRadius.circular(4)),
            //   padding: const EdgeInsets.only(top: 30),
            //   child: StreamBuilder(
            //     stream: streamAllDevicesInfo(),
            //     builder: (BuildContext context, AsyncSnapshot snapshot) {
            //       if (snapshot.connectionState == ConnectionState.done) {
            //         if (snapshot.hasData) {
            //           if (snapshot.data.runtimeType != String &&
            //               snapshot.data!.length != 0) {
            //             double available = 0;
            //             double unavailable = 0;
            //             double inProgress = 0;
            //             double charging = 0;
            //             for (var dev in snapshot.data) {
            //               dev["status"] == "AVAILABLE"
            //                   ? available++
            //                   : dev["status"] == "CHARGING"
            //                       ? charging++
            //                       : dev["status"] == "IN_PROGRESS"
            //                           ? inProgress++
            //                           : unavailable++;
            //             }
            //             List<ChartData> devicesChartData = [];
            //             devicesChartData.add(ChartData('Devices',
            //                 snapshot.data.length, Colors.orange, "90%"));
            //             devicesChartData.add(ChartData('Available',
            //                 available.toDouble(), kSuccess, "90%"));
            //             devicesChartData.add(ChartData('Unavailable',
            //                 unavailable.toDouble(), kRed, "90%"));
            //             devicesChartData.add(ChartData('In-progress',
            //                 inProgress.toDouble(), kInfo, "90%"));
            //             devicesChartData.add(ChartData('Charging',
            //                 charging.toDouble(), Colors.green.shade800, "90%"));
            //             return Column(
            //               children: [
            //                 PieChartWidget(devicesChartData),
            //                 Padding(
            //                   padding:
            //                       const EdgeInsets.symmetric(vertical: 20.0),
            //                   child: screenSize.width >= 500
            //                       ? Row(
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.center,
            //                           children: [
            //                             hintText("Available", kSuccess),
            //                             hintText("Unavailable", kRed),
            //                             hintText(
            //                                 "Charging", Colors.green.shade800),
            //                             hintText("In-progress", kInfo),
            //                           ],
            //                         )
            //                       : Row(
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.center,
            //                           children: [
            //                             Column(
            //                               crossAxisAlignment:
            //                                   CrossAxisAlignment.start,
            //                               children: [
            //                                 hintText("Available", kSuccess),
            //                                 hintText("Unavailable", kRed),
            //                               ],
            //                             ),
            //                             Column(
            //                               crossAxisAlignment:
            //                                   CrossAxisAlignment.start,
            //                               children: [
            //                                 hintText("Charging",
            //                                     Colors.green.shade800),
            //                                 hintText("In-progress", kInfo),
            //                               ],
            //                             ),
            //                           ],
            //                         ),
            //                 ),
            //               ],
            //             );
            //           } else {
            //             return EfiHttpErrorMessageWidget(snapshot.data);
            //           }
            //         } else {
            //           return const EfiHttpErrorMessageWidget([]);
            //         }
            //       } else {
            //         return const Center(child: CupertinoActivityIndicator());
            //       }
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  hintText(String title, Color color) {
    return Row(
      children: [
        Dot(color: color),
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Text(
            title,
            style: const TextStyle(
                fontFamily: 'MontserratRegular',
                color: kPrimaryTextColorShade,
                fontSize: 12),
          ),
        ),
      ],
    );
  }
}

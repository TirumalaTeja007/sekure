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
import 'package:smartsocket/app/widgets/efi_http_error_message_widget.dart';

import 'dot.dart';

class SessionChartWidget extends StatefulWidget {
  const SessionChartWidget(this.refreshSessionsChart, this.args, {Key? key})
      : super(key: key);
  final RxBool refreshSessionsChart;
  final Map args;

  @override
  State<SessionChartWidget> createState() => _SessionChartWidgetState();
}

class _SessionChartWidgetState extends State<SessionChartWidget> {
  List<ChartData> sessionsChartData = <ChartData>[];
  String errorMsg = "";
  bool processing = false;

  @override
  initState() {
    super.initState();
    streamAllTranxInfo();
  }

  streamAllTranxInfo() async {
    setState(() {
      processing = true;
      errorMsg = "";
      sessionsChartData = [];
    });
    await Future.delayed(const Duration(seconds: 1));
    final response = await callGetRequestWithoutParameters(
        routeID: "/TransactionHistory",
        api: widget.args["type"] == "ALL"
            ? getAllTranxUrl
            : "$tranxByUserNameUrl/${widget.args["userName"]}",
        header: {'Content-Type': 'application/json; charset=UTF-8'});

    print(response);

    if (response.runtimeType != String && response.statusCode == 200) {
      List sessionsInfo = jsonDecode(response.body)["data"];
      int ongoingCount = 0,
          completedCount = 0,
          pendingCount = 0,
          miscellaneousCount = 0;
      for (var x in sessionsInfo) {
        if (x["startDateTime"].runtimeType != Null) {
          int startTime = DateTime.parse(x["startDateTime"])
              .toLocal()
              .millisecondsSinceEpoch;
          int epochTime = DateTime.now().millisecondsSinceEpoch;
          if (x["sessionStatusEnum"] == "START" &&
              startTime - epochTime > 86400000) {
            ongoingCount++;
          } else if (x["sessionStatusEnum"] == "START" &&
              startTime - epochTime <= 86400000) {
            pendingCount++;
          } else if (x["sessionStatusEnum"] == "STOP" &&
              x["stopChargeReason"] == "Charging completed") {
            completedCount++;
          } else {
            miscellaneousCount++;
          }
        }
      }
      sessionsChartData.add(ChartData(
          'Sessions', sessionsInfo.length.toDouble(), Colors.orange, "90%"));
      ongoingCount != 0
          ? sessionsChartData.add(
              ChartData('Ongoing', ongoingCount.toDouble(), kSuccess, "90%"))
          : "";
      completedCount != 0
          ? sessionsChartData.add(
              ChartData('Completed', completedCount.toDouble(), kInfo, "90%"))
          : "";
      pendingCount != 0
          ? sessionsChartData
              .add(ChartData('Pending', pendingCount.toDouble(), kRed, "90%"))
          : "";
      miscellaneousCount != 0
          ? sessionsChartData.add(ChartData(
              'Miscellaneous', miscellaneousCount.toDouble(), kWarning, "90%"))
          : "";
      print(sessionsChartData);
    } else {
      jsonDecode(response.body)["data"] == []
          ? errorMsg = "No data"
          : errorMsg = 'Exception';
    }
    print(errorMsg);
    processing = false;
    setState(() {});
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
                "Sessions - EV Charge",
                style: TextStyle(
                    fontFamily: 'MontserratBold',
                    color: kPrimaryTextColor,
                    fontSize:
                        ResponsiveWidget.isSmallScreen(context) ? 18 : 20),
              ),
              trailing: IconButton(
                  icon:
                      const Icon(Icons.refresh, color: kPrimaryTextColorShade),
                  onPressed: () => streamAllTranxInfo()),
            ),
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
                padding: const EdgeInsets.only(top: 30),
                child: processing == true
                    ? errorMsg.isEmpty && sessionsChartData.isNotEmpty
                        ? Column(
                            children: [
                              PieChartWidget(sessionsChartData),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20.0),
                                child: screenSize.width >= 500
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          hintText("Completed", kInfo),
                                          hintText("Ongoing", kSuccess),
                                          hintText("Pending", kRed),
                                          hintText("Miscellaneous", kWarning),
                                        ],
                                      )
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              hintText("Completed", kInfo),
                                              hintText("Ongoing", kSuccess),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              hintText("Pending", kRed),
                                              hintText(
                                                  "Miscellaneous", kWarning),
                                            ],
                                          ),
                                        ],
                                      ),
                              ),
                            ],
                          )
                        : EfiHttpErrorMessageWidget(errorMsg)
                    : const Center(child: CupertinoActivityIndicator())),
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

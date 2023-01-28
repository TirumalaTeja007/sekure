import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:smartsocket/app/modules/user_profile/controller/user_profile_controller.dart';
import 'package:smartsocket/app/widgets/efi_http_error_message_widget.dart';
import 'package:smartsocket/app/widgets/piecchart.dart';
import 'package:smartsocket/constants/color_constants.dart';
import 'package:smartsocket/utils/responsive.dart';
import 'dot.dart';

class SessionChartWidget extends StatelessWidget {
  const SessionChartWidget(this.fetchSessionInfoState, this.sessionInfoResponse,
      this.fetchSessionInfo,
      {Key? key})
      : super(key: key);
  final Rx<MessageProcessingState> fetchSessionInfoState;
  final RxMap sessionInfoResponse;
  final Function() fetchSessionInfo;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double width = ResponsiveWidget.isLargeScreen(context)
        ? (screenSize.width - 304) < 850
            ? screenSize.width - 369
            : (screenSize.width - 384) * 0.4
        : screenSize.width > 850
            ? (screenSize.width - 60) * 0.465
            : screenSize.width - 30;
    return SizedBox(
      width: width,
      height: 500,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                  onPressed: () => fetchSessionInfo()),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
                padding: const EdgeInsets.only(top: 30),
                height: 380,
                child: Obx(
                  () => fetchSessionInfoState.value ==
                          MessageProcessingState.completed
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              height: 280,
                              child: PieChartWidget(
                                  sessionInfoResponse.value["data"],
                                  "sessionInfo"),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 20.0),
                              child: SizedBox(
                                width: width,
                                child: Wrap(
                                  direction: Axis.horizontal,
                                  alignment: WrapAlignment.center,
                                  spacing: 5.0,
                                  children: [
                                    hintText("Completed", kInfo, width),
                                    hintText("Ongoing", kSuccess, width),
                                    hintText("Pending", kRed, width),
                                    hintText("Miscellaneous", kWarning, width),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      : fetchSessionInfoState.value ==
                              MessageProcessingState.failed
                          ? EfiHttpErrorMessageWidget(
                              sessionInfoResponse["errorInfo"])
                          : const CupertinoActivityIndicator(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  hintText(String title, Color color, double width) {
    return SizedBox(
      width: width * 0.2,
      child: Row(
        children: [
          Dot(color: color),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                  fontFamily: 'MontserratRegular',
                  color: kPrimaryTextColorShade,
                  fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

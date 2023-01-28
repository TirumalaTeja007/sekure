import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:smartsocket/api/api_calls.dart';
import 'package:smartsocket/app/modules/user_profile/controller/user_profile_controller.dart';
import 'package:smartsocket/app/widgets/efi_http_error_message_widget.dart';
import 'package:smartsocket/constants/color_constants.dart';
import 'package:smartsocket/constants/network_constants.dart';
import 'package:smartsocket/utils/responsive.dart';
import '../../../widgets/dot.dart';

class UserWalletBalanceWidget extends StatelessWidget {
  const UserWalletBalanceWidget(this.controller, {Key? key}) : super(key: key);
  final UserProfileController controller;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double width = ResponsiveWidget.isLargeScreen(context)
        ? (screenSize.width - 304) < 850
            ? screenSize.width - 369
            : (screenSize.width - 384) * 0.4
        : screenSize.width > 850
            ? (screenSize.width - 60) * 0.465
            : screenSize.width - 60;
    print(width);
    return SizedBox(
      width: width,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Column(
          children: [
            ListTile(
              tileColor: kGrey,
              dense: true,
              leading: Text(
                "Smart Wallet",
                style: TextStyle(
                    fontFamily: 'MontserratBold',
                    color: kPrimaryTextColor,
                    fontSize:
                        ResponsiveWidget.isSmallScreen(context) ? 18 : 20),
              ),
              trailing: IconButton(
                  icon:
                      const Icon(Icons.refresh, color: kPrimaryTextColorShade),
                  onPressed: () => controller.fetchUserWalletBalance()),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(4)),
              padding: const EdgeInsets.only(top: 15),
              child: Obx(
                () => controller.fetchWalletBalanceState.value ==
                        MessageProcessingState.completed
                    ? Column(
                        children: [
                          ListTile(
                            dense: true,
                            leading: Text(
                              "Available Charge Points:",
                              style: TextStyle(
                                  fontFamily: 'MontserratRegular',
                                  color: kPrimaryTextColor,
                                  fontSize:
                                      ResponsiveWidget.isSmallScreen(context)
                                          ? 14
                                          : 16),
                            ),
                            title: Row(
                              children: [
                                const Icon(MdiIcons.lightningBoltOutline,
                                    color: Colors.green),
                                Text(
                                  controller.walletBalanceResponse
                                      .value["totalWalletAmount"]
                                      .toString(),
                                  style: TextStyle(
                                      fontFamily: 'MontserratBold',
                                      color: Colors.green,
                                      fontSize: ResponsiveWidget.isSmallScreen(
                                              context)
                                          ? 14
                                          : 16),
                                ),
                              ],
                            ),
                          ),
                          ListTile(
                            dense: true,
                            title: const Text("Last updated on:",
                                style: TextStyle(
                                    fontFamily: 'MontserratRegular',
                                    color: kPrimaryTextColorShade,
                                    fontSize: 14)),
                            subtitle: Text(
                              DateFormat()
                                  .format(DateTime.parse(controller
                                          .walletBalanceResponse
                                          .value["updatedTime"])
                                      .toLocal())
                                  .toString(),
                              style: const TextStyle(
                                  fontFamily: 'MontserratRegular',
                                  color: kPrimaryTextColor,
                                  fontSize: 14),
                            ),
                          ),
                        ],
                      )
                    : controller.fetchWalletBalanceState.value ==
                            MessageProcessingState.failed
                        ? EfiHttpErrorMessageWidget(
                            controller.walletBalanceResponse["errorInfo"])
                        : const CupertinoActivityIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:smartsocket/api/api_calls.dart';
import 'package:smartsocket/app/widgets/efi_http_error_message_widget.dart';
import 'package:smartsocket/constants/color_constants.dart';
import 'package:smartsocket/constants/network_constants.dart';
import 'package:smartsocket/utils/responsive.dart';
import 'dot.dart';

class UserWalletBalanceWidget extends StatefulWidget {
  const UserWalletBalanceWidget(this.getBalance, this.args, {Key? key})
      : super(key: key);
  final Function() getBalance;
  final Map args;

  @override
  State<UserWalletBalanceWidget> createState() =>
      _UserWalletBalanceWidgetState();
}

class _UserWalletBalanceWidgetState extends State<UserWalletBalanceWidget> {
  streamAllTranxInfo() async {
    await Future.delayed(const Duration(seconds: 1));
    final response = await callGetRequestWithoutParameters(
        routeID: "/WalletAmount",
        api: "$walletBalanceUrl/${widget.args["userName"]}",
        header: {'Content-Type': 'application/json; charset=UTF-8'});

    if (response.runtimeType != String && response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.runtimeType != String) {
      return 'Exception';
    }
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
                "Smart Wallet",
                style: TextStyle(
                    fontFamily: 'MontserratBold',
                    color: kPrimaryTextColor,
                    fontSize:
                        ResponsiveWidget.isSmallScreen(context) ? 18 : 20),
              ),
              trailing: IconButton(
                  icon: const Icon(Icons.refresh, color: kPrimaryTextColorShade),
                  onPressed: () {
                    setState(() {});
                  }),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(4)),
              padding: const EdgeInsets.only(top: 30),
              child: FutureBuilder(
                future: streamAllTranxInfo(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      if (snapshot.data.runtimeType != String &&
                          snapshot.data!.length != 0) {
                        return Column(
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
                                    snapshot.data!["totalWalletAmount"]
                                        .toStringAsFixed(2),
                                    style: TextStyle(
                                        fontFamily: 'MontserratBold',
                                        color: Colors.green,
                                        fontSize:
                                            ResponsiveWidget.isSmallScreen(
                                                    context)
                                                ? 14
                                                : 16),
                                  ),
                                ],
                              ),
                            ),
                            ListTile(
                              dense: true,
                              title: const Text(
                                "Last updated on:",
                                style: TextStyle(
                                    fontFamily: 'MontserratRegular',
                                    color: kPrimaryTextColorShade,
                                    fontSize: 14),
                              ),
                              subtitle: Text(
                                DateFormat()
                                    .format(DateTime.parse(
                                            snapshot.data!["updatedTime"])
                                        .toLocal())
                                    .toString(),
                                style: const TextStyle(
                                    fontFamily: 'MontserratRegular',
                                    color: kPrimaryTextColor,
                                    fontSize: 14),
                              ),
                            ),
                            ListTile(
                              dense: true,
                              title: const Text(
                                "Wallet created on:",
                                style: TextStyle(
                                    fontFamily: 'MontserratRegular',
                                    color: kPrimaryTextColorShade,
                                    fontSize: 14),
                              ),
                              subtitle: Text(
                                DateFormat()
                                    .format(DateTime.parse(
                                            snapshot.data!["createdTime"])
                                        .toLocal())
                                    .toString(),
                                style: const TextStyle(
                                    fontFamily: 'MontserratRegular',
                                    color: kPrimaryTextColor,
                                    fontSize: 14),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return EfiHttpErrorMessageWidget(snapshot.data);
                      }
                    } else {
                      return const EfiHttpErrorMessageWidget([]);
                    }
                  } else {
                    return const Center(child: CupertinoActivityIndicator());
                  }
                },
              ),
            ),
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

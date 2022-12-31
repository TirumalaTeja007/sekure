import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartsocket/app/modules/session_information/controller/session_information_controller.dart';
import 'package:smartsocket/constants/color_constants.dart';
import 'package:smartsocket/utils/responsive.dart';

class SessionInformationScreen extends GetView<SessionInformationController> {
  const SessionInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 55),
        child: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.white,
          elevation: 1,
          title: Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text("Session Information",
                style: TextStyle(
                    fontFamily: 'MontserratBold',
                    color: kPrimaryTextColor,
                    fontSize:
                        ResponsiveWidget.isSmallScreen(context) ? 20 : 24)),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Image.asset(
                "assets/Ax_logo.png",
                height: ResponsiveWidget.isSmallScreen(context) ? 25 : 45,
                color: kPrimaryTextColor,
              ),
            )
          ],
        ),
      ),
      body: ResponsiveWidget.isLargeScreen(context)
          ? SizedBox(
              height: screenSize.height - 80,
              child: body(context),
            )
          : SizedBox(
              height: screenSize.height - 55,
              child: body(context),
            ),
    );
  }

  Widget body(context) {
    var screenSize = MediaQuery.of(context).size;
    return Column(
      children: [],
    );
  }
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smartsocket/constants/color_constants.dart';
import 'package:smartsocket/utils/responsive.dart';

import '../controllers/splash_controller.dart';

class DashboardSplashView extends GetView<SplashController> {
  const DashboardSplashView({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryTextColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/logo/axonify_logo.png",
                      width: ResponsiveWidget.isLargeScreen(context)
                          ? 350
                          : ResponsiveWidget.isMediumScreen(context)
                              ? 300
                              : 200,
                      height: screenSize.height * 0.2,
                      color: Colors.white),
                  Container(
                      height: screenSize.height * 0.075,
                      width: 0.5,
                      color: Colors.white,
                      margin: const EdgeInsets.only(left: 10, right: 40)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "EV Charger",
                        style: TextStyle(
                          fontSize:
                              ResponsiveWidget.isSmallScreen(context) ? 24 : 34,
                          color: Colors.white,
                          fontFamily: 'MontserratRegular',
                        ),
                      ),
                      Text(
                        "Service Team",
                        style: TextStyle(
                          fontSize:
                              ResponsiveWidget.isSmallScreen(context) ? 24 : 34,
                          color: Colors.white,
                          fontFamily: 'MontserratRegular',
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

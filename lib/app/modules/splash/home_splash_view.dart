import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:smartsocket/constants/color_constants.dart';
import 'package:smartsocket/utils/responsive.dart';

import '../../../services/splash_service.dart';

class HomeSplashView extends GetView<SplashService> {
  const HomeSplashView({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/logo/ax_logo2.png",
                      height: ResponsiveWidget.isSmallScreen(context) ? 45 : 60,
                      color: Colors.blue.shade800),
                  Container(
                      height: 45,
                      width: 0.5,
                      color: Colors.black,
                      margin: const EdgeInsets.only(left: 30, right: 40)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "EV Charger",
                        style: TextStyle(
                          fontSize:
                              ResponsiveWidget.isSmallScreen(context) ? 14 : 20,
                          color: Colors.black,
                          fontFamily: 'MontserratRegular',
                        ),
                      ),
                      Text(
                        "Charging Solution",
                        style: TextStyle(
                          fontSize:
                              ResponsiveWidget.isSmallScreen(context) ? 14 : 20,
                          color: Colors.black,
                          fontFamily: 'MontserratRegular',
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 30),
              const SizedBox(
                height: 55,
                child: LoadingIndicator(
                    indicatorType: Indicator.pacman,

                    /// Required, The loading type of the widget
                    colors: [Colors.green],

                    /// Optional, The color collections
                    strokeWidth: 3,

                    /// Optional, The stroke of the line, only applicable to widget which contains line
                    backgroundColor: Colors.white,

                    /// Optional, Background of the widget
                    pathBackgroundColor: Colors.white

                    /// Optional, the stroke backgroundColor
                    ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

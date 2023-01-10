import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartsocket/app/widgets/bottom_bar.dart';
import '../../../../constants/color_constants.dart';
import '../../../../utils/responsive.dart';

class ClienteleInfo extends StatelessWidget {
  const ClienteleInfo({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SizedBox(
        width: screenSize.width,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ResponsiveWidget.isLargeScreen(context)
                  ? screenSize.width * 0.11
                  : screenSize.width * 0.075,
              vertical: screenSize.height / 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              screenSize.width < 800
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset("assets/clientele_logos/Logo.png",
                                width: (screenSize.width - 30) * 0.25,
                                height: 80),
                            Image.asset("assets/clientele_logos/Logo1.png",
                                width: (screenSize.width - 30) * 0.25,
                                height: 80),
                            Image.asset("assets/clientele_logos/Logo2.png",
                                width: (screenSize.width - 30) * 0.25,
                                height: 80),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset("assets/clientele_logos/Logo3.png",
                                width: (screenSize.width - 30) * 0.25,
                                height: 80),
                            Image.asset("assets/clientele_logos/Logo4.png",
                                width: (screenSize.width - 30) * 0.25,
                                height: 80),
                            Image.asset("assets/clientele_logos/Logo5.png",
                                width: (screenSize.width - 30) * 0.25,
                                height: 80),
                          ],
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset("assets/clientele_logos/Logo.png",
                            width: (screenSize.width * 0.78) * 0.15,
                            height: 100),
                        Image.asset("assets/clientele_logos/Logo1.png",
                            width: (screenSize.width * 0.78) * 0.15,
                            height: 100),
                        Image.asset("assets/clientele_logos/Logo2.png",
                            width: (screenSize.width * 0.78) * 0.15,
                            height: 100),
                        Image.asset("assets/clientele_logos/Logo3.png",
                            width: (screenSize.width * 0.78) * 0.15,
                            height: 100),
                        Image.asset("assets/clientele_logos/Logo4.png",
                            width: (screenSize.width * 0.78) * 0.15,
                            height: 100),
                        Image.asset("assets/clientele_logos/Logo5.png",
                            width: (screenSize.width * 0.78) * 0.15,
                            height: 100),
                      ],
                    ),
            ],
          ),
        ));
  }
}

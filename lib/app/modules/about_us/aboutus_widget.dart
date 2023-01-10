import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartsocket/app/widgets/bottom_bar.dart';
import '../../../constants/color_constants.dart';
import '../../../utils/responsive.dart';

class AboutUsWidget extends StatelessWidget {
  AboutUsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double horizontalPadding = ResponsiveWidget.isLargeScreen(context)
        ? screenSize.width * 0.11
        : screenSize.width * 0.075;
    double width = ResponsiveWidget.isLargeScreen(context)
        ? screenSize.width * 0.325
        : screenSize.width > 800
            ? screenSize.width * 0.4
            : screenSize.width * 0.7;
    Widget _image = Container(
        height: width,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            image: const DecorationImage(
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
                image: AssetImage(
                  'assets/images/AboutUs1.png',
                ))));
    Widget _text = SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: width,
            child: Text(
              "We Create Designs \nand Technology for ",
              style: TextStyle(
                  fontFamily: 'MontserratBold',
                  color: Colors.black,
                  fontSize: ResponsiveWidget.isSmallScreen(context) ? 20 : 36),
            ),
          ),
          SizedBox(
            width: width,
            child: Row(
              children: [
                Text(
                  "EV ",
                  style: TextStyle(
                      fontFamily: 'MontserratBold',
                      color: Colors.green,
                      fontSize:
                          ResponsiveWidget.isSmallScreen(context) ? 20 : 36),
                ),
                Text(
                  "Charging Systems ",
                  style: TextStyle(
                      fontFamily: 'MontserratBold',
                      color: Colors.black,
                      fontSize:
                          ResponsiveWidget.isSmallScreen(context) ? 20 : 36),
                ),
              ],
            ),
          ),
          SizedBox(
            width: width,
            child: Text(
              "\nAxonify Tech Systems is engaged in the design, development "
              "& manufacturing of smart products and focuses on "
              "providing solutions in the areas of EV Charging and IoT."
              "\n\nThe inspiration for our company name comes from the word "
              "'Axon'. Like, the Axon transmits information in the"
              " brain by connecting all the nerve cells, Axonify "
              "connects multiple devices and collaborates with external"
              " systems, and is controlled by a single app for a "
              "seamless user experience.",
              style: TextStyle(
                  fontFamily: 'Questrial',
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  height: 1.4,
                  fontSize: ResponsiveWidget.isSmallScreen(context)
                      ? 14
                      : ResponsiveWidget.isMediumScreen(context)
                          ? 16
                          : 18),
            ),
          ),
        ],
      ),
    );
    return SizedBox(
        width: screenSize.width,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              horizontalPadding, 0, horizontalPadding, screenSize.height / 12),
          child: Column(
            children: [
              screenSize.width > 800
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _image,
                        SizedBox(width: screenSize.width * 0.05),
                        _text
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _text,
                        SizedBox(height: screenSize.height * 0.05),
                        _image,
                      ],
                    ),
            ],
          ),
        ));
  }
}

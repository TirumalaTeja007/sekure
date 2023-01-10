import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartsocket/app/widgets/bottom_bar.dart';
import '../../../../constants/color_constants.dart';
import '../../../../utils/responsive.dart';

class CommercialChargersInfo extends StatelessWidget {
  CommercialChargersInfo({super.key});

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
    Widget _image = ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Image.asset(
        height: width * 1.1,
        width: width,
        fit: BoxFit.fill,
        filterQuality: FilterQuality.high,
        'assets/images/ss_product_image.png',
      ),
    );
    Widget _text = SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: width,
            child: Text(
              "COMMERCIAL CHARGERS (AC)",
              style: TextStyle(
                  fontFamily: 'Questrial',
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: ResponsiveWidget.isSmallScreen(context) ? 14 : 16),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: width,
            child: Row(
              children: [
                Text(
                  "Commercial ",
                  style: TextStyle(
                      fontFamily: 'MontserratBold',
                      color: Colors.green,
                      fontSize:
                          ResponsiveWidget.isSmallScreen(context) ? 20 : 36),
                ),
                Text(
                  "Charging ",
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
            child: Row(
              children: [
                Text(
                  "Simplified!",
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
              "\nOur Atom AC Socket is a super simple, easy-to-use, and"
              "pocket-friendly product for EV Charging. The universal"
              "design ensures charging for all types of vehicles including 2,"
              "3, and 4 wheelers."
              "\n\nThis product comes with a LED indicator that displays the"
              "status of charging and runs solely with the assistance of our"
              "remote monitoring Atom EV app. Small, compact and easily"
              "installable, this product is suitable for large, commercial,"
              "office, and outdoor parking areas and comes with safe"
              "payment gateway options.",
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
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0))),
            onPressed: () {},
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
              child: Text(
                "Learn more...",
                style: TextStyle(
                    fontFamily: 'Questrial',
                    color: Colors.white,
                    fontSize:
                        ResponsiveWidget.isSmallScreen(context) ? 12 : 14),
              ),
            ),
          )
        ],
      ),
    );
    return SizedBox(
        width: screenSize.width,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              horizontalPadding, 0, horizontalPadding, screenSize.height / 12),
          child: screenSize.width > 800
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _text,
                    SizedBox(width: screenSize.width * 0.05),
                    _image
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _text,
                    SizedBox(height: screenSize.height * 0.05),
                    _image
                  ],
                ),
        ));
  }
}

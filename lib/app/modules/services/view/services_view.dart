import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartsocket/app/widgets/bottom_bar.dart';
import 'package:smartsocket/app/widgets/under_maintenance.dart';
import '../../../../constants/color_constants.dart';
import '../../../../utils/responsive.dart';
import '../controller/services_controller.dart';

class ServicesView extends GetView<ServicesController> {
  const ServicesView({super.key});

  Widget pointers1(BuildContext context, Size screenSize) {
    return SizedBox(
      width: !ResponsiveWidget.isLargeScreen(context)
          ? screenSize.width * 0.78
          : screenSize.width * 0.25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("01",
              style: TextStyle(
                  fontFamily: 'MontserratRegular',
                  color: Colors.black38,
                  fontSize: 30)),
          const SizedBox(height: 15),
          SizedBox(
            width: !ResponsiveWidget.isLargeScreen(context)
                ? screenSize.width * 0.78
                : screenSize.width * 0.25,
            child: Row(
              children: [
                const Text("In house R&D and Production",
                    style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Colors.black,
                        fontSize: 16)),
                SizedBox(
                  width: 25,
                  child: Image.asset("assets/images/leaf.png",
                      color: kGreen, height: 20),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          const Text(
              "We control the production and reduce the chances "
              "of errors because everything is made in one place.",
              style: TextStyle(
                  fontFamily: 'MontserratRegular',
                  color: Colors.black,
                  fontSize: 16)),
        ],
      ),
    );
  }

  Widget pointers2(BuildContext context, Size screenSize) {
    return SizedBox(
      width: !ResponsiveWidget.isLargeScreen(context)
          ? screenSize.width * 0.78
          : screenSize.width * 0.25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("02",
              style: TextStyle(
                  fontFamily: 'MontserratRegular',
                  color: Colors.black38,
                  fontSize: 30)),
          const SizedBox(height: 15),
          SizedBox(
              width: !ResponsiveWidget.isLargeScreen(context)
                  ? screenSize.width * 0.78
                  : screenSize.width * 0.25,
              child: Row(
                children: [
                  const Text("Customized EV Charging Solutions",
                      style: TextStyle(
                          fontFamily: 'MontserratRegular',
                          color: Colors.black,
                          fontSize: 16)),
                  Image.asset("assets/images/leaf.png",
                      color: kGreen, height: 20),
                ],
              )),
          const SizedBox(height: 15),
          const Text(
              "We offer a variety of options to choose from "
              "depending upon your requirement and budget.",
              style: TextStyle(
                  fontFamily: 'MontserratRegular',
                  color: Colors.black,
                  fontSize: 16)),
        ],
      ),
    );
  }

  Widget pointers3(BuildContext context, Size screenSize) {
    return SizedBox(
      width: !ResponsiveWidget.isLargeScreen(context)
          ? screenSize.width * 0.78
          : screenSize.width * 0.25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("03",
              style: TextStyle(
                  fontFamily: 'MontserratRegular',
                  color: Colors.black38,
                  fontSize: 30)),
          const SizedBox(height: 15),
          SizedBox(
            width: !ResponsiveWidget.isLargeScreen(context)
                ? screenSize.width * 0.78
                : screenSize.width * 0.25,
            child: Row(
              children: [
                const Text("Strong Support ",
                    style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Colors.black,
                        fontSize: 16)),
                Image.asset("assets/images/leaf.png",
                    color: kGreen, height: 20),
              ],
            ),
          ),
          const SizedBox(height: 15),
          const Text(
              "We stay with you at every step guiding you and making "
              "it easy for you to use the product.",
              style: TextStyle(
                  fontFamily: 'MontserratRegular',
                  color: Colors.black,
                  fontSize: 16)),
        ],
      ),
    );
  }

  Widget intro(BuildContext context, Size screenSize) {
    return SizedBox(
      width: ResponsiveWidget.isSmallScreen(context)
          ? screenSize.width * 0.78
          : screenSize.width * 0.35,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: ResponsiveWidget.isSmallScreen(context)
                ? screenSize.width * 0.78
                : screenSize.width * 0.35,
            child: const Text(
              "WE CREATE DESIGNS\nAND TECHNOLOGY FOR\nEV CHARGING SYSTEMS",
              style: TextStyle(
                  fontFamily: 'MontserratBold',
                  color: Colors.black,
                  fontSize: 30),
            ),
          ),
          Container(
            width: 250,
            height: 5,
            decoration: BoxDecoration(
                color: Colors.black26, borderRadius: BorderRadius.circular(4)),
            margin: const EdgeInsets.symmetric(vertical: 20),
          ),
          SizedBox(
            width: ResponsiveWidget.isSmallScreen(context)
                ? screenSize.width * 0.78
                : screenSize.width * 0.35,
            child: const Text(
              "Axonify Tech Systems is engaged in the design, development "
              "& manufacturing of smart products and focuses on "
              "providing solutions in the areas of EV Charging and IoT.",
              style: TextStyle(
                  fontFamily: 'MontserratRegular',
                  color: Colors.black,
                  fontSize: 16),
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: ResponsiveWidget.isSmallScreen(context)
                ? screenSize.width * 0.78
                : screenSize.width * 0.35,
            child: const Text(
              "\nThe inspiration for our company name comes from the word "
              "'Axon'. Like, the Axon transmits information in the"
              " brain by connecting all the nerve cells, Axonify "
              "connects multiple devices and collaborates with external"
              " systems, and is controlled by a single app for a "
              "seamless user experience.",
              style: TextStyle(
                  fontFamily: 'MontserratRegular',
                  color: Colors.black,
                  fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget intro2(BuildContext context, Size screenSize) {
    return SizedBox(
      width: ResponsiveWidget.isSmallScreen(context)
          ? screenSize.width * 0.78
          : screenSize.width * 0.325,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: ResponsiveWidget.isSmallScreen(context)
                ? screenSize.width * 0.78
                : screenSize.width * 0.325,
            child: const Text(
              "OUR FOCUS ON CREATING SUSTAINABLE ENERGY SOLUTIONS, "
              "ACCELERATES THE HEALTH OF THE PLANET BY "
              "REDUCING CARBON FOOTPRINT.",
              style: TextStyle(
                  fontFamily: 'MontserratBold',
                  color: Colors.black,
                  fontSize: 30),
            ),
          ),
          Container(
            width: 250,
            height: 5,
            decoration: BoxDecoration(
                color: Colors.black26, borderRadius: BorderRadius.circular(4)),
            margin: const EdgeInsets.symmetric(vertical: 20),
          ),
          SizedBox(
            width: ResponsiveWidget.isSmallScreen(context)
                ? screenSize.width * 0.78
                : screenSize.width * 0.325,
            child: const Text(
              "We are engineers at heart. Technology innovation is "
              "our core value and we strive to build products "
              "that are current, easy-to-use, and the ones we "
              "love to use. We aim to make our products and "
              "services fast, and extremely user-friendly. "
              "We are a one-stop solution for EV Chargers, "
              "wherein we design, manufacture, and deploy our "
              "products. Our use of the latest technology and "
              "equipment sets us apart from the products available"
              " in the market and is backed by intensive research.",
              style: TextStyle(
                  fontFamily: 'MontserratRegular',
                  color: Colors.black,
                  fontSize: 16),
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: ResponsiveWidget.isSmallScreen(context)
                ? screenSize.width * 0.78
                : screenSize.width * 0.325,
            child: const Text(
              "\nRavi Mahankali, Amarpal Gampa",
              style: TextStyle(
                  fontFamily: 'MontserratRegular',
                  color: Colors.black,
                  fontSize: 20),
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: ResponsiveWidget.isSmallScreen(context)
                ? screenSize.width * 0.78
                : screenSize.width * 0.325,
            child: const Text(
              "\nFounders",
              style: TextStyle(
                  fontFamily: 'MontserratRegular',
                  color: Colors.black,
                  fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: const [UnderMaintenance("Services"), BottomBar()]);
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartsocket/app/widgets/bottom_bar.dart';
import '../../../../../constants/color_constants.dart';
import '../../../../../utils/responsive.dart';
import '../../../../utils/scroll_behaviour.dart';
import '../controller/aboutus_controller.dart';

class AboutUsView extends GetView<AboutUsController> {
  AboutUsView({super.key});

  Widget pointers1(BuildContext context, Size screenSize, double width) {
    return SizedBox(
      width: width,
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
            width: width,
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

  Widget pointers2(BuildContext context, Size screenSize, double width) {
    return SizedBox(
      width: width,
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
            width: width,
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
            ),
          ),
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

  Widget pointers3(BuildContext context, Size screenSize, double width) {
    return SizedBox(
      width: width,
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
            width: width,
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

  Widget intro(BuildContext context, Size screenSize, double width) {
    final width = !ResponsiveWidget.isLargeScreen(context)
        ? screenSize.width * 0.78
        : screenSize.width * 0.35;
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: width,
            child: const Text(
              "WE CREATE DESIGNS \nAND TECHNOLOGY FOR \nEV CHARGING SYSTEMS",
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
            width: width,
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
            width: width,
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

  Widget intro2(BuildContext context, Size screenSize, double width) {
    final width = screenSize.width < 850
        ? screenSize.width * 0.78
        : screenSize.width * 0.35;
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: width,
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
            width: width,
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
            width: width,
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
            width: width,
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
    var screenSize = MediaQuery.of(Get.key.currentContext!).size;

    double horizontalPadding = ResponsiveWidget.isLargeScreen(context)
        ? screenSize.width * 0.11
        : screenSize.width * 0.075;
    List<Widget> children1 = [
      intro(Get.key.currentContext!, screenSize, screenSize.width * .42),
      Padding(
        padding: EdgeInsets.only(
            left: ResponsiveWidget.isLargeScreen(context) ? 30 : 0,
            top: ResponsiveWidget.isLargeScreen(context) ? 5 : 30),
        child: Image.asset(
          'assets/images/aboutUs.png',
          width: !ResponsiveWidget.isLargeScreen(context)
              ? screenSize.width * 0.78
              : screenSize.width * 0.285,
          height: screenSize.height * 0.4,
          fit: BoxFit.fitHeight,
        ),
      ),
    ];

    List<Widget> children2 = [
      intro2(Get.key.currentContext!, screenSize, screenSize.width * .42),
      Padding(
        padding: EdgeInsets.only(
            left: ResponsiveWidget.isLargeScreen(context) ? 10 : 0,
            top: ResponsiveWidget.isLargeScreen(context) ? 5 : 30),
        child: Image.asset(
          'assets/images/aboutUs1.png',
          width: !ResponsiveWidget.isLargeScreen(context)
              ? screenSize.width * 0.78
              : screenSize.width * 0.285,
          height: screenSize.height * 0.4,
          fit: BoxFit.cover,
        ),
      ),
    ];
    return Scaffold(
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
            scrollbars: false,
            overscroll: true,
            dragDevices: MyCustomScrollBehavior().dragDevices),
        child: ListView(
          controller: controller.scrollController,
          scrollDirection: Axis.vertical,
          physics: const ClampingScrollPhysics(),
          children: [
            SizedBox(height: screenSize.height / 10),
            Container(
              width: screenSize.width,
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: !ResponsiveWidget.isLargeScreen(context)
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: children1,
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: children1,
                    ),
            ),
            SizedBox(height: screenSize.height / 8),
            Container(
              width: screenSize.width,
              padding:
                  EdgeInsets.symmetric(horizontal: screenSize.width * 0.11),
              child: screenSize.width > 1200
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        pointers1(Get.key.currentContext!, screenSize,
                            screenSize.width * 0.78 / 3),
                        pointers2(Get.key.currentContext!, screenSize,
                            screenSize.width * 0.78 / 3),
                        pointers3(Get.key.currentContext!, screenSize,
                            screenSize.width * 0.78 / 3),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        pointers1(Get.key.currentContext!, screenSize,
                            screenSize.width * 0.85),
                        const SizedBox(height: 30),
                        pointers2(Get.key.currentContext!, screenSize,
                            screenSize.width * 0.85),
                        const SizedBox(height: 30),
                        pointers3(Get.key.currentContext!, screenSize,
                            screenSize.width * 0.85),
                      ],
                    ),
            ),
            SizedBox(height: screenSize.height / 8),
            Container(
              width: screenSize.width,
              padding: EdgeInsets.symmetric(
                  vertical: screenSize.height / 7,
                  horizontal: horizontalPadding),
              color: const Color(0xfff0ecec),
              child: !ResponsiveWidget.isLargeScreen(context)
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: children2,
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: children2,
                    ),
            ),
            const BottomBar()
          ],
        ),
      ),
    );
  }
}

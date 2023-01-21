import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartsocket/app/widgets/bottom_bar.dart';
import 'package:smartsocket/utils/scroll_behaviour.dart';
import '../../../../constants/color_constants.dart';
import '../../../../utils/responsive.dart';
import '../../../widgets/dot.dart';
import '../controller/policy_page_controller.dart';

class ShippingPolicyView extends GetView<PolicyPageController> {
  const ShippingPolicyView({super.key});

  Widget intro(BuildContext context, Size screenSize) {
    final width = screenSize.width < 850
        ? screenSize.width * 0.78
        : screenSize.width * 0.4;
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: width,
            child: Text(
              "Shipping Policy",
              style: TextStyle(
                  fontFamily: 'MontserratBold',
                  color: Colors.black,
                  fontSize: ResponsiveWidget.isLargeScreen(context)
                      ? 32
                      : ResponsiveWidget.isMediumScreen(context)
                      ? 26
                      : 22),
            ),
          ),
          Container(
            width: 175,
            height: 5,
            decoration: BoxDecoration(
                color: Colors.black26, borderRadius: BorderRadius.circular(4)),
            margin: const EdgeInsets.symmetric(vertical: 10),
          ),
          Text(
            "\nEffective date: 2022-11-28",
            style: TextStyle(
                fontFamily: 'MontserratRegular',
                color: Colors.black,
                fontSize: ResponsiveWidget.isSmallScreen(context) ? 14 : 16),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: width,
            child: Text(
              "Axonify Tech Systems (“us”, “we”, or “our”) operates ninedots.axonifytech.com (hereinafter referred to as “Service”)."
              "\n\nWe do not sell products in our website. We provide a continuous service to the customers, a type of payment service through which individuals can pay by adding money to their Smart Wallet."
              "\n\nIn other words, it is a digital technology to pay your bills online instantly without having to pay by cash or use your credit or debit card all the time. It acts like a virtual wallet, which can be preloaded with your preferred amount of money from your bank account or credit or debit cards and used to spend it online"
              "\n\nWe collect money from the customers for CHARGING THEIR EV VEHICLE at our charging stations. Cost of charging will be based on the units (kWh) consumed to charge the Electric Vehicle.",
              style: TextStyle(
                  fontFamily: 'MontserratRegular',
                  color: Colors.black,
                  fontSize: ResponsiveWidget.isSmallScreen(context) ? 14 : 16),
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
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
          scrollbars: false,
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
            child: screenSize.width < 850
                ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                intro(Get.key.currentContext!, screenSize),
                const SizedBox(width: 30),
                Image.asset(
                  'assets/images/shipping_policy.jpg',
                  width: screenSize.width < 850
                      ? screenSize.width * 0.78
                      : screenSize.width * 0.3,
                  height: screenSize.height * 0.45,
                  fit: BoxFit.fitHeight,
                ),
              ],
            )
                : Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                intro(Get.key.currentContext!, screenSize),
                const SizedBox(width: 30),
                Image.asset(
                  'assets/images/shipping_policy.jpg',
                  width: screenSize.width < 850
                      ? screenSize.width * 0.78
                      : screenSize.width * 0.3,
                  height: screenSize.height * 0.45,
                  fit: BoxFit.fitHeight,
                ),
              ],
            ),
          ),
          SizedBox(height: screenSize.height / 10),
          const BottomBar()
        ],
      ),
    );
  }
}

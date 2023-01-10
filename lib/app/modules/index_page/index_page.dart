import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartsocket/app/modules/about_us/aboutus_widget.dart';
import 'package:smartsocket/app/modules/index_page/widgets/clientele_info.dart';
import 'package:smartsocket/app/modules/index_page/widgets/commercial_chargers_info.dart';
import 'package:smartsocket/app/modules/index_page/widgets/talk_to_expert_widget.dart';
import 'package:smartsocket/utils/scroll_behaviour.dart';
import '../../../constants/color_constants.dart';
import '../../../utils/responsive.dart';
import '../../widgets/bottom_bar.dart';

class IndexPageView extends StatefulWidget {
  const IndexPageView({Key? key}) : super(key: key);

  @override
  State<IndexPageView> createState() => _IndexPageViewState();
}

class _IndexPageViewState extends State<IndexPageView> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    if (scrollController.hasClients) {
      final position = scrollController.position.minScrollExtent;
      scrollController.animateTo(
        position,
        duration: const Duration(seconds: 1),
        curve: Curves.easeOut,
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double horizontalPadding = ResponsiveWidget.isLargeScreen(context)
        ? screenSize.width * 0.11
        : screenSize.width * 0.075;
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
          scrollbars: false,
          dragDevices: MyCustomScrollBehavior().dragDevices,
          overscroll: true,
          physics: const BouncingScrollPhysics()),
      child: ListView(
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            height: screenSize.height * 0.8,
            width: screenSize.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                    image: AssetImage(
                      'assets/images/home_bg_image.png',
                    ))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: screenSize.width,
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.black87,
                    Colors.black26,
                    Colors.black12,
                    Colors.transparent
                  ], stops: [
                    0,
                    0.25,
                    0.5,
                    1
                  ])),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Smart Socket",
                        style: TextStyle(
                            fontFamily: 'Questrial',
                            color: Colors.white54,
                            fontSize: ResponsiveWidget.isSmallScreen(context)
                                ? 14
                                : 18),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Smart EV charging stations"
                        "\nand software for"
                        "\nall businesses",
                        style: TextStyle(
                            fontFamily: 'MontserratBold',
                            color: Colors.white,
                            fontSize: ResponsiveWidget.isSmallScreen(context)
                                ? 22
                                : 36),
                      ),
                      const SizedBox(height: 25),
                      const TalkToAnExpertWidget(Colors.white, kPrimaryTextColor)
                    ],
                  ),
                )
              ],
            ),
          ),
          const ClienteleInfo(),
          AboutUsWidget(),
          CommercialChargersInfo(),
          Container(
            color: kGrey,
            padding: EdgeInsets.symmetric(
                vertical: screenSize.height / 10,
                horizontal: horizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: screenSize.width * 0.7,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Found the',
                      style: TextStyle(
                          fontFamily: 'MontserratBold',
                          color: kPrimaryTextColor,
                          fontSize: screenSize.height * 0.032),
                      children: <TextSpan>[
                        TextSpan(
                            text: " EV Charging Solution ",
                            style: TextStyle(
                                fontFamily: 'MontserratBold',
                                fontSize: screenSize.height * 0.032,
                                color: kGreen)),
                        TextSpan(
                            text: "you're looking for? ",
                            style: TextStyle(
                                fontFamily: 'MontserratBold',
                                fontSize: screenSize.height * 0.032,
                                color: kPrimaryTextColor)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: screenSize.width * 0.6,
                  child: Text(
                    "Simply fill out your details and we'll give you a call to "
                    "discuss the right solution for your charging needs.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Questrial',
                        color: kPrimaryTextColor,
                        fontSize: ResponsiveWidget.isSmallScreen(context)
                            ? 14
                            : ResponsiveWidget.isMediumScreen(context)
                                ? 16
                                : 18),
                  ),
                ),
                const SizedBox(height: 30),
                const TalkToAnExpertWidget(kBgColor, Colors.white),
              ],
            ),
          ),
          const BottomBar()
        ],
      ),
    );
  }
}

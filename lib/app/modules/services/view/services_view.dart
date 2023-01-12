import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartsocket/app/modules/index_page/widgets/commercial_chargers_info.dart';
import 'package:smartsocket/app/modules/index_page/widgets/talk_to_expert_widget.dart';
import 'package:smartsocket/app/widgets/bottom_bar.dart';
import 'package:smartsocket/app/widgets/under_maintenance.dart';
import '../../../../constants/color_constants.dart';
import '../../../../utils/responsive.dart';
import '../controller/services_controller.dart';

class ServicesView extends GetView<ServicesController> {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return ListView(children: [
      SizedBox(height: screenSize.height / 10),
      _chargerIntro(context),
      _keyFeatures(context),
      SizedBox(height: screenSize.height / 10),
      CommercialChargersInfo(showButton: false),
      _useCases(context),
      _specifications(context),
      const BottomBar()
    ]);
  }

  Widget _chargerIntro(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double horizontalPadding = ResponsiveWidget.isLargeScreen(context)
        ? screenSize.width * 0.11
        : screenSize.width * 0.075;
    double width = ResponsiveWidget.isLargeScreen(context)
        ? screenSize.width * 0.325
        : screenSize.width > 800
            ? screenSize.width * 0.4
            : screenSize.width * 0.7;
    Widget carouselSlider = SizedBox(
      width: width,
      height: width * 0.7,
      child: CarouselSlider(
        disableGesture: false,
        items: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.asset(
              width: width,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.low,
              'assets/images/socket_view2.png',
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.asset(
              width: width,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.low,
              'assets/images/socket_view.png',
            ),
          )
        ],
        options: CarouselOptions(
          enlargeCenterPage: true,
          autoPlay: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          viewportFraction: 0.8,
        ),
      ),
    );
    Widget text = SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: width,
            child: RichText(
              text: TextSpan(
                text: 'Atom AC Socket 3.3 kW',
                style: TextStyle(
                    fontFamily: 'MontserratBold',
                    color: Colors.black,
                    fontSize: ResponsiveWidget.isLargeScreen(context)
                        ? 32
                        : ResponsiveWidget.isMediumScreen(context)
                            ? 28
                            : 22),
              ),
            ),
          ),
          Text(
            "Atom411-3S03",
            style: TextStyle(
                fontFamily: 'MontserratRegular',
                color: Colors.black45,
                height: 1.4,
                fontSize: ResponsiveWidget.isSmallScreen(context)
                    ? 14
                    : 16),
          ),
          SizedBox(
            width: width,
            child: Text(
              "\nOur Atom AC Socket is a classic and pocket-friendly EV Charging "
              "solution for commercial charging. The safe and ergonomic "
              "design and user-friendly payment gateway ensure a seamless "
              "user experience. The compact design makes this charger easily"
              " adaptable in smaller spaces."
              "\n   •   Compact Design"
              "\n   •   Socket"
              "\n   •   High Quality"
              "\n\nCapacity",
              style: TextStyle(
                  fontFamily: 'MontserratRegular',
                  color: Colors.black,
                  height: 1.4,
                  fontSize: ResponsiveWidget.isSmallScreen(context)
                      ? 14
                      : 16),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: kGrey, borderRadius: BorderRadius.circular(8.0)),
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.only(top: 5, bottom: 30),
            child: Text(
              "3.3 kW",
              style: TextStyle(
                  fontFamily: 'MontserratBold',
                  color: Colors.black,
                  height: 1,
                  fontSize: ResponsiveWidget.isSmallScreen(context)
                      ? 14
                      : 16),
            ),
          ),
          Container(
            width: width,
            decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: Colors.black12))),
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                "Support",
                style: TextStyle(
                    fontFamily: 'MontserratRegular',
                    color: Colors.black,
                    fontSize: ResponsiveWidget.isSmallScreen(context)
                        ? 14
                        : 16),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const TalkToAnExpertWidget(Color(0xff20242c), Colors.white)
        ],
      ),
    );
    return SizedBox(
        width: screenSize.width,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              horizontalPadding, 0, horizontalPadding, screenSize.height / 8),
          child: Column(
            children: [
              screenSize.width > 800
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        carouselSlider,
                        SizedBox(width: screenSize.width * 0.05),
                        text
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        carouselSlider,
                        SizedBox(height: screenSize.height * 0.05),
                        text,
                      ],
                    ),
            ],
          ),
        ));
  }

  Widget _keyFeatures(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double horizontalPadding = ResponsiveWidget.isLargeScreen(context)
        ? screenSize.width * 0.11
        : screenSize.width * 0.075;
    double width = ResponsiveWidget.isLargeScreen(context)
        ? screenSize.width * 0.325
        : screenSize.width > 800
            ? screenSize.width * 0.4
            : screenSize.width * 0.7;
    Widget carouselSlider = SizedBox(
      width: width,
      height: width * 0.7,
      child: CarouselSlider(
        disableGesture: false,
        items: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.asset(
              width: width,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.low,
              'assets/images/socket_view.png',
            ),
          ),
        ],
        options: CarouselOptions(
          enlargeCenterPage: true,
          autoPlay: false,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          viewportFraction: 0.8,
        ),
      ),
    );
    Widget text = SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: width,
            child: RichText(
              text: TextSpan(
                text: 'Key Features',
                style: TextStyle(
                    fontFamily: 'MontserratBold',
                    color: Colors.white,
                    fontSize: ResponsiveWidget.isLargeScreen(context)
                        ? 32
                        : ResponsiveWidget.isMediumScreen(context)
                            ? 28
                            : 22),
              ),
            ),
          ),
          SizedBox(
            width: width,
            child: RichText(
              text: TextSpan(
                text:
                    "\nOur Atom AC Socket is a smart EV charging solution perfect for "
                    "low-budget commercial EV charging requirements. With a super "
                    "compact design, this product comes with a LED indicator "
                    "that displays the status of charging and runs solely with "
                    "the assistance of our remote monitoring Smart Socket app. "
                    "\n\nThis EV socket comes with all safety functionality "
                    "& stabilized voltage and supports a more slow and "
                    "relaxed charging and can be best used where there "
                    "is no rush for EV charging.\n",
                style: TextStyle(
                    fontFamily: 'MontserratRegular',
                    color: Colors.white,
                    height: 1.4,
                    fontSize: ResponsiveWidget.isSmallScreen(context)
                        ? 14
                        : 16),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const TalkToAnExpertWidget(Colors.white, Colors.black)
        ],
      ),
    );

    final pointersWidth = ResponsiveWidget.isSmallScreen(context)
        ? screenSize.width * 0.75
        : screenSize.width * 0.75 * 0.3;

    List<Widget> pointers = [
      _pointerWidget(
          context,
          'Access Control',
          "Enjoy peace-of-mind by using the"
              "Smart Socket app authentication.",
          Icons.accessibility_new_outlined,
          pointersWidth,
          Colors.white,
          true,
          true),
      _pointerWidget(
          context,
          'Safety',
          "Safety first, with various protection"
              "features built-in for Surge, Ground Fault, Short Circuit etc.",
          Icons.shield_rounded,
          pointersWidth,
          Colors.white,
          true,
          true),
      _pointerWidget(
          context,
          'Payment Gateway',
          "Secure payment options "
              "including UPI, Debit/Credit cards.",
          Icons.wallet,
          pointersWidth,
          Colors.white,
          true,
          true),
    ];

    return Container(
        width: screenSize.width,
        color: const Color(0xff20242c),
        child: Padding(
          padding: EdgeInsets.fromLTRB(horizontalPadding, screenSize.height / 6,
              horizontalPadding, screenSize.height / 6),
          child: Column(
            children: [
              screenSize.width > 800
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        text,
                        SizedBox(width: screenSize.width * 0.05),
                        carouselSlider,
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        carouselSlider,
                        SizedBox(height: screenSize.height * 0.05),
                        text,
                      ],
                    ),
              SizedBox(height: screenSize.height / 16),
              !ResponsiveWidget.isSmallScreen(context)
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: pointers,
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: pointers,
                    ),
            ],
          ),
        ));
  }

  Widget _useCases(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double horizontalPadding = ResponsiveWidget.isLargeScreen(context)
        ? screenSize.width * 0.11
        : screenSize.width * 0.075;
    final pointersWidth = ResponsiveWidget.isSmallScreen(context)
        ? screenSize.width * 0.75
        : screenSize.width * 0.75 * 0.3;
    List<Widget> pointers = [
      _pointerWidget(context, 'Home', "Homes & Villas", Icons.home,
          pointersWidth, Colors.black, false, true),
      _pointerWidget(context, 'Commercial', "IT Parks & Office Buildings",
          Icons.work_rounded, pointersWidth, Colors.black, false, true),
      _pointerWidget(context, 'Residential', "Apartments",
          Icons.location_city_sharp, pointersWidth, Colors.black, false, true),
    ];
    return Column(
      children: [
        Container(
          width: screenSize.width,
          color: kGrey,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                horizontalPadding,
                screenSize.height / 10,
                horizontalPadding,
                screenSize.height / 10),
            child: Column(
              children: [
                screenSize.width > 800
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: pointers,
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: pointers,
                      ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _specifications(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double horizontalPadding = ResponsiveWidget.isLargeScreen(context)
        ? screenSize.width * 0.11
        : screenSize.width * 0.075;
    final pointersWidth = screenSize.width * 0.75 * 0.55;
    return SizedBox(
      width: screenSize.width,
      child: Padding(
        padding: EdgeInsets.fromLTRB(horizontalPadding, screenSize.height / 10,
            horizontalPadding, screenSize.height / 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                text: 'Technical Specification',
                style: TextStyle(
                    fontFamily: 'MontserratBold',
                    color: Colors.black,
                    fontSize: ResponsiveWidget.isLargeScreen(context)
                        ? 32
                        : ResponsiveWidget.isMediumScreen(context)
                            ? 28
                            : 22),
              ),
            ),
            const SizedBox(height: 8),
            const Divider(color: Colors.black12, indent: 0.0),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: screenSize.width * 0.75 * 0.4,
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: 'Product Information',
                      style: TextStyle(
                          fontFamily: 'MontserratBold',
                          color: Colors.black,
                          fontSize: ResponsiveWidget.isLargeScreen(context)
                              ? 24
                              : ResponsiveWidget.isMediumScreen(context)
                                  ? 22
                                  : 18),
                    ),
                  ),
                ),
                SizedBox(width: screenSize.width * 0.75 * 0.05),
                Column(
                  children: [
                    _pointerWidget(
                        context,
                        'Input/output power rating and current',
                        "Single-phase: 3.3 kW / 16A",
                        Icons.home,
                        pointersWidth,
                        Colors.black,
                        false,
                        false),
                    _pointerWidget(
                        context,
                        'Input/ouput voltage',
                        "Single-phase: 230 V nominal, 50 Hz",
                        Icons.home,
                        pointersWidth,
                        Colors.black,
                        false,
                        false),
                    _pointerWidget(
                        context,
                        'Socket outlet or connector type',
                        "1 Socket: Bharath AC001 Industrial Socket (IEC 60309)",
                        Icons.home,
                        pointersWidth,
                        Colors.black,
                        false,
                        false),
                    _pointerWidget(context, 'Energy metering', "Basic",
                        Icons.home, pointersWidth, Colors.black, false, false),
                    _pointerWidget(
                        context,
                        'Protection',
                        "Over-current, short circuit protection, ground fault, residual current protection.",
                        Icons.home,
                        pointersWidth,
                        Colors.black,
                        false,
                        false),
                  ],
                ),
              ],
            ),
            const Divider(color: Colors.black12, indent: 0.0),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: screenSize.width * 0.75 * 0.4,
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: 'User Interface',
                      style: TextStyle(
                          fontFamily: 'MontserratBold',
                          color: Colors.black,
                          fontSize: ResponsiveWidget.isLargeScreen(context)
                              ? 24
                              : ResponsiveWidget.isMediumScreen(context)
                                  ? 22
                                  : 18),
                    ),
                  ),
                ),
                SizedBox(width: screenSize.width * 0.75 * 0.05),
                Column(
                  children: [
                    _pointerWidget(context, 'Connectivity', "Bluetooth",
                        Icons.home, pointersWidth, Colors.black, false, false),
                    _pointerWidget(
                        context,
                        'Status indication',
                        "In App",
                        Icons.work_rounded,
                        pointersWidth,
                        Colors.black,
                        false,
                        false),
                    _pointerWidget(
                        context,
                        'User authentication',
                        "Smart Socket app",
                        Icons.location_city_sharp,
                        pointersWidth,
                        Colors.black,
                        false,
                        false),
                    _pointerWidget(
                        context,
                        'User interface',
                        "Basic",
                        Icons.location_city_sharp,
                        pointersWidth,
                        Colors.black,
                        false,
                        false),
                  ],
                ),
              ],
            ),
            const Divider(color: Colors.black12, indent: 0.0),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: screenSize.width * 0.75 * 0.4,
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: 'Configuration',
                      style: TextStyle(
                          fontFamily: 'MontserratBold',
                          color: Colors.black,
                          fontSize: ResponsiveWidget.isLargeScreen(context)
                              ? 24
                              : ResponsiveWidget.isMediumScreen(context)
                                  ? 22
                                  : 18),
                    ),
                  ),
                ),
                SizedBox(width: screenSize.width * 0.75 * 0.05),
                Column(
                  children: [
                    _pointerWidget(
                        context,
                        'Control and configuration',
                        "Smart Socket app - Bluetooth",
                        Icons.home,
                        pointersWidth,
                        Colors.black,
                        false,
                        false),
                    _pointerWidget(
                        context,
                        'Payment gateway',
                        "Secure payment options"
                            "including UPI, Debit/Credit cards.",
                        Icons.work_rounded,
                        pointersWidth,
                        Colors.black,
                        false,
                        false),
                  ],
                ),
              ],
            ),
            const Divider(color: Colors.black12, indent: 0.0),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: screenSize.width * 0.75 * 0.4,
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: 'Installation',
                      style: TextStyle(
                          fontFamily: 'MontserratBold',
                          color: Colors.black,
                          fontSize: ResponsiveWidget.isLargeScreen(context)
                              ? 24
                              : ResponsiveWidget.isMediumScreen(context)
                                  ? 22
                                  : 18),
                    ),
                  ),
                ),
                SizedBox(width: screenSize.width * 0.75 * 0.05),
                Column(
                  children: [
                    _pointerWidget(context, 'IP rating', "IP54", Icons.home,
                        pointersWidth, Colors.black, false, false),
                    _pointerWidget(
                        context,
                        'Storage temperature range',
                        "-30 to 70 °C",
                        Icons.home,
                        pointersWidth,
                        Colors.black,
                        false,
                        false),
                    _pointerWidget(
                        context,
                        'Operating temperature range',
                        "-20 to 55 °C",
                        Icons.home,
                        pointersWidth,
                        Colors.black,
                        false,
                        false),
                    _pointerWidget(
                        context,
                        'Dimensions',
                        "W x H x D (125 x 295 x 140 mm)",
                        Icons.home,
                        pointersWidth,
                        Colors.black,
                        false,
                        false),
                    _pointerWidget(context, 'Mounting', "Wall Mount",
                        Icons.home, pointersWidth, Colors.black, false, false),
                  ],
                ),
              ],
            ),
            const Divider(color: Colors.black12, indent: 0.0),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: screenSize.width * 0.75 * 0.4,
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: 'Certification And Standards',
                      style: TextStyle(
                          fontFamily: 'MontserratBold',
                          color: Colors.black,
                          fontSize: ResponsiveWidget.isLargeScreen(context)
                              ? 24
                              : ResponsiveWidget.isMediumScreen(context)
                                  ? 22
                                  : 18),
                    ),
                  ),
                ),
                SizedBox(width: screenSize.width * 0.75 * 0.05),
                Column(
                  children: [
                    _pointerWidget(
                        context,
                        'Codes and standards',
                        "IS 17017-22-1, IEC 60309",
                        Icons.home,
                        pointersWidth,
                        Colors.black,
                        false,
                        false),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _pointerWidget(
      BuildContext context,
      String title,
      String content,
      IconData icon,
      double pointersWidth,
      Color color,
      bool showIcon,
      bool boldText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            width: pointersWidth,
            child: Row(
              children: [
                showIcon
                    ? Icon(icon, color: color, size: 30)
                    : const SizedBox(),
                SizedBox(width: showIcon ? 10 : 0),
                SizedBox(
                  width: showIcon ? pointersWidth - 40 : pointersWidth,
                  child: RichText(
                    text: TextSpan(
                      text: title,
                      style: TextStyle(
                          fontFamily: boldText ? 'MontserratBold' : 'Questrial',
                          color: color,
                          fontWeight:
                              !boldText ? FontWeight.w600 : FontWeight.normal,
                          fontSize: ResponsiveWidget.isLargeScreen(context)
                              ? boldText
                                  ? 26
                                  : 20
                              : ResponsiveWidget.isMediumScreen(context)
                                  ? boldText
                                      ? 22
                                      : 18
                                  : boldText
                                      ? 18
                                      : 16),
                    ),
                  ),
                ),
              ],
            )),
        SizedBox(height: ResponsiveWidget.isSmallScreen(context) ? 0 : 10),
        SizedBox(
          width: pointersWidth * 0.8,
          child: Text(
            content,
            textAlign: TextAlign.start,
            style: TextStyle(
                fontFamily: 'MontserratRegular',
                color: color,
                fontSize: ResponsiveWidget.isSmallScreen(context)
                    ? 14
                    : 16),
          ),
        ),
        const SizedBox(height: 25),
      ],
    );
  }
}

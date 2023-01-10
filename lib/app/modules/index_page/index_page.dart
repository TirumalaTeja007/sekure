import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartsocket/app/modules/about_us/aboutus_widget.dart';
import 'package:smartsocket/app/modules/index_page/widgets/clientele_info.dart';
import 'package:smartsocket/app/modules/index_page/widgets/commercial_chargers_info.dart';
import 'package:smartsocket/utils/scroll_behaviour.dart';
import '../../../constants/color_constants.dart';
import '../../../utils/responsive.dart';
import '../../widgets/bottom_bar.dart';
import '../contact_us/contactus_widget.dart';

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
    return ListView(
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
                    Text(
                      "Smart EV charging stations"
                      "\nand software for"
                      "\nall businesses",
                      style: TextStyle(
                          fontFamily: 'MontserratMedium',
                          color: Colors.white,
                          fontSize: ResponsiveWidget.isSmallScreen(context)
                              ? 22
                              : 36),
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0))),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 15),
                        child: Text(
                          "Talk to an expert",
                          style: TextStyle(
                              fontFamily: 'Questrial',
                              color: Colors.black,
                              fontSize: ResponsiveWidget.isSmallScreen(context)
                                  ? 12
                                  : 14),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        const ClienteleInfo(),
        CommercialChargersInfo(),
        AboutUsWidget(),
        ContactUsWidget(),
        const BottomBar()
      ],
    );
  }
}

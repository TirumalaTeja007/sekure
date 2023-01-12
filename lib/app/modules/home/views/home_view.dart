import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartsocket/app/modules/home/views/widgets/top_bar_contents.dart';
import 'package:smartsocket/app/routes/app_pages.dart';
import 'package:smartsocket/constants/color_constants.dart';
import 'package:smartsocket/services/app_state_service.dart';
import '../../../../utils/responsive.dart';
import '../../../../utils/scroll_behaviour.dart';
import '../../../widgets/bottom_bar.dart';
import '../controller/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return GetRouterOutlet.builder(
      routerDelegate: Get.nestedKey(Routes.home),
      builder: (context) {
        final delegate = context.navigation;
        final currentLocation = context.location;
        var currentIndex = 0;
        AppStateService.to.setDelegate(delegate);
        controller.changeScrollPosition();
        if (currentLocation.startsWith(Routes.privacyPolicy) == true) {
          currentIndex = 6;
        }
        if (currentLocation.startsWith(Routes.refundPolicy) == true) {
          currentIndex = 7;
        }
        if (currentLocation.startsWith(Routes.termsAndConditions) == true) {
          currentIndex = 8;
        }
        if (currentLocation.startsWith(Routes.shippingPolicy) == true) {
          currentIndex = 9;
        }
        if (currentLocation.startsWith(Routes.services) == true) {
          currentIndex = 1;
        }
        if (currentLocation.startsWith(Routes.aboutUs) == true) {
          currentIndex = 2;
        }
        if (currentLocation.startsWith(Routes.contactUs) == true) {
          currentIndex = 3;
        }
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: PreferredSize(
              preferredSize: Size(screenSize.width, 350),
              child: TopBarContents(
                  index: currentIndex,
                  delegate: delegate,
                  homeController: controller)),
          body: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
                scrollbars: false,
                dragDevices: MyCustomScrollBehavior().dragDevices,
                overscroll: true,
                physics: const BouncingScrollPhysics()),
            child: ListView(
              controller: controller.scrollController,
              scrollDirection: Axis.vertical,
              physics: const ClampingScrollPhysics(),
              children: [
                SizedBox(
                  height: screenSize.height,
                  child: GetRouterOutlet(
                    initialRoute: Routes.index,
                    anchorRoute: Routes.home,
                    //delegate: Get.nestedKey(Routes.HOME),
                    // key: Get.nestedKey(Routes.HOME),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

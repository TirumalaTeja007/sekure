import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartsocket/app/modules/home/widgets/drawer.dart';
import 'package:smartsocket/app/widgets/topbar.dart';
import 'package:smartsocket/constants/color_constants.dart';
import 'package:smartsocket/services/auth_service.dart';

import '../../../../utils/responsive.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return GetRouterOutlet.builder(
      routerDelegate: Get.nestedKey(Routes.home),
      builder: (context) {
        final delegate = context.navigation;
        //This router outlet handles the appbar and the bottom navigation bar
        final currentLocation = context.location;
        var currentIndex = 0;
        if (currentLocation.startsWith(Routes.generateCPIDs) == true) {
          currentIndex = 1;
        }
        if (currentLocation.startsWith(Routes.chargersReports) == true) {
          currentIndex = 2;
        }
        if (currentLocation.startsWith(Routes.sessionsManagement) == true) {
          currentIndex = 5;
        }
        if (currentLocation.startsWith(Routes.tariffManagement) == true) {
          currentIndex = 6;
        }
        if (currentLocation.startsWith(Routes.addUsers) == true) {
          currentIndex = 7;
        }
        if (currentLocation.startsWith(Routes.endUsersManagement) == true) {
          currentIndex = 8;
        }
        if (currentLocation.startsWith(Routes.ticketsManagement) == true) {
          currentIndex = 11;
        }
        return Scaffold(
          drawer: !ResponsiveWidget.isLargeScreen(context)
              ? DrawerWidget(index: currentIndex, delegate: delegate)
              : null,
          body: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (ResponsiveWidget.isLargeScreen(context))
                DrawerWidget(index: currentIndex, delegate: delegate),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ResponsiveWidget.isLargeScreen(context)
                          ? TopBar(controller.tabList[currentIndex], "Admin")
                          : PreferredSize(
                              preferredSize: Size(screenSize.width, 55),
                              child: AppBar(
                                backgroundColor: Colors.white,
                                title: Text(controller.tabList[currentIndex],
                                    style: const TextStyle(
                                        fontFamily: 'MontserratBold',
                                        color: kPrimaryTextColor,
                                        fontSize: 20)),
                                actions: const [
                                  CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 20,
                                      backgroundImage: AssetImage(
                                          "assets/images/About Us.png")),
                                ],
                              )),
                      SizedBox(
                        height: screenSize.height - 80,
                        child: GetRouterOutlet(
                          initialRoute: Routes.dashboard,
                          anchorRoute: Routes.home,
                          //delegate: Get.nestedKey(Routes.HOME),
                          // key: Get.nestedKey(Routes.HOME),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

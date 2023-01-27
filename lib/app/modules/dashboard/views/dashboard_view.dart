import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartsocket/app/modules/dashboard/widgets/drawer.dart';
import 'package:smartsocket/app/modules/dashboard/widgets/topbar.dart';
import 'package:smartsocket/app/widgets/copyright_info.dart';
import 'package:smartsocket/constants/color_constants.dart';
import 'package:smartsocket/services/app_state_service.dart';
import 'package:smartsocket/services/auth_service.dart';

import '../../../../utils/responsive.dart';
import '../../../routes/app_pages.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return GetRouterOutlet.builder(
      routerDelegate: Get.nestedKey(Routes.dashboard),
      builder: (context) {
        final delegate = context.navigation;
        AppStateService.to.delegate = delegate;
        final currentLocation = context.location;
        var currentIndex = 0;
        if (currentLocation.startsWith(Routes.stationsOverview) == true) {
          currentIndex = 1;
        }
        if (currentLocation.startsWith(Routes.addStations) == true) {
          currentIndex = 2;
        }
        if (currentLocation.startsWith(Routes.chargersOverview) == true) {
          currentIndex = 3;
        }
        if (currentLocation.startsWith(Routes.addChargers) == true) {
          currentIndex = 4;
        }
        if (currentLocation.startsWith(Routes.sessionInfo) == true) {
          currentIndex = 5;
        }
        if (currentLocation.startsWith(Routes.payments) == true) {
          currentIndex = 6;
        }
        if (currentLocation.startsWith(Routes.usersOverview) == true) {
          currentIndex = 7;
        }
        if (currentLocation.startsWith(Routes.addUsers) == true) {
          currentIndex = 8;
        }
        if (currentLocation.startsWith(Routes.userDashboard) == true) {
          currentIndex = 9;
        }
        if (currentLocation.startsWith(Routes.supportTickets) == true) {
          currentIndex = 11;
        }
        return Scaffold(
          drawer: !ResponsiveWidget.isLargeScreen(context)
              ? DashboardViewDrawerWidget(
                  index: currentIndex, delegate: delegate)
              : null,
          body: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (ResponsiveWidget.isLargeScreen(context))
                DashboardViewDrawerWidget(
                    index: currentIndex, delegate: delegate),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ResponsiveWidget.isLargeScreen(context)
                        ? DashboardTopBar(
                            controller.tabList[currentIndex], "Admin")
                        : PreferredSize(
                            preferredSize: Size(screenSize.width, 55),
                            child: AppBar(
                              elevation: 1,
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
                                        "assets/images/aboutUs.png")),
                                SizedBox(width: 20),
                              ],
                            )),
                    SizedBox(
                      height: screenSize.height - 70,
                      child: GetRouterOutlet(
                        initialRoute: Routes.dashboardOverview,
                        anchorRoute: Routes.dashboard,
                        //delegate: Get.nestedKey(Routes.HOME),
                        // key: Get.nestedKey(Routes.HOME),
                      ),
                    ),
                    //const CopyrightInfoWidget(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

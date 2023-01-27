import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartsocket/app/modules/user_dashboard/widgets/user_dashboard_drawer.dart';
import 'package:smartsocket/app/modules/user_dashboard/widgets/user_profile_info.dart';
import 'package:smartsocket/app/modules/dashboard/widgets/topbar.dart';
import 'package:smartsocket/app/widgets/table_cell.dart';
import 'package:smartsocket/constants/constants.dart';
import 'package:smartsocket/utils/responsive.dart';
import 'package:smartsocket/utils/scroll_behaviour.dart';
import '../../../../constants/color_constants.dart';
import '../../../routes/app_pages.dart';
import '../controllers/user_dashboard_controller.dart';

class UserDashboardScreen extends GetView<UserDashboardController> {
  const UserDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return GetRouterOutlet.builder(
      routerDelegate: Get.nestedKey(Routes.userDashboard),
      builder: (context) {
        final delegate = context.navigation;
        final currentLocation = context.location;
        var currentIndex = 0;
        if (currentLocation.startsWith(Routes.userSessionHistory) == true) {
          currentIndex = 1;
        }
        if (currentLocation.startsWith(Routes.userTransactionHistory) == true) {
          currentIndex = 2;
        }
        if (currentLocation.startsWith(Routes.userTickets) == true) {
          currentIndex = 3;
        }
        if (currentLocation.startsWith(Routes.userAccountSettings) == true) {
          currentIndex = 4;
        }
        return Scaffold(
          drawer: !ResponsiveWidget.isLargeScreen(context)
              ? UserDashboardDrawer(
                  index: currentIndex,
                  delegate: delegate,
                  controller: controller)
              : null,
          body: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (ResponsiveWidget.isLargeScreen(context))
                UserDashboardDrawer(
                    index: currentIndex,
                    delegate: delegate,
                    controller: controller),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    PreferredSize(
                      preferredSize: Size(screenSize.width, 55),
                      child: AppBar(
                        automaticallyImplyLeading:
                            ResponsiveWidget.isLargeScreen(context)
                                ? false
                                : true,
                        backgroundColor: Colors.white,
                        elevation: 1,
                        title: Padding(
                          padding: EdgeInsets.only(
                              left: ResponsiveWidget.isLargeScreen(context)
                                  ? 50.0
                                  : 0.0),
                          child: Text(controller.tabList[currentIndex],
                              style: TextStyle(
                                  fontFamily: 'MontserratBold',
                                  color: kPrimaryTextColor,
                                  fontSize:
                                      ResponsiveWidget.isSmallScreen(context)
                                          ? 20
                                          : 24)),
                        ),
                        actions: [
                          Padding(
                            padding: EdgeInsets.only(
                                right: ResponsiveWidget.isLargeScreen(context)
                                    ? 50.0
                                    : 30.0, top: ResponsiveWidget.isLargeScreen(context)
                                ? 5 : 15, bottom: ResponsiveWidget.isLargeScreen(context)
                                ? 5 : 15),
                            child: Image.asset(
                              "assets/logo/ax_logo2.png",
                              height: ResponsiveWidget.isSmallScreen(context)
                                  ? 15
                                  : 30,
                              color: Colors.blue.shade900,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: screenSize.height - 70,
                              child: GetRouterOutlet(
                                initialRoute: Routes.userProfile,
                                anchorRoute: Routes.userDashboard,
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
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:sekure/app/routes/app_pages.dart';
import 'package:sekure/services/app_state_service.dart';

import '../../../../utils/scroll_behaviour.dart';
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
        if (currentLocation.startsWith(Routes.chat) == true) {
          currentIndex = 1;
        }
        if (currentLocation.startsWith(Routes.myBookings) == true) {
          currentIndex = 2;
        }
        if (currentLocation.startsWith(Routes.settings) == true) {
          currentIndex = 3;
        }
        return Scaffold(
          extendBodyBehindAppBar: true,
          bottomNavigationBar: SalomonBottomBar(
            currentIndex: currentIndex,
            onTap: (i) {
              switch(i) {
                case 0:
                  delegate.toNamed(Routes.services);
                  break;
                case 1:
                  delegate.toNamed(Routes.chat);
                  break;
                case 2:
                  delegate.toNamed(Routes.myBookings);
                  break;
                case 3:
                  delegate.toNamed(Routes.settings);
                  break;
              }
            },
            items: [
              /// Home
              SalomonBottomBarItem(
                icon: Icon(Icons.home),
                title: Text("Home"),
                selectedColor: Colors.purple,
              ),

              /// Likes
              SalomonBottomBarItem(
                icon: Icon(Icons.favorite_border),
                title: Text("Likes"),
                selectedColor: Colors.pink,
              ),

              /// Search
              SalomonBottomBarItem(
                icon: Icon(Icons.search),
                title: Text("Search"),
                selectedColor: Colors.orange,
              ),

              /// Profile
              SalomonBottomBarItem(
                icon: Icon(Icons.person),
                title: Text("Profile"),
                selectedColor: Colors.teal,
              ),
            ],
          ),
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
                    initialRoute: Routes.services,
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

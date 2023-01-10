import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartsocket/constants/color_constants.dart';
import '../../../../routes/app_pages.dart';
import '../../controller/home_controller.dart';

class TopBarContents extends StatelessWidget {
  final int index;
  final GetDelegate delegate;
  final HomeController homeController;

  const TopBarContents(
      {required this.index,
      required this.delegate,
      required this.homeController,
      super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return PreferredSize(
      preferredSize: Size(screenSize.width, 1000),
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset('assets/logo/ax_logo2.png',
                  width: 200, height: 45, color: Colors.blue.shade800),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(width: screenSize.width / 8),
                  InkWell(
                    onHover: (value) {
                      value
                          ? homeController.isHovering[0] = true
                          : homeController.isHovering[0] = false;
                    },
                    onTap: () => delegate.toNamed(Routes.index),
                    hoverColor: Colors.white,
                    child: Obx(
                      () => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'HOME',
                            style: TextStyle(
                                fontFamily: 'Questrial',
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color:
                                    index == 0 ? Colors.black : Colors.black45),
                          ),
                          const SizedBox(height: 5),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: homeController.isHovering[0],
                            child: Container(
                              height: 2,
                              width: 20,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: screenSize.width / 25),
                  InkWell(
                    onHover: (value) {
                      value
                          ? homeController.isHovering[1] = true
                          : homeController.isHovering[1] = false;
                    },
                    onTap: () => delegate.toNamed(Routes.services),
                    hoverColor: Colors.white,
                    child: Obx(
                      () => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'SERVICES',
                            style: TextStyle(
                                fontFamily: 'Questrial',
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color:
                                    index == 1 ? Colors.black : Colors.black45),
                          ),
                          const SizedBox(height: 5),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: homeController.isHovering[1],
                            child: Container(
                              height: 2,
                              width: 20,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: screenSize.width / 25),
                  InkWell(
                    hoverColor: Colors.white,
                    onHover: (value) {
                      value
                          ? homeController.isHovering[2] = true
                          : homeController.isHovering[2] = false;
                    },
                    onTap: () =>
                        delegate.toNamed(Routes.aboutUs),
                    child: Obx(
                      () => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'ABOUT US',
                            style: TextStyle(
                                fontFamily: 'Questrial',
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color:
                                    index == 2 ? Colors.black : Colors.black45),
                          ),
                          const SizedBox(height: 5),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: homeController.isHovering[2],
                            child: Container(
                              height: 2,
                              width: 20,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: screenSize.width / 25),
                  InkWell(
                    hoverColor: Colors.white,
                    onHover: (value) {
                      value
                          ? homeController.isHovering[3] = true
                          : homeController.isHovering[3] = false;
                    },
                    onTap: () => delegate.toNamed(Routes.contactUs),
                    child: Obx(
                      () => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'CONTACT US',
                            style: TextStyle(
                                fontFamily: 'Questrial',
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color:
                                    index == 3 ? Colors.black : Colors.black45),
                          ),
                          const SizedBox(height: 5),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: homeController.isHovering[3],
                            child: Container(
                              height: 2,
                              width: 20,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: screenSize.width / 25),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8.0)),
                    padding: const EdgeInsets.fromLTRB(10, 13, 10, 6),
                    child: InkWell(
                      hoverColor: Colors.white,
                      onHover: (value) {
                        value
                            ? homeController.isHovering[4] = true
                            : homeController.isHovering[4] = false;
                      },
                      onTap: () => Get.toNamed(Routes.dashboardSplash),
                      child: Obx(
                        () => Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'LOGIN/REGISTER',
                              style: TextStyle(
                                  fontFamily: 'Questrial',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.white),
                            ),
                            const SizedBox(height: 5),
                            Visibility(
                              maintainAnimation: true,
                              maintainState: true,
                              maintainSize: true,
                              visible: homeController.isHovering[4],
                              child: Container(
                                height: 2,
                                width: 20,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

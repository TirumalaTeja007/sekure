import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartsocket/app/routes/app_pages.dart';
import 'package:smartsocket/services/app_state_service.dart';
import '../../constants/color_constants.dart';
import 'bottom_bar_column.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    List<Widget> children = [
      BottomBarColumn(
          heading: 'Get Started',
          s1: 'Home',
          s2: 'About Us',
          s3: '',
          s4: '',
          isSmallScreen: screenSize.width < 800,
          s1OnTap: () {
            AppStateService.to.delegate.toNamed(Routes.index);
          },
          s2OnTap: () {
            AppStateService.to.delegate.toNamed(Routes.aboutUs);
          },
          s3OnTap: () {},
          s4OnTap: () {}),
      BottomBarColumn(
          heading: 'EV Charging Solutions',
          s1: 'Commercial',
          s2: '',
          s3: '',
          s4: '',
          isSmallScreen: screenSize.width < 800,
          s1OnTap: () {
            AppStateService.to.delegate.toNamed(Routes.services);
          },
          s2OnTap: () {},
          s3OnTap: () {},
          s4OnTap: () {}),
      BottomBarColumn(
          heading: 'Legal Pages',
          s1: 'Privacy Policy',
          s2: 'Refund Policy',
          s3: 'Terms and Conditions',
          s4: 'Shipping Policy',
          isSmallScreen: screenSize.width < 800,
          s1OnTap: () {
            AppStateService.to.delegate.toNamed(Routes.privacyPolicy);
          },
          s2OnTap: () {
            AppStateService.to.delegate.toNamed(Routes.refundPolicy);
          },
          s3OnTap: () {
            AppStateService.to.delegate.toNamed(Routes.termsAndConditions);
          },
          s4OnTap: () {
            AppStateService.to.delegate.toNamed(Routes.shippingPolicy);
          }),
      BottomBarColumn(
          heading: 'Support',
          s1: 'Contact Us',
          s2: '',
          s3: '',
          s4: '',
          isSmallScreen: screenSize.width < 800,
          s1OnTap: () {
            AppStateService.to.delegate.toNamed(Routes.contactUs);
          },
          s2OnTap: () {},
          s3OnTap: () {},
          s4OnTap: () {}),
    ];
    return Container(
      color: kBgColor,
      child: screenSize.width < 800
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      10, screenSize.height / 10, 10, screenSize.height / 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: children,
                  ),
                ),
                Container(
                  color: kBgShade,
                  width: Get.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: const Text(
                    '© 2023 Copyright by Axonify Tech Systems. All Rights Reserved.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'MontserratLight',
                      color: Colors.white60,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            )
          : Column(
              children: [
                const SizedBox(height: 60),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: children,
                ),
                const SizedBox(height: 50),
                Container(
                  color: kBgShade,
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                  child: const Text(
                    '© 2023 Copyright by Axonify Tech Systems. All Rights Reserved.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'MontserratLight',
                      color: Colors.white60,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

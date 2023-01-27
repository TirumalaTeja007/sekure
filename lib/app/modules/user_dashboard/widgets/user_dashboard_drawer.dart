import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:smartsocket/app/modules/user_dashboard/controllers/user_dashboard_controller.dart';
import 'package:smartsocket/constants/color_constants.dart';
import 'package:smartsocket/services/app_state_service.dart';

import '../../../routes/app_pages.dart';

class UserDashboardDrawer extends StatelessWidget {
  const UserDashboardDrawer({
    Key? key,
    required this.index,
    required this.delegate,
    required this.controller,
  }) : super(key: key);
  final int index;
  final GetDelegate delegate;
  final UserDashboardController controller;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 32, 16, 36),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/leaf.png",
                  height: 60,
                  color: kDrawerIconColor,
                ),
                const SizedBox(height: 10),
                Obx(
                  () => Text(controller.userData.value.userName,
                      style: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'MontserratBold',
                          color: Colors.white)),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  dense: false,
                  title: const Text("Overview",
                      style: TextStyle(fontFamily: "MontserratRegular")),
                  leading: Icon(Icons.house_rounded, color: kDrawerIconColor),
                  selected: index == 0 ? true : false,
                  selectedColor: Colors.white,
                  onTap: () {
                    delegate.toNamed(Routes.userProfile);
                  },
                ),
                ListTile(
                  dense: false,
                  title: const Text("Session History",
                      style: TextStyle(fontFamily: "MontserratRegular")),
                  leading: Icon(MdiIcons.evStation, color: kDrawerIconColor),
                  selected: index == 1 ? true : false,
                  selectedColor: Colors.white,
                  onTap: () {
                    delegate.toNamed(Routes.userSessionHistory);
                  },
                ),
                ListTile(
                  dense: false,
                  title: const Text("Payment History",
                      style: TextStyle(fontFamily: "MontserratRegular")),
                  leading: Icon(MdiIcons.wallet, color: kDrawerIconColor),
                  selected: index == 2 ? true : false,
                  selectedColor: Colors.white,
                  onTap: () {
                    delegate.toNamed(Routes.userTransactionHistory);
                  },
                ),
                ListTile(
                  dense: false,
                  title: const Text("Support Tickets",
                      style: TextStyle(fontFamily: "MontserratRegular")),
                  leading: Icon(MdiIcons.ticket, color: kDrawerIconColor),
                  selected: index == 3 ? true : false,
                  selectedColor: Colors.white,
                  onTap: () {
                    delegate.toNamed(Routes.userTickets);
                  },
                ),
                ListTile(
                  dense: false,
                  title: const Text("Settings",
                      style: TextStyle(fontFamily: "MontserratRegular")),
                  leading:
                      Icon(MdiIcons.accountSettings, color: kDrawerIconColor),
                  selected: index == 4 ? true : false,
                  selectedColor: Colors.white,
                  onTap: () {
                    delegate.toNamed(Routes.userAccountSettings);
                  },
                ),

              ],
            ),
          ),
          const Spacer(),
          ListTile(
            dense: false,
            title: const Icon(MdiIcons.arrowLeftBoldCircle, color: Colors.white),
            selected: index == 5 ? true : false,
            selectedColor: Colors.white,
            onTap: () {
              Get.toNamed(Routes.usersOverview);
            },
          ),
        ],
      ),
    );
  }
}

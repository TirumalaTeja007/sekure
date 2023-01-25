import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:smartsocket/constants/color_constants.dart';
import 'package:smartsocket/utils/local_storage.dart';

import '../../../../services/auth_service.dart';
import '../../../routes/app_pages.dart';

class DashboardViewDrawerWidget extends StatelessWidget {
  const DashboardViewDrawerWidget({
    Key? key,
    required this.index,
    required this.delegate,
  }) : super(key: key);
  final int index;
  final GetDelegate delegate;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 36),
            child: Image.asset(
              "assets/logo/axonify_logo.png",
              height: 60,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  dense: false,
                  title: const Text("Dashboard",
                      style: TextStyle(fontFamily: "MontserratRegular")),
                  leading: Icon(Icons.apps, color: kDrawerIconColor),
                  selected: index == 0 ? true : false,
                  selectedColor: Colors.white,
                  onTap: () {
                    delegate.toNamed(Routes.dashboardOverview);
                    //   Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  dense: false,
                  title: const Text("Stations",
                      style: TextStyle(fontFamily: "MontserratRegular")),
                  leading: Icon(MdiIcons.evStation, color: kDrawerIconColor),
                  selected: [1, 2].contains(index) ? true : false,
                  selectedColor: Colors.white,
                  onTap: () {
                    delegate.toNamed(Routes.stationsOverview);
                    //   Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  dense: false,
                  title: const Text("Chargers",
                      style: TextStyle(fontFamily: "MontserratRegular")),
                  leading: Icon(MdiIcons.evPlugType1, color: kDrawerIconColor),
                  selected: [3, 4].contains(index) ? true : false,
                  selectedColor: Colors.white,
                  onTap: () {
                    delegate.toNamed(Routes.chargersOverview);
                    //   Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  dense: false,
                  title: const Text("Session Info",
                      style: TextStyle(fontFamily: "MontserratRegular")),
                  leading: Icon(MdiIcons.battery20Bluetooth,
                      color: kDrawerIconColor),
                  selected: index == 5 ? true : false,
                  selectedColor: Colors.white,
                  onTap: () {
                    delegate.toNamed(Routes.sessionsManagement);
                  },
                ),
                ListTile(
                  dense: false,
                  title: const Text("Payments",
                      style: TextStyle(fontFamily: "MontserratRegular")),
                  leading: Icon(MdiIcons.wallet, color: kDrawerIconColor),
                  selected: index == 6 ? true : false,
                  selectedColor: Colors.white,
                  onTap: () {
                    delegate.toNamed(Routes.payments);
                  },
                ),
                ListTile(
                    dense: false,
                    title: const Padding(
                      padding: EdgeInsets.only(top: 14.0),
                      child: Text("Users Overview",
                          style: TextStyle(fontFamily: "MontserratRegular")),
                    ),
                    leading:
                        Icon(MdiIcons.accountGroup, color: kDrawerIconColor),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            delegate.toNamed(Routes.addUsers);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: index == 7
                                  ? kDrawerUnselectedTextColor
                                  : kPrimaryTextColor),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Add Users",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontFamily: "MontserratRegular",
                                    color: index == 7
                                        ? Colors.white
                                        : Colors.white54)),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            delegate.toNamed(Routes.usersReports);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: index == 8
                                  ? kDrawerUnselectedTextColor
                                  : kPrimaryTextColor),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Reports",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontFamily: "MontserratRegular",
                                    color: index == 8
                                        ? Colors.white
                                        : Colors.white54)),
                          ),
                        ),
                      ],
                    ),
                    selected: [7, 8].contains(index) ? true : false,
                    selectedColor: Colors.white),
                ListTile(
                  dense: false,
                  title: const Text("Customer Support",
                      style: TextStyle(fontFamily: "MontserratRegular")),
                  leading: Icon(MdiIcons.ticket, color: kDrawerIconColor),
                  selected: index == 9 ? true : false,
                  selectedColor: Colors.white,
                  onTap: () {
                    delegate.toNamed(Routes.ticketsManagement);
                  },
                ),
                // ListTile(
                //   dense: false,
                //   title: const Text("Settings",
                //       style: TextStyle(fontFamily: "MontserratRegular")),
                //   leading: Icon(Icons.settings,
                //       color: kDrawerIconColor),
                //   selected:
                //       tabIndex == 11 ? true : false,
                //   selectedColor: Colors.white,
                //   onTap: () => dashboardController.changeTabIndex(11),
                // ),
                ListTile(
                  dense: false,
                  title: Text(AuthService.to.isLoggedIn ? "Logout" : "Login",
                      style: const TextStyle(fontFamily: "MontserratRegular")),
                  leading: Icon(Icons.logout, color: kDrawerIconColor),
                  selected: index == 10 ? true : false,
                  selectedColor: Colors.white,
                  onTap: () {
                    if (AuthService.to.isLoggedIn) {
                      AuthService.to.logout();
                      IdRepository().invalidateUserData();
                      Get.toNamed(Routes.login);
                      //Navigator.of(context).pop();
                    } else {
                      Get.toNamed(Routes.login);
                      //Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

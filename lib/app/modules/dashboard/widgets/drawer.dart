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
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 48),
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
                  title: const Padding(
                    padding: EdgeInsets.only(top: 14.0),
                    child: Text("Chargers Overview",
                        style: TextStyle(fontFamily: "MontserratRegular")),
                  ),
                  leading: Icon(MdiIcons.evPlugType1, color: kDrawerIconColor),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          delegate.toNamed(Routes.generateCPIDs);
                          //  Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: index == 1
                                ? kDrawerUnselectedTextColor
                                : kPrimaryTextColor),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Generate CPID's",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontFamily: "MontserratRegular",
                                  color: index == 1
                                      ? Colors.white
                                      : Colors.white54)),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          delegate.toNamed(Routes.chargersReports);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: index == 2
                                ? kDrawerUnselectedTextColor
                                : kPrimaryTextColor),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Reports",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontFamily: "MontserratRegular",
                                  color: index == 2
                                      ? Colors.white
                                      : Colors.white54)),
                        ),
                      ),
                    ],
                  ),
                  selectedColor: Colors.white,
                  selected: [1, 2].contains(index),
                ),
                ListTile(
                    dense: false,
                    title: const Padding(
                      padding: EdgeInsets.only(top: 14.0),
                      child: Text("Stations Overview",
                          style: TextStyle(fontFamily: "MontserratRegular")),
                    ),
                    leading: Icon(MdiIcons.evStation, color: kDrawerIconColor),
                    selected: [3, 4].contains(index) ? true : false,
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () => delegate.toNamed(Routes.addSites),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: index == 3
                                  ? kDrawerUnselectedTextColor
                                  : kPrimaryTextColor),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Add New Sites",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontFamily: "MontserratRegular",
                                    color: index == 3
                                        ? Colors.white
                                        : Colors.white54)),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () =>
                              delegate.toNamed(Routes.stationsReports),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: index == 4
                                  ? kDrawerUnselectedTextColor
                                  : kPrimaryTextColor),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Reports",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontFamily: "MontserratRegular",
                                    color: index == 4
                                        ? Colors.white
                                        : Colors.white54)),
                          ),
                        ),
                      ],
                    ),
                    selectedColor: Colors.white),
                ListTile(
                  dense: false,
                  title: const Text("Session Management",
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
                  title: const Text("Tariff Management",
                      style: TextStyle(fontFamily: "MontserratRegular")),
                  leading: Icon(MdiIcons.wallet, color: kDrawerIconColor),
                  selected: index == 6 ? true : false,
                  selectedColor: Colors.white,
                  onTap: () {
                    delegate.toNamed(Routes.tariffManagement);
                  },
                ),
                ListTile(
                    dense: false,
                    title: const Padding(
                      padding: EdgeInsets.only(top: 14.0),
                      child: Text("User Management",
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
                            child: Text("Add New Users",
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
                            delegate.toNamed(Routes.endUsersManagement);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: index == 8
                                  ? kDrawerUnselectedTextColor
                                  : kPrimaryTextColor),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("End Users",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontFamily: "MontserratRegular",
                                    color: index == 8
                                        ? Colors.white
                                        : Colors.white54)),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: index == 9
                                  ? kDrawerUnselectedTextColor
                                  : kPrimaryTextColor),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Station Admins",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontFamily: "MontserratRegular",
                                    color: index == 9
                                        ? Colors.white
                                        : Colors.white54)),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: index == 10
                                  ? kDrawerUnselectedTextColor
                                  : kPrimaryTextColor),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Super Admins",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontFamily: "MontserratRegular",
                                    color: index == 10
                                        ? Colors.white
                                        : Colors.white54)),
                          ),
                        ),
                      ],
                    ),
                    selected: [7, 8, 9, 10].contains(index) ? true : false,
                    selectedColor: Colors.white),
                ListTile(
                  dense: false,
                  title: const Text("Tickets Management",
                      style: TextStyle(fontFamily: "MontserratRegular")),
                  leading: Icon(MdiIcons.ticket, color: kDrawerIconColor),
                  selected: index == 11 ? true : false,
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
                  selected: index == 12 ? true : false,
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

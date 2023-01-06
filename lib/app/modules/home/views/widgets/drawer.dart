import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:smartsocket/constants/color_constants.dart';
import 'package:smartsocket/utils/local_storage.dart';

import '../../../../routes/app_pages.dart';

class HomeViewDrawerWidget extends StatelessWidget {
  const HomeViewDrawerWidget({
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
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  dense: false,
                  title: const Text("Home",
                      style: TextStyle(fontFamily: "MontserratRegular")),
                  selected: index == 0 ? true : false,
                  selectedColor: Colors.white,
                  onTap: () {
                    Get.toNamed(Routes.index);
                    //   Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  dense: false,
                  title: const Text("Services",
                      style: TextStyle(fontFamily: "MontserratRegular")),
                  selected: index == 1 ? true : false,
                  selectedColor: Colors.white,
                  onTap: () {
                    delegate.toNamed(Routes.services);
                  },
                ),
                ListTile(
                  dense: false,
                  title: const Text("About Us",
                      style: TextStyle(fontFamily: "MontserratRegular")),
                  selected: index == 2 ? true : false,
                  selectedColor: Colors.white,
                  onTap: () {
                    delegate.toNamed(Routes.aboutUs);
                  },
                ),
                ListTile(
                  dense: false,
                  title: const Text("Contact Us",
                      style: TextStyle(fontFamily: "MontserratRegular")),
                  selected: index == 3 ? true : false,
                  selectedColor: Colors.white,
                  onTap: () {
                    //  delegate.toNamed(Routes.ticketsManagement);
                  },
                ),
                ListTile(
                  dense: false,
                  title: const Text("LOGIN/REGISTER",
                      style: TextStyle(fontFamily: "MontserratRegular")),
                  selected: index == 4 ? true : false,
                  selectedColor: Colors.white,
                  onTap: () {
                    Get.toNamed(Routes.dashboardSplash);
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

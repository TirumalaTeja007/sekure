import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:smartsocket/models/user_model.dart';
import 'package:smartsocket/utils/responsive.dart';

import '../../../../constants/color_constants.dart';

kUserDrawerWidth(Size screenSize) {
  return screenSize.width < 1350 ? 250 : 304;
}

class UserProfileInfo extends StatelessWidget {
  const UserProfileInfo({
    Key? key,
    required this.userData,
  }) : super(key: key);
  final UserData userData;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    List<Widget> widgetList = [
      Container(
        width: ResponsiveWidget.isSmallScreen(context) ? 150 : 175,
        height: ResponsiveWidget.isSmallScreen(context) ? 150 : 175,
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [BoxShadow(color: kBoxShadowColor, blurRadius: 4)],
            border: Border.all(color: Colors.white, width: 3),
            borderRadius: BorderRadius.circular(4),
            image: const DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/aboutUs.png"))),
      ),
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              dense: true,
              leading: const Icon(MdiIcons.account, color: Colors.green),
              title: Text("${userData.firstName} ${userData.lastName}",
                  style: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'MontserratRegular',
                      color: kPrimaryTextColor)),
            ),
            ListTile(
              dense: true,
              leading: const Icon(MdiIcons.email, color: Colors.green),
              title: Text(userData.email.toString(),
                  style: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'MontserratRegular',
                      color: kPrimaryTextColor)),
            ),
            ListTile(
              dense: true,
              leading: const Icon(MdiIcons.phone, color: Colors.green),
              title: Text(userData.phoneNumber.toString(),
                  style: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'MontserratRegular',
                      color: kPrimaryTextColor)),
            ),
            const SizedBox(height: 15),
          ],
        ),
      )
    ];
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 30),
      child: SizedBox(
        width: ResponsiveWidget.isLargeScreen(context)
            ? screenSize.width - 304
            : screenSize.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: widgetList,
        ),
      ),
    );
  }
}

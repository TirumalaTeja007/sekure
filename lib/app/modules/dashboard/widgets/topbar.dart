import 'package:flutter/material.dart';
import 'package:smartsocket/utils/responsive.dart';

import '../../../../constants/color_constants.dart';

class DashboardTopBar extends StatelessWidget {
  const DashboardTopBar(this.title, this.userType, {Key? key}) : super(key: key);
  final String title;
  final String userType;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: kBoxShadowColor, blurRadius: 4)]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title,
              style: const TextStyle(
                  fontFamily: 'MontserratBold',
                  color: kPrimaryTextColor,
                  fontSize: 24)),
          userType == "User"
              ? Row(
                  children: [
                    Image.asset(
                      "assets/logo/axonify_logo.png",
                      height: ResponsiveWidget.isSmallScreen(context) ? 25 : 60,
                      color: kPrimaryTextColor,
                    )
                  ],
                )
              : Row(
                  children: const [
                    Text("Teja",
                        style: TextStyle(
                            fontFamily: 'MontserratRegular',
                            color: kPrimaryTextColor,
                            fontSize: 18)),
                    SizedBox(width: 5),
                    CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 20,
                        backgroundImage:
                            AssetImage("assets/images/aboutUs.png")),
                  ],
                ),
        ],
      ),
    );
  }
}

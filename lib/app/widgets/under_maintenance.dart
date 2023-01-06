import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smartsocket/app/routes/app_pages.dart';
import 'package:smartsocket/constants/color_constants.dart';
import 'package:smartsocket/services/app_state_service.dart';

class UnderMaintenance extends StatelessWidget {
  const UnderMaintenance(this.pageName, {Key? key}) : super(key: key);
  final String pageName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 150, top: 150),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset("assets/images/under_maintenance.png", height: 150),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 25.0),
            child: Text("Under Construction",
                style: TextStyle(
                    fontSize: 26,
                    color: kPrimaryTextColor,
                    fontFamily: 'MontserratBold')),
          ),
          SizedBox(
            width: 450,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text:
                        "Sorry for the inconvenience. Our $pageName page is under "
                        "construction at the moment. You can always ",
                    style: const TextStyle(
                        fontFamily: "MontserratRegular",
                        fontSize: 16,
                        color: kPrimaryTextColorShade),
                    children: [
                      TextSpan(
                        text: "contact us",
                        style: const TextStyle(
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                            fontFamily: "MontserratRegular",
                            color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            AppStateService.to.delegate
                                .toNamed(Routes.contactUs);
                          },
                      ),
                      const TextSpan(
                        text:
                            " about the services we offer, otherwise we'll be back up shortly!",
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: "MontserratRegular",
                            color: kPrimaryTextColorShade),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text("-- The AXONIFY Team",
                    style: TextStyle(
                        fontSize: 16,
                        color: kPrimaryTextColorShade,
                        fontFamily: 'MontserratRegular')),
              ],
            ),
          )
        ],
      ),
    );
  }
}

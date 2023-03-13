import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/color_constants.dart';

callAlertDialog(String title, String message, String middleText) {
  Get.defaultDialog(
    barrierDismissible: false,
    title: title,
    titleStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
    content: Padding(
      padding: const EdgeInsets.only(top: 5.0, left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(message,
              style: const TextStyle(fontSize: 14, color: Colors.black)),
          middleText != ""
              ? Column(
                  children: [
                    Get.currentRoute == "/ChargeScreen"
                        ? Column(children: const [
                            SizedBox(height: 10),
                            Text(
                                "You can always raise an issue, if you have any"
                                " queries related to this session.",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black45)),
                          ])
                        : const SizedBox(),
                    const SizedBox(height: 10),
                    Text(middleText,
                        style: const TextStyle(
                            fontSize: 14, color: Colors.black45)),
                  ],
                )
              : const SizedBox()
        ],
      ),
    ),
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                animationDuration: const Duration(seconds: 1)),
            onPressed: () => Navigator.of(Get.key.currentContext!).pop(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Close",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          )
        ],
      )
    ],
  );
}

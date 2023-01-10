import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBarColumn extends StatelessWidget {
  final String heading;
  final String s1;
  final String s2;
  final String s3;
  final String s4;
  final bool isSmallScreen;
  final Null Function() s1OnTap;
  final Null Function() s2OnTap;
  final Null Function() s3OnTap;
  final Null Function() s4OnTap;

  const BottomBarColumn(
      {super.key,
      required this.heading,
      required this.s1,
      required this.s2,
      required this.s3,
      required this.s4,
      required this.isSmallScreen,
      required this.s1OnTap,
      required this.s2OnTap,
      required this.s3OnTap,
      required this.s4OnTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: isSmallScreen
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: TextStyle(
                fontFamily: 'MontserratMedium',
                color: Colors.white,
                fontSize: isSmallScreen ? 16 : 18),
          ),
          const SizedBox(height: 15),
          BouncingWidget(
            onPressed: () => s1OnTap(),
            child: Row(
              mainAxisAlignment: isSmallScreen
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              children: [
                isSmallScreen
                    ? const SizedBox.shrink()
                    : Icon(Icons.arrow_forward_ios_rounded,
                        size: 14, color: Colors.blue.shade800),
                Text(
                  s1,
                  style: const TextStyle(
                      fontFamily: 'MontserratLight',
                      color: Colors.white60,
                      fontSize: 14),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          s2.isNotEmpty
              ? BouncingWidget(
                  onPressed: () => s2OnTap(),
                  child: Row(
                    mainAxisAlignment: isSmallScreen
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.start,
                    children: [
                      isSmallScreen
                          ? const SizedBox.shrink()
                          : Icon(Icons.arrow_forward_ios_outlined,
                              size: 14, color: Colors.blue.shade800),
                      Text(
                        s2,
                        style: const TextStyle(
                            fontFamily: 'MontserratLight',
                            color: Colors.white60,
                            fontSize: 14),
                      ),
                    ],
                  ),
                )
              : SizedBox(height: isSmallScreen ? 0 : 16),
          const SizedBox(height: 10),
          s3.isNotEmpty
              ? BouncingWidget(
                  onPressed: () => s3OnTap(),
                  child: Row(
                    mainAxisAlignment: isSmallScreen
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.start,
                    children: [
                      isSmallScreen
                          ? const SizedBox.shrink()
                          : Icon(Icons.arrow_forward_ios_outlined,
                              size: 14, color: Colors.blue.shade800),
                      Text(
                        s3,
                        style: const TextStyle(
                            fontFamily: 'MontserratLight',
                            color: Colors.white60,
                            fontSize: 14),
                      ),
                    ],
                  ),
                )
              : SizedBox(height: isSmallScreen ? 0 : 16),
          const SizedBox(height: 10),
          s4.isNotEmpty
              ? BouncingWidget(
                  onPressed: () => s4OnTap(),
                  child: Row(
                    mainAxisAlignment: isSmallScreen
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.start,
                    children: [
                      isSmallScreen
                          ? const SizedBox.shrink()
                          : Icon(Icons.arrow_forward_ios_outlined,
                              size: 14, color: Colors.blue.shade800),
                      Text(
                        s4,
                        style: const TextStyle(
                            fontFamily: 'MontserratLight',
                            color: Colors.white60,
                            fontSize: 14),
                      ),
                    ],
                  ),
                )
              : SizedBox(height: isSmallScreen ? 0 : 14),
        ],
      ),
    );
  }

  onTap() {}
}

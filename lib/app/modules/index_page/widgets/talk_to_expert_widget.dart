import 'package:flutter/material.dart';
import 'package:smartsocket/utils/responsive.dart';

class TalkToAnExpertWidget extends StatelessWidget {
  const TalkToAnExpertWidget(this.bgColor, this.textColor, {Key? key}) : super(key: key);
  final Color bgColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
        child: Text(
          "Talk to an expert",
          style: TextStyle(
              fontFamily: 'Questrial',
              color: textColor,
              fontSize: ResponsiveWidget.isSmallScreen(context)
                  ? 14
                  : ResponsiveWidget.isMediumScreen(context)
                      ? 16
                      : 18),
        ),
      ),
    );
  }
}

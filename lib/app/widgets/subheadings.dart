import 'package:flutter/material.dart';
import 'package:smartsocket/utils/responsive.dart';

class SubHeading extends StatelessWidget {
  const SubHeading(this.title, this.color, {Key? key}) : super(key: key);
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontFamily: 'MontserratBold',
          color: color,
          fontSize: ResponsiveWidget.isSmallScreen(context) ? 20 : 22),
    );
  }
}

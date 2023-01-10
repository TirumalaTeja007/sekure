import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartsocket/app/modules/about_us/aboutus_widget.dart';
import 'package:smartsocket/app/widgets/bottom_bar.dart';
import '../../../constants/color_constants.dart';
import '../../../utils/responsive.dart';

class AboutUsView extends StatelessWidget {
  AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height / 10),
        AboutUsWidget(),
        SizedBox(height: MediaQuery.of(context).size.height / 16),
        const BottomBar()
      ],
    );
  }
}

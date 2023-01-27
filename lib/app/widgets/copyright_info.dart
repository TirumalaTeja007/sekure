import 'package:flutter/material.dart';
import 'package:smartsocket/constants/color_constants.dart';

import '../../utils/responsive.dart';

class CopyrightInfoWidget extends StatelessWidget {
  const CopyrightInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBgShade,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: const Text(
        '© 2023 Copyright by Axonify Tech Systems. All Rights Reserved.',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'MontserratLight',
          color: Colors.white60,
          fontSize: 14,
        ),
      ),
    );
  }
}

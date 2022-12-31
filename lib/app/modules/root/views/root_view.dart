import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartsocket/services/auth_service.dart';

import '../../../routes/app_pages.dart';
import '../controllers/root_controller.dart';

class RootView extends GetView<RootController> {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return RouterOutlet.builder(
      delegate: Get.nestedKey(null),
      builder: (context) {
        final title = context.location;
        return Scaffold(
          body: GetRouterOutlet(
            initialRoute:
                AuthService.to.isLoggedInValue ? Routes.home : Routes.login,
            delegate: Get.nestedKey(null),
            anchorRoute: '/',
            filterPages: (afterAnchor) {
              // print(afterAnchor);
              // print('dddddddddddddddddd');
              // print(afterAnchor.take(1));
              return afterAnchor.take(1);
            },
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartsocket/app/modules/user_account_settings/controllers/user_account_settings_controller.dart';
import 'package:smartsocket/app/modules/user_profile/controller/user_profile_controller.dart';

class UserAccountSettingsScreen extends GetView<UserAccountSettingsController> {
  const UserAccountSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return const SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.only(top: 50, left: 30.0),
          child: Text("Settings")),
    );
  }
}

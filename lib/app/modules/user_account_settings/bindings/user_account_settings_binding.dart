import 'package:get/get.dart';
import 'package:smartsocket/app/modules/user_account_settings/controllers/user_account_settings_controller.dart';

class UserAccountSettingsBinding extends Bindings {
  @override
  dependencies() {
    return Get.lazyPut<UserAccountSettingsController>(
          () => UserAccountSettingsController(),
    );
  }
}

import 'package:get/get.dart';
import 'package:smartsocket/app/modules/contact_us/controller/contactus_controller.dart';

class ContactUsBinding extends Bindings {
  @override
  dependencies() {
    return Get.lazyPut<ContactUsController>(
      () => ContactUsController(),
    );
  }
}

import 'package:get/get.dart';
import 'package:smartsocket/app/modules/chargers/controllers/chargers_controller.dart';
import 'package:smartsocket/app/modules/contact_us/controllers/contact_us_controller.dart';

class ContactUsBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<ContactUsController>(
        () => ContactUsController(),
      )
    ];
  }
}

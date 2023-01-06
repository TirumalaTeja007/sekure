import 'package:get/get.dart';
import 'package:smartsocket/app/modules/aboutus/controller/aboutus_controller.dart';

import '../controller/policy_page_controller.dart';

class PolicyPageBinding extends Binding {

  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut(() => PolicyPageController()),
    ];
  }
}

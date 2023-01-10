import 'package:get/get.dart';
import '../controller/policy_page_controller.dart';

class PolicyPageBinding extends Binding {

  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut(() => PolicyPageController()),
    ];
  }
}

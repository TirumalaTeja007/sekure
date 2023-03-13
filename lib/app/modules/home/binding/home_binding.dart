

import 'package:get/get.dart';

import '../controller/home_controller.dart';

class HomeBinding extends Binding {
  @override
  dependencies() {
    return [Bind.put<HomeController>(HomeController())];
  }
}

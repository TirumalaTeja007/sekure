import 'package:get/get.dart';
import 'package:smartsocket/app/modules/chargers/controllers/chargers_controller.dart';

class ChargersBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<ChargersController>(
        () => ChargersController(),
      )
    ];
  }
}

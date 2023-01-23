import 'package:get/get.dart';
import 'package:smartsocket/app/modules/stations/controllers/stations_controller.dart';

class StationsBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<StationsController>(
        () => StationsController(),
      )
    ];
  }
}

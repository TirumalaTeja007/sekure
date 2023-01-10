import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';

class ContactUsController extends GetxController {
  late final MapController mapController;

  @override
  onInit() {
    super.onInit();

    mapController = MapController();
  }
}

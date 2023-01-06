import 'package:get/get.dart';
import 'package:smartsocket/constants/network_constants.dart';

class AppStateService extends GetxService {
  static AppStateService get to => Get.find();

  late GetDelegate delegate;

  RxInt homeIndex = 0.obs;

  setDelegate(delegate) {
    this.delegate = delegate;
  }
}

import 'package:get/get.dart';
import 'package:smartsocket/constants/network_constants.dart';
import 'package:smartsocket/services/auth_service.dart';

class AppStateService extends GetxService {
  static AppStateService get to => Get.find();

  late GetDelegate delegate;

  RxInt homeIndex = 0.obs;

  final RxList _roleNames = [].obs;

  final RxList _roles = [].obs;

  List get roleNames => _roleNames.value;

  List get roles => _roles.value;

  getUserRoles() async {
    dynamic errorMessage = "";

    errorMessage = await AuthService.to
        .authenticate({"userName": "SS-0001", "password": "123456"});

    if (AuthService.to.authToken.isNotEmpty && errorMessage.isEmpty) {
      await GetConnect()
          .get("$rootUrl/roleapi/getallroles", headers: authHeader())
          .then((response) async {
        print(response.body);
        return response;
      });
    }
    return errorMessage;
  }

  setDelegate(delegate) {
    this.delegate = delegate;
  }
}

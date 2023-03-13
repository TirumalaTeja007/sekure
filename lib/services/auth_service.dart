import 'package:get/get.dart';
import 'package:sekure/constants/network_constants.dart';
import 'package:sekure/services/app_state_service.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find();

  final _isLoggedIn = false.obs;

  bool get isLoggedIn => _isLoggedIn.value;

  final _authToken = "".obs;

  String get authToken => _authToken.value;

  void login() {
    _isLoggedIn.value = true;
  }

  void logout() {
    _isLoggedIn.value = false;
  }

  authenticate(args) async {
    dynamic errorMessage = "";
    if (authToken.isEmpty) {
      await GetConnect()
          .post(authenticateUrl, {"username": args["userName"], "password": args["password"]},
          headers: basicHeader)
          .then((response) {
            print(response.body);
        if (!response.hasError) {
          _authToken.value = response.body["jwtToken"];
          authToken;
        } else {
          errorMessage = response;
        }
      });
    }
    return errorMessage;
  }
}

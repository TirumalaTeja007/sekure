import 'package:get/get.dart';
import 'package:smartsocket/constants/network_constants.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find();

  final isLoggedIn = false.obs;

  bool get isLoggedInValue => isLoggedIn.value;

  final _authToken = "".obs;

  String get authToken => _authToken.value;

  void login() {
    isLoggedIn.value = true;
  }

  void logout() {
    isLoggedIn.value = false;
  }

  authenticate(args) async {
    dynamic errorMessage = "";
    if (authToken.isEmpty) {
      await GetConnect()
          .post(authenticateUrl, {"username": args["userName"], "password": args["password"]},
          headers: basicHeader)
          .then((response) {
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

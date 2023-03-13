import 'package:get_storage/get_storage.dart';
import 'package:sekure/constants/constants.dart';

class LocalStorage {
  GetStorage userStorage = GetStorage(kUserRepoToken);

  addUserData(Map data) async => await userStorage.write(kUserDataId, data);

  getUserData() async => await userStorage.read(kUserDataId);

  userDataPresent() async => userStorage.hasData(kUserDataId);

  isUserRegistered() async {
    Map userData = await userDataPresent() ? userStorage.read(kUserDataId) : {};
    return userData.isNotEmpty ? userData.containsKey('auth_token') : false;
  }

  deleteUserData() async => await userStorage.erase();
}

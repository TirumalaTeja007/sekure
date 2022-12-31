import 'dart:html';

class IdRepository {
  final Storage _localStorage = window.localStorage;

  Future saveUserData(String id) async {
    _localStorage['userData'] = id;
  }

  Future saveArguments(String id, String data) async {
    _localStorage[id] = data;
  }

  Future<String?> getUserData() async => _localStorage['userData'];

  Future<String?> getStackedArgs(String id) async => _localStorage[id];

  bool isUserDataPresent() => _localStorage.containsKey('userData');

  bool isStackedArgsPresent(String id) => _localStorage.containsKey(id);

  Future invalidateUserData() async {
    _localStorage.remove('userData');
  }

  Future invalidateStackedArgs(String id) async {
    _localStorage.remove(id);
  }

  Future invalidateAllData() async {
    _localStorage.remove("userInfoArgs");
    _localStorage.remove("sessionInfoArgs");
    _localStorage.remove("paymentInfoArgs");
    _localStorage.remove("ticketInfoArgs");
    _localStorage.remove("deviceInfoArgs");
  }
}

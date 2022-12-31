class UserData {
  late int id;
  late String name;
  late String userName;
  late String password;
  late String email;
  late String countryCallingCode;
  late String countryCode;
  late String mobileNumber;
  late String profilePicture;
  late bool isLoggedIn;

  UserData(
      {required this.id,
      required this.name,
      required this.userName,
      required this.password,
      required this.email,
      required this.profilePicture,
      required this.countryCallingCode,
      required this.countryCode,
      required this.mobileNumber,
      required this.isLoggedIn});

  factory UserData.fromMap(json) => UserData(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      userName: json["userName"],
      profilePicture: json["profilePicture"] ?? "",
      password: json["password"],
      countryCode: json["countryCode"] ?? "IN",
      countryCallingCode: json["dialCode"],
      mobileNumber: json["mobileNumber"],
      isLoggedIn: true);

  Map<String, dynamic> toJson(Map<String, dynamic> data) {
    data['id'] = id;
    data['email'] = email;
    data["userName"] = userName;
    data["password"] = password;
    data["profilePicture"] = profilePicture;
    data["name"] = name;
    data['dialCode'] = countryCallingCode;
    data['countryCode'] = countryCode;
    data['mobileNumber'] = mobileNumber;
    data['isLoggedIn'] = isLoggedIn;
    return data;
  }
}

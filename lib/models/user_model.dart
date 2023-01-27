class UserData {
  late int userId;
  late String firstName;
  late String lastName;
  late String userName;
  late String email;
  late String countryCallingCode;
  late String countryCode;
  late String phoneNumber;
  late String profilePicture;
  late String role;
  late bool isLoggedIn;

  UserData(
      {required this.userId,
      required this.firstName,
      required this.lastName,
      required this.userName,
      required this.email,
      required this.profilePicture,
      required this.countryCallingCode,
      required this.countryCode,
      required this.role,
      required this.phoneNumber,
      required this.isLoggedIn});

  factory UserData.fromMap(json) {
    return UserData(
        userId: json["userId"].runtimeType == int
            ? json["userId"]
            : int.parse(json["userId"]),
        lastName: json["lastName"],
        firstName: json["firstName"],
        email: json["email"],
        userName: json["userName"],
        profilePicture: json["profilePicture"] ?? "",
        countryCode: json["countryCode"] ?? "IN",
        countryCallingCode: json["dialCode"] ?? "+91 ",
        phoneNumber: json["phoneNumber"],
        role: json["role"],
        isLoggedIn: true);
  }

  Map<String, dynamic> toJson(Map<String, dynamic> data) {
    data['userId'] = userId;
    data['email'] = email;
    data["userName"] = userName;
    data["profilePicture"] = profilePicture;
    data["firstName"] = firstName;
    data["lastName"] = lastName;
    data['dialCode'] = countryCallingCode;
    data['countryCode'] = countryCode;
    data['phoneNumber'] = phoneNumber;
    data['isLoggedIn'] = isLoggedIn;
    data['role'] = role;
    return data;
  }
}

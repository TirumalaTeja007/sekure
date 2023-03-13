// ignore_for_file: non_constant_identifier_names

part of 'app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  static const splash = _Paths.splash;
  static const home = _Paths.home;
  static const profile = _Paths.profile;
  static const login = _Paths.login;
  static const otp = _Paths.otp;
  static const userRegistration = _Paths.userRegistration;
  static const services = _Paths.home + _Paths.services;
  static const chat = _Paths.home + _Paths.chat;
  static const settings = _Paths.home + _Paths.settings;
  static const myBookings = _Paths.home + _Paths.myBookings;

  Routes._();

  static String LOGIN_THEN(String afterSuccessfulLogin) =>
      '$login?then=${Uri.encodeQueryComponent(afterSuccessfulLogin)}';
}

abstract class _Paths {
  static const home = '/home';
  static const splash = '/splash';
  static const profile = '/profile';
  static const settings = '/settings';
  static const services = '/services';
  static const myBookings = '/myBookings';
  static const chat = '/chat';
  static const otp = '/otp';
  static const login = '/login';
  static const userRegistration = '/userRegistration';
}

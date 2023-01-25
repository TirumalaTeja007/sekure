// ignore_for_file: non_constant_identifier_names

part of 'app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  static const home = _Paths.home;
  static const index = _Paths.home + _Paths.index;
  static const services = _Paths.home + _Paths.services;
  static const aboutUs = _Paths.home + _Paths.aboutUs;
  static const contactUs = _Paths.home + _Paths.contactUs;
  static const refundPolicy = _Paths.home + _Paths.refundPolicy;
  static const privacyPolicy = _Paths.home + _Paths.privacyPolicy;
  static const shippingPolicy = _Paths.home + _Paths.shippingPolicy;
  static const termsAndConditions = _Paths.home + _Paths.termsAndConditions;
  static const dashboardSplash = _Paths.dashboardSplash;
  static const dashboard = _Paths.dashboard;
  static const profile = _Paths.dashboard + _Paths.profile;
  static const settings = _Paths.settings;
  static const products = _Paths.dashboard + _Paths.products;
  static const login = _Paths.login;
  static const signup = _Paths.signup;
  static const forgotPassword = _Paths.forgotPassword;
  static const dashboardOverview = _Paths.dashboard + _Paths.dashboardOverview;
  static const addChargers = _Paths.dashboard + _Paths.addChargers;
  static const chargersOverview = _Paths.dashboard + _Paths.chargersOverview;
  static const stationsOverview = _Paths.dashboard + _Paths.stationsOverview;
  static const addStations = _Paths.dashboard + _Paths.addStations;
  static const payments = _Paths.dashboard + _Paths.payments;
  static const sessionsManagement = _Paths.dashboard + _Paths.sessionsManagement;
  static const addUsers = _Paths.dashboard + _Paths.addUsers;
  static const usersReports = _Paths.dashboard + _Paths.usersReports;
  static const individualUserData = _Paths.dashboard + _Paths.individualUserData;
  static const ticketsManagement = _Paths.dashboard + _Paths.ticketsManagement;
  static const userDashboard = _Paths.userDashboard;
  static const userProfile = _Paths.userDashboard + _Paths.userProfile;
  static const userSessionHistory =
      _Paths.userDashboard + _Paths.userSessionHistory;
  static const userTransactionHistory =
      _Paths.userDashboard + _Paths.userTransactionHistory;
  static const userAccountSettings =
      _Paths.userDashboard + _Paths.userAccountSettings;
  static const userTickets = _Paths.userDashboard + _Paths.userTickets;
  static const sessionInformation = _Paths.sessionInformation;
  static const paymentInformation = _Paths.paymentInformation;
  static const ticketInformation = _Paths.ticketInformation;
  static const deviceInformation = _Paths.deviceInformation;
  static const stationInformation = _Paths.stationInformation;

  Routes._();

  static String LOGIN_THEN(String afterSuccessfulLogin) =>
      '$login?then=${Uri.encodeQueryComponent(afterSuccessfulLogin)}';
}

abstract class _Paths {
  static const home = '/home';
  static const index = '/index';
  static const services = '/services';
  static const aboutUs = '/aboutUs';
  static const contactUs = '/contactUs';
  static const refundPolicy = '/refundPolicy';
  static const privacyPolicy = '/privacyPolicy';
  static const termsAndConditions = '/termsAndConditions';
  static const shippingPolicy = '/shippingPolicy';
  static const products = '/products';
  static const profile = '/profile';
  static const settings = '/settings';
  static const productDetails = '/:productId';
  static const login = '/login';
  static const signup = '/signup';
  static const forgotPassword = '/forgotPassword';
  static const dashboard = '/dashboard';
  static const dashboardOverview = '/dashboardOverview';
  static const dashboardSplash = '/dashboardSplash';
  static const addStations = '/addStations';
  static const stationsOverview = '/stationsOverview';
  static const addChargers = '/addChargers';
  static const chargersOverview = '/chargersOverview';
  static const payments = '/payments';
  static const addUsers = '/addUsers';
  static const usersReports = '/usersReports';
  static const ticketsManagement = '/ticketsManagement';
  static const sessionsManagement = '/sessionsManagement';
  static const individualUserData = '/individualUserData';
  static const userProfile = '/userProfile';
  static const userDashboard = '/userDashboard';
  static const userSessionHistory = '/userSessionHistory';
  static const userTransactionHistory = '/userTransactionHistory';
  static const userTickets = '/userTickets';
  static const userAccountSettings = '/userAccountSettings';
  static const sessionInformation = '/sessionInformation';
  static const paymentInformation = '/paymentInformation';
  static const stationInformation = '/stationInformation';
  static const deviceInformation = '/deviceInformation';
  static const ticketInformation = '/ticketInformation';
}

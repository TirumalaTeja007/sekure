// ignore_for_file: non_constant_identifier_names

part of 'app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  static const home = _Paths.home;
  static const profile = _Paths.home + _Paths.profile;
  static const settings = _Paths.settings;
  static const products = _Paths.home + _Paths.products;
  static const login = _Paths.login;
  static const dashboard = _Paths.home + _Paths.dashboard;
  static const generateCPIDs = _Paths.home + _Paths.generateCPIDs;
  static const chargersReports = _Paths.home + _Paths.chargersReports;
  static const tariffManagement = _Paths.home + _Paths.tariffManagement;
  static const sessionsManagement = _Paths.home + _Paths.sessionsManagement;
  static const addUsers = _Paths.home + _Paths.addUsers;
  static const endUsersManagement = _Paths.home + _Paths.endUsersManagement;
  static const individualUserData = _Paths.home + _Paths.individualUserData;
  static const ticketsManagement = _Paths.home + _Paths.ticketsManagement;
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

  static String PRODUCT_DETAILS(String productId) => '$products/$productId';
}

abstract class _Paths {
  static const home = '/home';
  static const products = '/products';
  static const profile = '/profile';
  static const settings = '/settings';
  static const productDetails = '/:productId';
  static const login = '/login';
  static const dashboard = '/dashboard';
  static const generateCPIDs = '/generateCPIDs';
  static const chargersReports = '/chargersReports';
  static const tariffManagement = '/tariffManagement';
  static const addUsers = '/addUsers';
  static const endUsersManagement = '/endUsersManagement';
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

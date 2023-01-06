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
  static const dashboardOverview = _Paths.dashboard + _Paths.dashboardOverview;
  static const generateCPIDs = _Paths.dashboard + _Paths.generateCPIDs;
  static const chargersReports = _Paths.dashboard + _Paths.chargersReports;
  static const tariffManagement = _Paths.dashboard + _Paths.tariffManagement;
  static const sessionsManagement = _Paths.dashboard + _Paths.sessionsManagement;
  static const addUsers = _Paths.dashboard + _Paths.addUsers;
  static const endUsersManagement = _Paths.dashboard + _Paths.endUsersManagement;
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

  static String PRODUCT_DETAILS(String productId) => '$products/$productId';
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
  static const dashboard = '/dashboard';
  static const dashboardOverview = '/dashboardOverview';
  static const dashboardSplash = '/dashboardSplash';
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

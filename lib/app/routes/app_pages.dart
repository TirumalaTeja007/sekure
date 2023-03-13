
import 'package:get/get.dart';
import 'package:sekure/app/modules/chat/bindings/chat_binding.dart';
import 'package:sekure/app/modules/chat/views/chat_views.dart';
import 'package:sekure/app/modules/home/binding/home_binding.dart';
import 'package:sekure/app/modules/my_bookings/bindings/my_bookings_binding.dart';
import 'package:sekure/app/modules/my_bookings/views/my_bookings.dart';
import 'package:sekure/app/modules/otp/binding/otp_binding.dart';
import 'package:sekure/app/modules/services/bindings/services_binding.dart';
import 'package:sekure/app/modules/services/views/services_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/user_regsitration/binding/user_registration_binding.dart';
import '../modules/user_regsitration/views/user_regsitration_screen.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/otp/views/otp_screen.dart';
import '../modules/root/bindings/root_binding.dart';
import '../modules/root/views/root_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: '/',
      page: () => const RootView(),
      bindings: [RootBinding()],
      participatesInRootNavigator: true,
      preventDuplicates: true,
      children: [
        GetPage(
          preventDuplicates: true,
          name: _Paths.home,
          page: () => const HomeView(),
          bindings: [HomeBinding()],
          children: [
            GetPage(
              preventDuplicates: true,
              name: _Paths.services,
              page: () => ServicesView(),
              binding: ServicesBinding(),
            ),
            GetPage(
              name: _Paths.settings,
              page: () => SettingsView(),
              bindings: [SettingsBinding()],
            ),
            GetPage(
              name: _Paths.chat,
              page: () => ChatView(),
              bindings: [ChatBinding()],
            ),
            GetPage(
              name: _Paths.myBookings,
              page: () => MyBookingsView(),
              bindings: [MyBookingsBinding()],
            ),
          ],
        ),
        GetPage(
          name: _Paths.login,
          page: () => LoginView(),
          bindings: [LoginBinding()],
        ),
        GetPage(
          name: _Paths.otp,
          page: () => OTPScreen(),
          bindings: [OTPBinding()],
        ),
        GetPage(
          name: _Paths.userRegistration,
          page: () => UserRegistrationScreen(),
          bindings: [UserRegistrationBinding()],
        ),
      ],
    ),
  ];
}

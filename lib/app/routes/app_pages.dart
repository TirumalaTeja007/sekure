import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:get/get.dart';
import 'package:smartsocket/app/modules/about_us/about-us_view.dart';
import 'package:smartsocket/app/modules/chargers/bindings/chargers_binding.dart';
import 'package:smartsocket/app/modules/chargers/views/chargers_overview.dart';
import 'package:smartsocket/app/modules/chargers/views/add_chargers.dart';
import 'package:smartsocket/app/modules/contact_us/bindings/contact_us_binding.dart';
import 'package:smartsocket/app/modules/contact_us/contact_us_view.dart';
import 'package:smartsocket/app/modules/customer_support/bindings/customer_support_binding.dart';
import 'package:smartsocket/app/modules/customer_support/views/support_tickets_view.dart';
import 'package:smartsocket/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:smartsocket/app/modules/dashboardOverview/views/dashboard_overview.dart';
import 'package:smartsocket/app/modules/dashboard_splash/binding/splash_binding.dart';
import 'package:smartsocket/app/modules/dashboard_splash/views/dashboard_splash_view.dart';
import 'package:smartsocket/app/modules/home/binding/home_binding.dart';
import 'package:smartsocket/app/modules/home/views/home_view.dart';
import 'package:smartsocket/app/modules/about_us/aboutus_widget.dart';
import 'package:smartsocket/app/modules/payments/views/payments_view.dart';
import 'package:smartsocket/app/modules/services/binding/services_binding.dart';
import 'package:smartsocket/app/modules/services/view/services_view.dart';
import 'package:smartsocket/app/modules/session_information/binding/session_information_binding.dart';
import 'package:smartsocket/app/modules/session_information/views/session_information_screen.dart';
import 'package:smartsocket/app/modules/session_info/bindings/session_info_binding.dart';
import 'package:smartsocket/app/modules/session_info/views/session_info_view.dart';
import 'package:smartsocket/app/modules/signup/bindings/signup_binding.dart';
import 'package:smartsocket/app/modules/signup/view/signup_screen.dart';
import 'package:smartsocket/app/modules/stations/bindings/stations_binding.dart';
import 'package:smartsocket/app/modules/stations/views/add_station_view.dart';
import 'package:smartsocket/app/modules/stations/views/stations_overview.dart';
import 'package:smartsocket/app/modules/payments/bindings/payments_binding.dart';
import 'package:smartsocket/app/modules/user_account_settings/views/user_account_settings_screen.dart';
import 'package:smartsocket/app/modules/user_dashboard/bindings/user_dashboard_binding.dart';
import 'package:smartsocket/app/modules/user_dashboard/views/user_dashboard.dart';
import 'package:smartsocket/app/modules/user_profile/bindings/user_profile_binding.dart';
import 'package:smartsocket/app/modules/user_profile/views/user_profile_screen.dart';
import 'package:smartsocket/app/modules/users/bindings/users_binding.dart';
import 'package:smartsocket/app/modules/users/views/add_a_user_screen.dart';
import 'package:smartsocket/app/modules/users/views/users_overview.dart';
import 'package:smartsocket/app/widgets/bottom_bar.dart';
import '../middleware/auth_middleware.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/dashboardOverview/bindings/dashboard_overview_binding.dart';
import '../modules/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/forgot_password/view/forgot_password_view.dart';
import '../modules/index_page/index_page.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/policy_pages/binding/policy_page_binding.dart';
import '../modules/policy_pages/view/privacypolicy_view.dart';
import '../modules/policy_pages/view/refund_policy_view.dart';
import '../modules/policy_pages/view/shipping_policy.dart';
import '../modules/policy_pages/view/terms_and_conditions.dart';
import '../modules/root/bindings/root_binding.dart';
import '../modules/root/views/root_view.dart';
import '../modules/user_account_settings/bindings/user_account_settings_binding.dart';

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
              name: _Paths.index,
              page: () => const IndexPageView(),
            ),
            GetPage(
              name: _Paths.services,
              page: () => const ServicesView(),
              bindings: [ServicesPageBinding()],
            ),
            GetPage(
              name: _Paths.aboutUs,
              page: () => AboutUsView(),
            ),
            GetPage(
              name: _Paths.contactUs,
              page: () => ContactUsView(),
              bindings: [ContactUsBinding()],
            ),
            GetPage(
              name: _Paths.shippingPolicy,
              page: () => const ShippingPolicyView(),
              bindings: [PolicyPageBinding()],
            ),
            GetPage(
              name: _Paths.termsAndConditions,
              page: () => const TermsAndConditionsView(),
              bindings: [PolicyPageBinding()],
            ),
            GetPage(
              name: _Paths.refundPolicy,
              page: () => const RefundPolicyView(),
              bindings: [PolicyPageBinding()],
            ),
            GetPage(
              name: _Paths.privacyPolicy,
              page: () => const PrivacyPolicyView(),
              bindings: [PolicyPageBinding()],
            ),
          ],
        ),
        GetPage(
            name: _Paths.dashboardSplash,
            page: () => const DashboardSplashView(),
            bindings: [DashboardSplashBinding()]),
        GetPage(
          middlewares: [EnsureNotAuthedMiddleware()],
          name: _Paths.login,
          page: () => LoginView(),
          bindings: [LoginBinding()],
        ),
        GetPage(
          middlewares: [EnsureNotAuthedMiddleware()],
          name: _Paths.signup,
          page: () => SignupView(),
          bindings: [SignupBinding()],
        ),
        GetPage(
          middlewares: [EnsureNotAuthedMiddleware()],
          name: _Paths.forgotPassword,
          page: () => ForgotPasswordView(),
          bindings: [ForgotPasswordBinding()],
        ),
        GetPage(
          preventDuplicates: true,
          name: _Paths.dashboard,
          page: () => const DashboardView(),
          binding: DashboardBinding(),
          middlewares: [EnsureAuthMiddleware()],
          children: [
            GetPage(
              name: _Paths.dashboardOverview,
              page: () => const DashboardOverview(),
              binding: DashboardOverviewBinding(),
            ),
            GetPage(
              name: _Paths.addChargers,
              page: () => AddChargersView(),
              binding: ChargersBinding(),
            ),
            GetPage(
              name: _Paths.chargersOverview,
              page: () => const ChargersOverview(),
              binding: ChargersBinding(),
            ),
            GetPage(
              name: _Paths.addStations,
              page: () => AddStationsView(),
              binding: StationsBinding(),
            ),
            GetPage(
              name: _Paths.stationsOverview,
              page: () => const StationsOverview(),
              binding: StationsBinding(),
            ),
            GetPage(
              name: _Paths.payments,
              page: () => const PaymentsView(),
              binding: PaymentsBinding(),
            ),
            GetPage(
              name: _Paths.sessionInfo,
              page: () => const SessionInfoView(),
              binding: SessionInfoBinding(),
            ),
            GetPage(
              name: _Paths.addUsers,
              page: () => AddANewUser(),
              binding: UsersBinding(),
            ),
            GetPage(
              name: _Paths.usersOverview,
              page: () => UsersOverview(),
              binding: UsersBinding(),
            ),
            GetPage(
              name: _Paths.supportTickets,
              page: () => const SupportTicketsView(),
              binding: CustomerSupportBinding(),
            ),
          ],
        ),
        GetPage(
            preventDuplicates: true,
            name: _Paths.userDashboard,
            page: () => const UserDashboardScreen(),
            binding: UserDashboardBinding(),
            middlewares: [
              EnsureAuthMiddleware(),
            ],
            title: null,
            children: [
              GetPage(
                name: _Paths.userProfile,
                page: () => const UserProfileScreen(),
                binding: UserProfileBinding(),
              ),
              GetPage(
                name: _Paths.userAccountSettings,
                page: () => const UserAccountSettingsScreen(),
                binding: UserAccountSettingsBinding(),
              ),
              GetPage(
                name: _Paths.userSessionHistory,
                page: () => const SessionInfoView(),
                binding: SessionInfoBinding(),
              ),
              GetPage(
                name: _Paths.userTransactionHistory,
                page: () => const PaymentsView(),
                binding: PaymentsBinding(),
              ),
              GetPage(
                name: _Paths.userTickets,
                page: () => const SupportTicketsView(),
                binding: CustomerSupportBinding(),
              ),
            ]),
        GetPage(
          middlewares: [EnsureAuthMiddleware()],
          name: _Paths.sessionInformation,
          page: () => const SessionInformationScreen(),
          bindings: [SessionInformationBinding()],
        ),
      ],
    ),
  ];
}

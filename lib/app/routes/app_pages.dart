import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:get/get.dart';
import 'package:smartsocket/app/modules/about_us/about-us_view.dart';
import 'package:smartsocket/app/modules/chargers/bindings/chargers_binding.dart';
import 'package:smartsocket/app/modules/chargers/views/chargers_reports_screen.dart';
import 'package:smartsocket/app/modules/chargers/views/generate_cpids_screen.dart';
import 'package:smartsocket/app/modules/contact_us/bindings/contact_us_binding.dart';
import 'package:smartsocket/app/modules/contact_us/contact_us_view.dart';
import 'package:smartsocket/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:smartsocket/app/modules/dashboardOverview/views/dashboard_overview.dart';
import 'package:smartsocket/app/modules/dashboard_splash/binding/splash_binding.dart';
import 'package:smartsocket/app/modules/dashboard_splash/views/dashboard_splash_view.dart';
import 'package:smartsocket/app/modules/home/binding/home_binding.dart';
import 'package:smartsocket/app/modules/home/views/home_view.dart';
import 'package:smartsocket/app/modules/about_us/aboutus_widget.dart';
import 'package:smartsocket/app/modules/services/binding/services_binding.dart';
import 'package:smartsocket/app/modules/services/view/services_view.dart';
import 'package:smartsocket/app/modules/session_information/binding/session_information_binding.dart';
import 'package:smartsocket/app/modules/session_information/views/session_information_screen.dart';
import 'package:smartsocket/app/modules/sessions_management/bindings/session_management_binding.dart';
import 'package:smartsocket/app/modules/sessions_management/views/session_management_screen.dart';
import 'package:smartsocket/app/modules/stations/bindings/stations_binding.dart';
import 'package:smartsocket/app/modules/stations/views/add_sites_view.dart';
import 'package:smartsocket/app/modules/stations/views/stations_report.dart';
import 'package:smartsocket/app/modules/tariff_management/bindings/tariff_management_binding.dart';
import 'package:smartsocket/app/modules/tariff_management/views/tariff_management_screen.dart';
import 'package:smartsocket/app/modules/tickets_management/bindings/tickets_management_binding.dart';
import 'package:smartsocket/app/modules/tickets_management/views/tickets_management_screen.dart';
import 'package:smartsocket/app/modules/user_account_settings/views/user_account_settings_screen.dart';
import 'package:smartsocket/app/modules/user_dashboard/bindings/user_dashboard_binding.dart';
import 'package:smartsocket/app/modules/user_dashboard/views/user_dashboard.dart';
import 'package:smartsocket/app/modules/user_profile/bindings/user_profile_binding.dart';
import 'package:smartsocket/app/modules/user_profile/views/user_profile_screen.dart';
import 'package:smartsocket/app/modules/user_registration/bindings/user_registration_binding.dart';
import 'package:smartsocket/app/modules/user_registration/view/signup_screen.dart';
import 'package:smartsocket/app/modules/users_management/bindings/users_management_binding.dart';
import 'package:smartsocket/app/modules/user_registration/view/add_a_user_screen.dart';
import 'package:smartsocket/app/modules/users_management/views/end_users_screen.dart';
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
          bindings: [UserRegistrationBinding()],
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
              name: _Paths.generateCPIDs,
              page: () => GenerateCPIDScreen(),
              binding: ChargersBinding(),
            ),
            GetPage(
              name: _Paths.chargersReports,
              page: () => const ChargersReportsScreen(),
              binding: ChargersBinding(),
            ),
            GetPage(
              name: _Paths.addSites,
              page: () => AddSitesView(),
              binding: StationsBinding(),
            ),
            GetPage(
              name: _Paths.stationsReports,
              page: () => const StationsReportView(),
              binding: StationsBinding(),
            ),
            GetPage(
              name: _Paths.tariffManagement,
              page: () => const TariffManagementScreen(userType: "Admin"),
              binding: TariffManagementBinding(),
            ),
            GetPage(
              name: _Paths.sessionsManagement,
              page: () => const SessionManagementScreen(userType: "Admin"),
              binding: SessionManagementBinding(),
            ),
            GetPage(
              name: _Paths.addUsers,
              page: () => AddANewUser(),
              binding: UserRegistrationBinding(),
            ),
            GetPage(
              name: _Paths.endUsersManagement,
              page: () => EndUsersManagement(),
              binding: UsersManagementBinding(),
            ),
            GetPage(
              name: _Paths.ticketsManagement,
              page: () => const TicketsManagementScreen(userType: "Admin"),
              binding: TicketsManagementBinding(),
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
                page: () => const SessionManagementScreen(userType: "User"),
                binding: SessionManagementBinding(),
              ),
              GetPage(
                name: _Paths.userTransactionHistory,
                page: () => const TariffManagementScreen(userType: "User"),
                binding: TariffManagementBinding(),
              ),
              GetPage(
                name: _Paths.userTickets,
                page: () => const TicketsManagementScreen(userType: "User"),
                binding: TicketsManagementBinding(),
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

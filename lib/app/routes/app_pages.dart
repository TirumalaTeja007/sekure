import 'package:get/get.dart';
import 'package:smartsocket/app/modules/chargers/bindings/chargers_binding.dart';
import 'package:smartsocket/app/modules/chargers/views/chargers_reports_screen.dart';
import 'package:smartsocket/app/modules/chargers/views/generate_cpids_screen.dart';
import 'package:smartsocket/app/modules/session_information/binding/session_information_binding.dart';
import 'package:smartsocket/app/modules/session_information/views/session_information_screen.dart';
import 'package:smartsocket/app/modules/tariff_management/bindings/tariff_management_binding.dart';
import 'package:smartsocket/app/modules/tariff_management/views/tariff_management_screen.dart';
import 'package:smartsocket/app/modules/tickets_management/bindings/tickets_management_binding.dart';
import 'package:smartsocket/app/modules/tickets_management/views/tickets_management_screen.dart';
import 'package:smartsocket/app/modules/user_account_settings/views/user_account_settings_screen.dart';
import 'package:smartsocket/app/modules/user_dashboard/bindings/user_dashboard_binding.dart';
import 'package:smartsocket/app/modules/user_dashboard/views/user_dashboard.dart';
import 'package:smartsocket/app/modules/user_profile/bindings/user_profile_binding.dart';
import 'package:smartsocket/app/modules/user_profile/views/user_profile_screen.dart';
import 'package:smartsocket/app/modules/sessions_management/bindings/session_management_binding.dart';
import 'package:smartsocket/app/modules/sessions_management/views/session_management_screen.dart';
import 'package:smartsocket/app/modules/users_management/views/add_a_user_screen.dart';
import 'package:smartsocket/app/modules/users_management/views/end_users_screen.dart';
import 'package:smartsocket/app/modules/users_management/bindings/users_management_binding.dart';
import '../middleware/auth_middleware.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
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
          middlewares: [EnsureNotAuthedMiddleware()],
          name: _Paths.login,
          page: () => LoginView(),
          bindings: [LoginBinding()],
        ),
        GetPage(
          preventDuplicates: true,
          name: _Paths.home,
          page: () => const HomeView(),
          binding: HomeBinding(),
          middlewares: [EnsureAuthMiddleware()],
          children: [
            GetPage(
              name: _Paths.dashboard,
              page: () => const DashboardView(),
              binding: DashboardBinding(),
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
              binding: UsersManagementBinding(),
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
              EnsureNotAuthedMiddleware(),
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


import 'package:get_storage/get_storage.dart';
import 'package:sekure/app/modules/splash/views/splash_view.dart';
import 'package:sekure/constants/color_constants.dart';
import 'package:sekure/constants/constants.dart';
import 'package:sekure/services/app_state_service.dart';
import 'package:sekure/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sekure/services/splash_service.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage(kUserRepoToken).initStorage;

  runApp(
    GetMaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'SeKure',
      supportedLocales: const [Locale('en', 'US')],
      binds: [
        Bind.put(SplashService()),
        Bind.put(AuthService()),
        Bind.put(AppStateService()),
      ],
      // initialRoute: AppPages.initial,
      builder: (context, child) {
        return FutureBuilder<void>(
          key: const ValueKey('initFuture'),
          future: Get.find<SplashService>().init(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return child ?? const SizedBox.shrink();
            }
            return const SplashView();
          },
        );
      },
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'MontserratRegular',
        appBarTheme: const AppBarTheme(
            elevation: 0,
            color: Colors.transparent,
            iconTheme: IconThemeData(color: kPrimaryTextColor)),
        drawerTheme: const DrawerThemeData(backgroundColor: kBgShade),
        navigationRailTheme: const NavigationRailThemeData(
          backgroundColor: kPrimaryTextColor,
          unselectedIconTheme: IconThemeData(color: Colors.grey),
          selectedIconTheme: IconThemeData(color: Colors.white),
        ),
        listTileTheme: const ListTileThemeData(
          textColor: Colors.grey,
          iconColor: Colors.grey,
          contentPadding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        ),
        dividerTheme: const DividerThemeData(
            color: Colors.grey, indent: 32, endIndent: 32),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.green,
          secondary: Colors.lightGreen,
        ),
        cardTheme: const CardTheme(elevation: 12, shadowColor: Colors.white),
      ),
      defaultTransition: Transition.fadeIn,
      enableLog: true,
      getPages: AppPages.routes,
      routeInformationParser:
          GetInformationParser(initialRoute: AppPages.initial),
      routerDelegate: GetDelegate(
        backButtonPopMode: PopMode.history,
        preventDuplicateHandlingMode:
            PreventDuplicateHandlingMode.reorderRoutes,
        pages: AppPages.routes,
      ),
    ),
  );
}

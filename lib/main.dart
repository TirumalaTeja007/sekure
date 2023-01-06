import 'package:smartsocket/app/modules/splash/views/splash_view.dart';
import 'package:smartsocket/constants/color_constants.dart';
import 'package:smartsocket/services/app_state_service.dart';
import 'package:smartsocket/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/modules/splash/controllers/splash_controller.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Smart Socket',
      supportedLocales: const [Locale('en', 'US')],
      binds: [
        // Bind.put(SplashService()),
        Bind.put(AuthService()),
        Bind.put(AppStateService()),
      ],
      // initialRoute: AppPages.initial,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'MontserratRegular',
        appBarTheme: const AppBarTheme(
            elevation: 0,
            color: Colors.transparent,
            iconTheme: IconThemeData(color: kPrimaryTextColor)),
        drawerTheme: const DrawerThemeData(backgroundColor: kPrimaryTextColor),
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

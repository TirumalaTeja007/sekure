import 'package:get/get.dart';
import 'package:sekure/utils/local_storage.dart';

import '../../services/auth_service.dart';
import '../routes/app_pages.dart';

class EnsureAuthMiddleware extends GetMiddleware {
  @override
  Future<RouteDecoder?> redirectDelegate(RouteDecoder route) async {
    if (!AuthService.to.isLoggedIn) {
      final newRoute = Routes.LOGIN_THEN(route.pageSettings!.name);
      return RouteDecoder.fromRoute(newRoute);
    }

    return await super.redirectDelegate(route);
  }
}

class EnsureNotAuthedMiddleware extends GetMiddleware {
  @override
  Future<RouteDecoder?> redirectDelegate(RouteDecoder route) async {
    if (AuthService.to.isLoggedIn) {
      return null;
    }
    return await super.redirectDelegate(route);
  }
}

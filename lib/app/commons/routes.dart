
import 'package:compod_osasco_web/app/database_page/view/database_view.dart';
import 'package:compod_osasco_web/app/login/view/login_view.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

final appRoutes = [
  GetPage(name: Routes.home.route, page: () => LoginView()),
  GetPage(name: Routes.dashboard.route, page: () => DatabaseView())
];

enum Routes {
  home,
  dashboard
}

extension RoutesExt on Routes {
  String get route => '/${describeEnum(this)}';
}
import 'package:get/get.dart';
import 'package:kostamobile/check_view.dart';

import '../../loading.dart';
import '../modules/admin/bindings/admin_binding.dart';
import '../modules/admin/views/admin_view.dart';
import '../modules/admin_web/bindings/admin_web_binding.dart';
import '../modules/admin_web/views/admin_web_view.dart';
import '../modules/console/bindings/console_binding.dart';
import '../modules/console/views/console_view.dart';
import '../modules/custom/bindings/custom_binding.dart';
import '../modules/custom/views/custom_view.dart';
import '../modules/funding/bindings/funding_binding.dart';
import '../modules/funding/views/funding_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/my/bindings/my_binding.dart';
import '../modules/my/views/my_view.dart';
import '../modules/news/bindings/news_binding.dart';
import '../modules/news/views/news_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.CHECK;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.LOADING,
      page: () => Loading(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CUSTOM,
      page: () => const CustomView(),
      binding: CustomBinding(),
    ),
    GetPage(
      name: _Paths.FUNDING,
      page: () => const FundingView(),
      binding: FundingBinding(),
    ),
    GetPage(
      name: _Paths.NEWS,
      page: () => const NewsView(),
      binding: NewsBinding(),
    ),
    GetPage(
      name: _Paths.MY,
      page: () => MyView(),
      binding: MyBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN,
      page: () => AdminView(),
      binding: AdminBinding(),
    ),
    GetPage(
      name: _Paths.CONSOLE,
      page: () => const ConsoleView(),
      binding: ConsoleBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_WEB,
      page: () => const AdminWebView(),
      binding: AdminWebBinding(),
    ),
    GetPage(name: _Paths.CHECK, page: () => CheckView(), binding: HomeBinding())
  ];
}

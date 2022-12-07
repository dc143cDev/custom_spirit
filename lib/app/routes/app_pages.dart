import 'package:get/get.dart';

import '../modules/custom/bindings/custom_binding.dart';
import '../modules/custom/views/custom_view.dart';
import '../modules/funding/bindings/funding_binding.dart';
import '../modules/funding/views/funding_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/news/bindings/news_binding.dart';
import '../modules/news/views/news_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

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
  ];
}

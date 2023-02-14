import 'package:get/get.dart';
import 'package:unihome/routes/pages.dart';
import 'package:unihome/views/home/home.binding.dart';
import 'package:unihome/views/home/home.view.dart';
import 'package:unihome/views/login/login.binding.dart';
import 'package:unihome/views/login/login.view.dart';

class RoutePage {
  static final routes = [
    GetPage(
      name: ROUTE_LOGIN,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: ROUTE_HOME,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}

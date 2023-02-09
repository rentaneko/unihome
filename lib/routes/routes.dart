import 'package:get/get.dart';
import 'package:unihome/routes/pages.dart';
import 'package:unihome/views/login.binding.dart';
import 'package:unihome/views/login.view.dart';

class RoutePage {
  static final routes = [
    GetPage(
      name: ROUTE_LOGIN,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
  ];
}

import 'package:get/get.dart';
import 'package:unihome/routes/pages.dart';
import 'package:unihome/views/bottom_nav_bar/bottom_nav_bar.binding.dart';
import 'package:unihome/views/bottom_nav_bar/bottom_nav_bar.view.dart';
import 'package:unihome/views/home/home.binding.dart';
import 'package:unihome/views/home/home.view.dart';
import 'package:unihome/views/invoices/invoice.binding.dart';
import 'package:unihome/views/invoices/invoice.view.dart';
import 'package:unihome/views/login/login.binding.dart';
import 'package:unihome/views/login/login.view.dart';

class RoutePage {
  static final routes = [
    GetPage(
      name: ROUTE_INVOICE,
      page: () => const InvoiceScreen(),
      binding: InvoiceBinding(),
    ),
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
    GetPage(
      name: ROUTE_NAV_BAR,
      page: () => const BottomNavBarScreen(),
      binding: BottomNavBarBinding(),
    ),
  ];
}

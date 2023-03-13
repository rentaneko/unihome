import 'package:get/get.dart';
import 'package:unihome/routes/pages.dart';
import 'package:unihome/views/bottom_nav_bar/bottom_nav_bar.binding.dart';
import 'package:unihome/views/bottom_nav_bar/bottom_nav_bar.view.dart';
import 'package:unihome/views/contract/contract.binding.dart';
import 'package:unihome/views/contract/contract.view.dart';
import 'package:unihome/views/home/home.binding.dart';
import 'package:unihome/views/home/home.view.dart';
import 'package:unihome/views/house/house.binding.dart';
import 'package:unihome/views/house/house.view.dart';
import 'package:unihome/views/invoices/invoice.binding.dart';
import 'package:unihome/views/invoices/invoice.view.dart';
import 'package:unihome/views/login/login.binding.dart';
import 'package:unihome/views/login/login.view.dart';
import 'package:unihome/views/profile/profile.binding.dart';
import 'package:unihome/views/profile/profile.view.dart';
import 'package:unihome/views/service/service.binding.dart';
import 'package:unihome/views/service/service.view.dart';
import 'package:unihome/views/ticket/ticket.binding.dart';
import 'package:unihome/views/ticket/ticket.view.dart';

class RoutePage {
  static final routes = [
    GetPage(
      name: ROUTE_HOUSE,
      page: () => const HouseScreen(),
      binding: HouseBinding(),
    ),
    GetPage(
      name: ROUTE_CONTRACT,
      page: () => const ContractScreen(),
      binding: ContractBinding(),
    ),
    GetPage(
      name: ROUTE_TICKET,
      page: () => const TicketScreen(),
      binding: TicketBinding(),
    ),
    GetPage(
      name: ROUTE_SERVICE,
      page: () => const ServiceScreen(),
      binding: ServiceBinding(),
    ),
    GetPage(
      name: ROUTE_PROFILE,
      page: () => const ProfileScreen(),
      binding: ProfileBinding(),
    ),
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

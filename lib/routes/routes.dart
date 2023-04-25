import 'package:get/get.dart';
import 'package:unihome/routes/pages.dart';
import 'package:unihome/views/renter/forget_password/forget_password.binding.dart';
import 'package:unihome/views/renter/forget_password/forget_password.view.dart';
import 'package:unihome/views/renter/login/login.binding.dart';
import 'package:unihome/views/renter/login/login.view.dart';
import 'package:unihome/views/renter/bottom_nav_bar/bottom_nav_bar.binding.dart';
import 'package:unihome/views/renter/bottom_nav_bar/bottom_nav_bar.view.dart';
import 'package:unihome/views/renter/contract/contract.binding.dart';
import 'package:unihome/views/renter/contract/contract.view.dart';
import 'package:unihome/views/renter/contract_detail/contract_detail.binding.dart';
import 'package:unihome/views/renter/contract_detail/contract_detail.view.dart';
import 'package:unihome/views/renter/home/home.binding.dart';
import 'package:unihome/views/renter/home/home.view.dart';
import 'package:unihome/views/renter/house/house.binding.dart';
import 'package:unihome/views/renter/house/house.view.dart';
import 'package:unihome/views/renter/invoice_detail/invoice_detail.binding.dart';
import 'package:unihome/views/renter/invoice_detail/invoice_detail.view.dart';
import 'package:unihome/views/renter/invoices/invoice.binding.dart';
import 'package:unihome/views/renter/invoices/invoice.view.dart';
import 'package:unihome/views/renter/profile/profile.binding.dart';
import 'package:unihome/views/renter/profile/profile.view.dart';
import 'package:unihome/views/renter/service/service.binding.dart';
import 'package:unihome/views/renter/service/service.view.dart';
import 'package:unihome/views/renter/ticket/ticket.binding.dart';
import 'package:unihome/views/renter/ticket/ticket.view.dart';
import 'package:unihome/views/renter/ticket_detail/ticket_detail.binding.dart';
import 'package:unihome/views/renter/ticket_detail/ticket_detail.view.dart';
import 'package:unihome/views/splash.view.dart';
import 'package:unihome/views/technician/login_tech/login_tech.binding.dart';
import 'package:unihome/views/technician/login_tech/login_tech.view.dart';
import 'package:unihome/views/technician/nav_bar/nav_bar.binding.dart';
import 'package:unihome/views/technician/nav_bar/nav_bar.view.dart';
import 'package:unihome/views/technician/ticket_detai_tech/ticket_detail_tech.binding.dart';
import 'package:unihome/views/technician/ticket_detai_tech/ticket_detail_tech.view.dart';
import 'package:unihome/views/technician/ticket_tech/ticket_tech.binding.dart';
import 'package:unihome/views/technician/ticket_tech/ticket_tech.view.dart';

class RoutePage {
  static final routes = [
    GetPage(
      name: ROUTE_FORGET_PASSWORD,
      page: () => const ForgetPasswordScreen(),
      binding: ForgetPasswordBinding(),
    ),
    GetPage(
      name: ROUTE_INVOICE_DETAIL,
      page: () => const InvoiceDetailScreen(),
      binding: InvoiceDetailBinding(),
    ),
    GetPage(
      name: ROUTE_CONTRACT_DETAIL,
      page: () => const ContractDetailScreen(),
      binding: ContractDetailBinding(),
    ),
    GetPage(
      name: ROUTE_SPLASH,
      page: () => const SplashScreen(),
    ),
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
      name: ROUTE_TICKET_TECH,
      page: () => const TicketTechScreen(),
      binding: TicketTechBinding(),
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
      name: ROUTE_LOGIN_TECH,
      page: () => const LoginTechScreen(),
      binding: LoginTechBinding(),
    ),
    GetPage(
      name: ROUTE_HOME,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: ROUTE_TICKET_DETAIL,
      page: () => const TicketDetailScreen(),
      binding: TicketDetailBinding(),
    ),
    GetPage(
      name: ROUTE_TICKET_DETAIL_TECH,
      page: () => const TicketDetailTechScreen(),
      binding: TicketDetailTechBinding(),
    ),
    GetPage(
      name: ROUTE_NAV_BAR,
      page: () => const BottomNavBarScreen(),
      bindings: [
        BottomNavBarBinding(),
        HomeBinding(),
        HouseBinding(),
        InvoiceBinding(),
        TicketBinding(),
      ],
    ),
    GetPage(
      name: ROUTE_NAV_BAR_TECH,
      page: () => const NavBarScreen(),
      bindings: [
        NavBarBinding(),
      ],
    ),
  ];
}

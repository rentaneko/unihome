import 'package:get/get.dart';

class NavBarController extends GetxController {
  var selectedIndex = 0.obs;

  void changeTab(int value) => selectedIndex.value = value;
}

import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  var selectedIndex = 0.obs;

  void changeTab(int value) => selectedIndex.value = value;
}

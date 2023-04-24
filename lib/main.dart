import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:unihome/routes/pages.dart';
import 'package:unihome/routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'VinFlat',
      debugShowCheckedModeBanner: false,
      builder: (_, child) => FlutterEasyLoading(child: child),
      getPages: RoutePage.routes,
      initialRoute: ROUTE_SPLASH,
    );
  }
}

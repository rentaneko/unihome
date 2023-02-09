import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unihome/routes/pages.dart';
import 'package:unihome/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Unihome Demo',
      debugShowCheckedModeBanner: false,
      getPages: RoutePage.routes,
      initialRoute: ROUTE_LOGIN,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_app/app_router/app_router.dart';

void main() {
  runApp(const MathApp());
}

class MathApp extends StatelessWidget {
  const MathApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        // initialRoute: '/login-page',
        initialRoute: AppRoutes.initialRoute,
        getPages: AppRoutes.routes);
  }
}

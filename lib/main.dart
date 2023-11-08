import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_app/game/game_bindings.dart';
import 'package:math_app/game/game_ui.dart';
import 'package:math_app/home/home_bindings.dart';
import 'package:math_app/home/home_ui.dart';
import 'package:math_app/result/result_bindings.dart';
import 'package:math_app/result/result_ui.dart';

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
      home: const HomeScreen(),
      getPages: [
        GetPage(
          name: '/home-page',
          page: () => const HomeScreen(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: '/game-page',
          page: () => const GameScreen(),
          binding: GameBinding(),
        ),
        GetPage(
          name: '/result-page',
          page: () => const ResultScreen(),
          binding: ResultBinding(),
        )
      ],
    );
  }
}

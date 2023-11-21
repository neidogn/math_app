import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_app/app_router/app_router.dart';
import 'package:math_app/screen/game/widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //print('hahhaaa');
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 234, 239, 240),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/logo-1.png',
              width: 300,
            ),
            const SizedBox(height: 30),
            CustomButton(
              width: 200,
              height: 60,
              onTap: () {
                Get.toNamed(AppRoutes.gameRoute);
              },
              frontColor: Color.fromARGB(255, 218, 85, 104),
              shadowColor: Color.fromARGB(255, 181, 50, 64),
              child: const Icon(
                Icons.play_arrow_rounded,
                color: Colors.white,
                size: 45,
              ),
            ),
            const SizedBox(height: 30),
            CustomButton(
              width: 200,
              height: 60,
              onTap: () {
                Get.toNamed(AppRoutes.leaderboardRoute);
              },
              frontColor: Color.fromARGB(255, 154, 68, 92),
              shadowColor: Color.fromARGB(255, 121, 33, 55),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.bar_chart_rounded,
                    color: Colors.white,
                    size: 40,
                  ),
                  Text(
                    'Ranking',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

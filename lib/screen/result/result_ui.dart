import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_app/screen/game/game_controller.dart';
import 'package:math_app/screen/game/widgets/custom_button.dart';
import 'package:math_app/screen/result/result_controller.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final gameController = Get.find<GameController>();
    final resultController = Get.find<ResultController>();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 234, 239, 240),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomButton(
              frontColor: Color.fromARGB(255, 255, 115, 64),
              shadowColor: Color.fromARGB(255, 216, 78, 22),
              width: 200,
              height: 250,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Obx(
                      () {
                        final score = gameController.scoreRx;
                        return Text(
                          '$score',
                          style: const TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                    Obx(
                      () => Text(
                        'Highest Score: ${resultController.highestScore.value} ',
                        style:
                            const TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 100,
              width: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    height: 80,
                    width: 80,
                    frontColor: Color.fromARGB(255, 167, 62, 91),
                    shadowColor: Color.fromARGB(255, 121, 33, 55),
                    onTap: () => Get.until((route) {
                      //print('agggggggg${route.settings.name}');
                      return route.settings.name == '/home-page';
                    }),
                    child: const Center(
                      child: Icon(
                        Icons.home,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                  CustomButton(
                    height: 80,
                    width: 80,
                    frontColor: Color.fromARGB(255, 218, 85, 104),
                    shadowColor: Color.fromARGB(255, 181, 50, 64),
                    onTap: () {
                      gameController.resetGame();
                      Get.back(); // Chuyển đến màn hình chơi
                    },
                    child: const Center(
                      child: Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.white,
                        size: 70,
                      ),
                    ),
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

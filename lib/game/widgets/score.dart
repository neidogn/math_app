import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_app/game/game_controller.dart';
import 'package:math_app/game/widgets/custom_button.dart';

class ScoreWidget extends StatelessWidget {
  const ScoreWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final score = Get.find<GameController>().scoreRx;
        return CustomButton(
          height: 50,
          width: 50,
          frontColor: Color.fromARGB(255, 167, 62, 91),
          shadowColor: Color.fromARGB(255, 129, 25, 54),
          child: Center(
            child: Text(
              '$score',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}

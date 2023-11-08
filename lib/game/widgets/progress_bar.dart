import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_app/game/game_controller.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Obx(
        () {
          final animationValue = Get.find<GameController>().animation.value;
          const maxWidth = 270;

          return Stack(
            children: [
              Container(
                width: maxWidth.toDouble(),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 173, 106, 124),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                width: maxWidth * animationValue,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 212, 179, 188),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

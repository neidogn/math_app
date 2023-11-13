// GameScreen.dart
import 'package:flutter/material.dart';
import 'package:math_app/screen/game/widgets/answer_button.dart';
import 'package:get/get.dart';
import 'package:math_app/screen/game/game_controller.dart';
import 'package:math_app/screen/game/widgets/progress_bar.dart';
import 'widgets/custom_button.dart';
import 'widgets/score.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 234, 239, 240),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(width: 20),
                renderProgressTimer(),
                const SizedBox(width: 15),
                const ScoreWidget(),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Center(
                child: GetBuilder<GameController>(
                  builder: (controller) {
                    print('hahhaaa');
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        renderQuestion(),
                        const SizedBox(height: 150),
                        Container(
                            alignment: Alignment.bottomCenter,
                            child: renderAnswerButton()),
                        const SizedBox(height: 100),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget renderProgressTimer() {
    return CustomButton(
      width: 300,
      height: 50,
      frontColor: Color.fromARGB(255, 167, 62, 91),
      shadowColor: Color.fromARGB(255, 129, 25, 54),
      child: Center(
        child: SizedBox(
          height: 23,
          width: 270,
          child: Container(
            // margin: EdgeInsets.all(10),
            child: ProgressBar(),
          ),
        ),
      ),
    );
  }

  Widget renderQuestion() {
    String questionText = Get.find<GameController>().currentQuestion.question;

    List<String> questionParts = questionText.split(' ');
    List<Widget> questionWidgets = [];

    for (int i = 0; i < questionParts.length; i++) {
      if (i % 2 == 0) {
        questionWidgets.add(
          CustomButton(
            width: 60,
            height: 60,
            frontColor: Color.fromARGB(255, 255, 115, 64),
            shadowColor: Color.fromARGB(255, 216, 78, 22),
            child: Text(
              questionParts[i],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      } else {
        questionWidgets.add(
          CustomButton(
            width: 43,
            height: 43,
            frontColor: Color.fromARGB(255, 167, 62, 91),
            shadowColor: Color.fromARGB(255, 129, 25, 54),
            child: Text(
              questionParts[i],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }

      if (i < questionParts.length - 1) {
        questionWidgets.add(
          const SizedBox(
              width: 5), // Để tạo khoảng cách giữa các số hạng và phép tính
        );
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: questionWidgets,
    );
  }

  Widget renderAnswerButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnswerButton(
              onPressed: () => Get.find<GameController>().isCorrectAnswer(0),
              title: Get.find<GameController>()
                  .currentQuestion
                  .answers[0]
                  .toString(),
            ),
            const SizedBox(width: 20),
            AnswerButton(
              onPressed: () => Get.find<GameController>().isCorrectAnswer(1),
              title: Get.find<GameController>()
                  .currentQuestion
                  .answers[1]
                  .toString(),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnswerButton(
              onPressed: () => Get.find<GameController>().isCorrectAnswer(2),
              title: Get.find<GameController>()
                  .currentQuestion
                  .answers[2]
                  .toString(),
            ),
            const SizedBox(width: 20),
            AnswerButton(
              onPressed: () => Get.find<GameController>().isCorrectAnswer(3),
              title: Get.find<GameController>()
                  .currentQuestion
                  .answers[3]
                  .toString(),
            ),
          ],
        ),
      ],
    );
  }
}

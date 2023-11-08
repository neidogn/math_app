// AnswerButton.dart
import 'package:flutter/material.dart';
import 'package:math_app/game/widgets/custom_button.dart';

class AnswerButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  AnswerButton({Key? key, required this.onPressed, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: CustomButton(
        onTap: () {
          onPressed!();
        },
        width: 150, // Đặt kích thước cho nút
        height: 70,
        frontColor: Color.fromARGB(255, 255, 115, 64),
        shadowColor: Color.fromARGB(255, 216, 78, 22),
        child: Text(
          //Get.find<QuestionController>().currentQuestion.answers[1].toString(),
          title,
          style: const TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

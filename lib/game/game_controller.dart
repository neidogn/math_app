import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/question.dart';

class GameController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late RxDouble _animation;

  RxDouble get animation => _animation;
  static final _tween = Tween<double>(begin: 1.0, end: 0.0);

  @override
  void onInit() {
    _animationController =
        AnimationController(duration: const Duration(seconds: 10), vsync: this);
    // Khởi tạo giá trị RxDouble
    _animation = 1.0.obs;

    _animationController.addListener(() {
      // Cập nhật giá trị RxDouble bằng giá trị hiện tại của Tween
      _animation.value = _tween.evaluate(_animationController);
    });
    _animationController.forward().whenComplete(() => gameOver());
    generateRandomQuestion();
    super.onInit();
  }

  @override
  void onClose() {
    _animationController.dispose();
    super.onClose();
  }

  late Question _currentQuestion;
  RxInt _score = 0.obs;
  RxInt get scoreRx => _score;
  int get score => _score.value;

  Question get currentQuestion => _currentQuestion;

  // Hàm tạo câu hỏi ngẫu nhiên
  void generateRandomQuestion() {
    _animation.value = 0.0; // Reset animation
    _animationController.reset();
    _animationController.forward().whenComplete(() => gameOver());
    //gen question
    int numberOfOperands = Random().nextInt(3) + 2; // Từ 2 đến 4 toán hạng
    List<int> operands =
        List.generate(numberOfOperands, (index) => Random().nextInt(9) + 1);

    List<String> operators = List.generate(numberOfOperands - 1, (index) {
      List<String> availableOperators = ['+', '-', 'x'];
      return availableOperators[Random().nextInt(availableOperators.length)];
    });

    String question = '';
    for (int i = 0; i < numberOfOperands - 1; i++) {
      question += '${operands[i]} ${operators[i]} ';
    }
    question += '${operands.last}';

    List<int> answerOptions = getAnswerOptions(List.from(operands), operators);
    _currentQuestion = Question(
      id: DateTime.now().millisecondsSinceEpoch,
      question: question,
      answers: answerOptions.map((answer) => answer).toList(),
      correctAnswer: calculateCorrectAnswer(operands, operators),
    );
    while (currentQuestion.correctAnswer < 0 ||
        currentQuestion.correctAnswer > 100) {
      generateRandomQuestion();
    }
    update(); // Cập nhật giao diện khi có câu hỏi mới
  }

  List<int> getAnswerOptions(List<int> operands, List<String> operators) {
    int correctAnswer = calculateCorrectAnswer(operands, operators);

    List<int> answerOptions = [];

    answerOptions.add(correctAnswer);

    for (int i = 0; i < 3; i++) {
      int randomOffset = Random().nextInt(11) - 5; // -5 -> 5
      int randomAnswer = correctAnswer + randomOffset;

      while (answerOptions.contains(randomAnswer) ||
          randomAnswer == correctAnswer) {
        randomOffset = Random().nextInt(11) - 5;
        randomAnswer = correctAnswer + randomOffset;
      }

      answerOptions.add(randomAnswer);
    }

    answerOptions.shuffle();

    return answerOptions;
  }

  int calculateCorrectAnswer(List<int> operands, List<String> operators) {
    print('Start Calculation: operands=$operands, operators=$operators');

    for (int i = 0; i < operators.length; i++) {
      if (operators[i] == 'x') {
        operands[i + 1] = operands[i] * operands[i + 1];
      } else if (operators[i] == '-') {
        operands[i + 1] = operands[i] - operands[i + 1];
      }
      print('Intermediate Step: operands=$operands, operators=$operators');
    }

    int result = operands.last;

    for (int i = 0; i < operators.length; i++) {
      if (operators[i] == '+') {
        result += operands[i];
      }
    }

    print('Final Result: $result');
    return result;
  }

  void isCorrectAnswer(int selectedAnswerIndex) {
    int selectedAnswer = currentQuestion.answers[selectedAnswerIndex];
    int correctAnswer = currentQuestion.correctAnswer;

    if (selectedAnswer == correctAnswer) {
      _score.value++;
      generateRandomQuestion();
      print('Correct');
    } else {
      gameOver();
    }
  }

 void gameOver() {
  print('Game over');
  //_animationController.dispose();
  Get.offAllNamed('/result-page');
}


  void resetGame() {
    _score.value = 0;
    generateRandomQuestion();
  }
}

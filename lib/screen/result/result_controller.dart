import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_app/db/sql_helper.dart';
import 'package:math_app/model/player.dart';
import 'package:math_app/screen/game/game_controller.dart';

class ResultController extends GetxController {
  RxInt highestScore = (-1).obs;
  int tenthScore = -1;

  final gameController = Get.find<GameController>();
  final nameController = TextEditingController(); // Controller cho TextField

  @override
  void onReady() async {
    highestScore.value = await DatabaseHelper.getHighestScore();
    tenthScore = await DatabaseHelper.getTenthScore();

    showDialog();

    super.onReady();
  }

  @override
  void onClose() async {
    nameController.dispose();
    super.onClose();
  }

  void showDialog() async {
  if (gameController.scoreRx.value > tenthScore) {
    await Get.defaultDialog(
      title: 'Congratulations!',
      content: Column(
        children: [
          const Text('You made it to the top 10!'),
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: 'Enter your name',
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () async {
            if (nameController.text.isNotEmpty) {
              final playerName = nameController.text;
              
              // Kiểm tra xem tên đã tồn tại trong leaderboard hay chưa
              final existingPlayer = await DatabaseHelper.getPlayerByName(playerName);
              
              if (existingPlayer != null) {
                // Tên đã tồn tại, yêu cầu người dùng nhập tên khác
                Get.snackbar('Warning', 'This name already exists. Please enter a different name.');
              } else {
                // Tên không tồn tại, thêm người chơi mới
                final newPlayer = Player(
                  id: DateTime.now().millisecondsSinceEpoch,
                  name: playerName,
                  score: gameController.scoreRx.value,
                  lastUpdate: DateTime.now().millisecondsSinceEpoch,
                );
                DatabaseHelper.insertPlayer(newPlayer);
                Get.back();
              }
            }
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
}

import 'package:get/get.dart';
import 'package:math_app/screen/game/game_controller.dart';


class GameBinding implements Bindings{
 @override
  void dependencies() {
    Get.lazyPut<GameController>(() => GameController());
  }
}
import 'package:get/get.dart';
import 'package:math_app/screen/result/result_controller.dart';

class ResultBinding implements Bindings{
 @override
  void dependencies() {
    Get.lazyPut<ResultController>(() => ResultController());
  }
}
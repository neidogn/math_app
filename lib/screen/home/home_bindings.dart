import 'package:get/get.dart';
import 'package:math_app/screen/home/home_controller.dart';

class HomeBinding implements Bindings{
 @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
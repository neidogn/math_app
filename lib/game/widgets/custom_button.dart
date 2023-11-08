import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? frontColor;
  final Color? shadowColor;
  final Widget? child;
  final double? width;
  final double? height;

  CustomButton({
    Key? key,
    this.onTap,
    required this.frontColor,
    required this.shadowColor,
    this.child,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.create(() => CustomButtonController());
    return GetBuilder<CustomButtonController>(
      builder: (controller) {
        return SizedBox(
          width: width,
          height: height,
          child: GestureDetector(
            onTap: onTap,
            onTapDown: (_) {
              controller.changePadding(0.0);
            },
            onTapUp: (_) {
              controller.changePadding(9.0);
            },
            child: AnimatedContainer(
              padding: EdgeInsets.only(bottom: controller.padding),
              //height: 50 + controller.padding,
              decoration: BoxDecoration(
                color: shadowColor,
                borderRadius: BorderRadius.circular(10),
              ),
              duration: const Duration(milliseconds: 100),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: frontColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: child,
              ),
            ),
          ),
        );
      },
    );
  }
}

class CustomButtonController extends GetxController {
  double _padding = 9.0;
  double get padding => _padding;

  void changePadding(double newPadding) {
    _padding = newPadding;
    update();
  }
}

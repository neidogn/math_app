import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_app/screen/login/login_controller.dart';
import 'package:math_app/screen/login/widgets/text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final LoginController controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7FC),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: ShapeDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/images/nn24h.png'),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  width: 80.25,
                  height: 2.50,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Color(0xFF050044).withOpacity(0.8),
                      blurRadius: 15,
                    )
                  ]),
                ),
                const SizedBox(height: 85),
                MyTextField(
                  controller: controller.accountController.value,
                  labelText: 'Tài khoản',
                  obscureText: false,
                  prefixIcon: const Icon(
                    Icons.person_outline_rounded,
                  ),
                ),
                const SizedBox(height: 25),
                MyTextField(
                  controller: controller.passwordController.value,
                  labelText: 'Mật khẩu',
                  obscureText: true,
                  prefixIcon: const Icon(Icons.lock_outline_rounded),
                  suffixIcon: const Icon(Icons.visibility_off),
                ),
                const SizedBox(height: 50),
                renderButton(),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Không có tài khoản?"),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Đăng ký ngay"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget renderButton() {
    return Obx(
      () => InkWell(
        onTap: () {
          controller.loginApi();
        },
        child: controller.loading.value
            ? const CircularProgressIndicator()
            : Container(
                width: 150,
                height: 55,
                decoration: ShapeDecoration(
                  color: Color(0xFF685DD8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0xFFD3D1EF),
                      blurRadius: 15,
                      offset: Offset(0, 15),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: const Center(
                  child: Text(
                    'Đăng nhập',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var status = prefs.getBool('isLoggedIn') ?? false;
      print(status);
      if (status) {
        Get.offNamed('/home-page');
      } else {
        Get.offNamed('/login-page');
      }
    });
    return Scaffold(
      backgroundColor: Color(0xFF685DD8),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 40.5),
            Center(
              child: Container(
                width: 393,
                height: 393,
                decoration: const ShapeDecoration(
                  shape: OvalBorder(
                    side: BorderSide(width: 1.50, color: Color(0xFF756CD6)),
                  ),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        width: 282,
                        height: 282,
                        decoration: const ShapeDecoration(
                          shape: OvalBorder(),
                          color: Color(0xFFEADCF5),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 41,
                      left: 41,
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: const ShapeDecoration(
                          color: Color(0xFFEADCF5),
                          shape: OvalBorder(),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 50,
                      child: Container(
                        width: 14,
                        height: 14,
                        decoration: const ShapeDecoration(
                          color: Color(0xFFEADCF5),
                          shape: OvalBorder(),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 130,
                      right: 20,
                      child: Container(
                        width: 14,
                        height: 14,
                        decoration: const ShapeDecoration(
                          color: Color(0xFFEADCF5),
                          shape: OvalBorder(),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 210,
                      right: 25,
                      child: Container(
                        width: 246,
                        height: 100,
                        child: Image.asset('assets/images/frame.png'),
                      ),
                    ),
                    Positioned(
                      top: 110,
                      right: 150,
                      child: Container(
                        width: 90,
                        height: 90,
                        child: Image.asset('assets/images/nn24h.png'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 80),
            const Text(
              ' Ngoại Ngữ 24h',
              style: TextStyle(
                color: Colors.white,
                fontSize: 38,
                fontFamily: 'Segoe UI',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              '  Học với niềm vui với chúng tôi, \n            bất kể bạn ở đâu!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            )
          ],
        ),
      ),
    );
  }
}

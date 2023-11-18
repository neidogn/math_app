import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:math_app/screen/login/api_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final accountController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  RxBool loading = false.obs;

  void loginApi() async {
    loading.value = true;

    try {
      final response = await post(
          Uri.parse(
              'https://thpt2-dot-comaiphuong-edu.appspot.com/api/app/login'),
          body: {
            'account': accountController.value.text,
            'password': passwordController.value.text,
            "token": ApiConfig.TOKEN
          });

      var data = jsonDecode(response.body);
      print(response.statusCode);
      print(data);

      int status = data['status'];
      if (status == 0) {
        loading.value = false;
        Get.snackbar('Login Successful', 'Congratulation');
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool("isLoggedIn", true);
        Get.offAllNamed('/home-page');
      } else if (status == -1) {
        loading.value = false;
        Get.snackbar('Login Failed', 'Something went wrong');
      } else if (status == 1) {
        loading.value = false;
        Get.snackbar('Login Failed', 'Login account is used');
      } else if (status == 2) {
        loading.value = false;
        Get.snackbar('Login Failed', 'Login account not exist');
      } else if (status == 3) {
        loading.value = false;
        Get.snackbar('Login Failed', 'Login wrong password');
      } else if (status == 8) {
        loading.value = false;
        Get.snackbar('Login Failed', 'Login not existed');
      } else {
        loading.value = false;
        Get.snackbar('Login Failed', 'Something went wrong');
      }
    } catch (e) {
      loading.value = false;
      Get.snackbar('Exception', e.toString());
    }
  }
}

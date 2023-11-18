import 'package:get/get.dart';
import 'package:math_app/screen/game/game_bindings.dart';
import 'package:math_app/screen/game/game_ui.dart';
import 'package:math_app/screen/home/home_bindings.dart';
import 'package:math_app/screen/home/home_ui.dart';
import 'package:math_app/screen/leaderboard/leaderboard_ui.dart';
import 'package:math_app/screen/login/login_bindings.dart';
import 'package:math_app/screen/login/login_ui.dart';
import 'package:math_app/screen/result/result_bindings.dart';
import 'package:math_app/screen/result/result_ui.dart';
import 'package:math_app/screen/splash/splash_ui.dart';


class AppRoutes {
  static final routes = [
    GetPage(
      name: '/home-page',
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: '/game-page',
      page: () => const GameScreen(),
      binding: GameBinding(),
    ),
    GetPage(
      name: '/result-page',
      page: () => const ResultScreen(),
      binding: ResultBinding(),
    ),
    GetPage(
      name: '/leaderboard-page',
      page: () => const LeaderboardScreen(),
    ),
    GetPage(
      name: '/splash-page',
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: '/login-page',
      page: () => LoginScreen(),
      binding: LoginBindings(),
    ),
  ];

  static const initialRoute = '/splash-page';
}

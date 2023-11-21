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
      name: homeRoute,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: gameRoute,
      page: () => const GameScreen(),
      binding: GameBinding(),
    ),
    GetPage(
      name: resultRoute,
      page: () => const ResultScreen(),
      binding: ResultBinding(),
    ),
    GetPage(
      name: leaderboardRoute,
      page: () => const LeaderboardScreen(),
    ),
    GetPage(
      name: splashRoute,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: loginRoute,
      page: () => LoginScreen(),
      binding: LoginBindings(),
    ),
  ];

  static const initialRoute = splashRoute;
  // static const initialRoute = '/login-page';
  static const loginRoute = '/login-page';
  static const splashRoute = '/splash-page';
  static const leaderboardRoute = '/leaderboard-page';
  static const resultRoute = '/result-page';
  static const gameRoute = '/game-page';
  static const homeRoute = '/home-page';

}

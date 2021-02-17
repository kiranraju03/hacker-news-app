import 'package:get/route_manager.dart';
import 'package:hackernews/routes/routes.dart' as routes;
import 'package:hackernews/screens/home_screen.dart';
import 'package:hackernews/screens/postings/posting_details_screen.dart';
import 'package:hackernews/screens/splash_screen.dart';

abstract class Screens {
  static final screens = [
    GetPage(
      name: routes.SPLASH,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: routes.HOME,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: routes.POSTING,
      page: () => PostingDetailsScreen(),
    ),
  ];
}

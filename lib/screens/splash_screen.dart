import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackernews/config/size_config.dart';
import 'package:hackernews/controllers/search_results_controller.dart';
import 'package:hackernews/routes/routes.dart' as routes;
import 'package:hackernews/widgets/shared/loading_indicator.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with AfterLayoutMixin {
  @override
  void afterFirstLayout(BuildContext context) {
    Get.lazyPut(
      () => SearchResultsController(),
    );
    Future.delayed(
        Duration(
          seconds: 2,
        ), () {
      Get.find<SearchResultsController>().init();
      Get.toNamed(
        routes.HOME,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Hacker News',
            style: title,
          ),
          SizedBox(
            height: 3 * SizeConfig.safeBlockVertical,
          ),
          LoadingIndicator()
        ],
      ),
    );
  }
}

TextStyle title = TextStyle(
  fontSize: 10 * SizeConfig.safeBlockHorizontal,
  color: Colors.black,
);

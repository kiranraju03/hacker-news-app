import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackernews/config/size_config.dart';
import 'package:hackernews/routes/routes.dart' as routes;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with AfterLayoutMixin {
  @override
  void afterFirstLayout(BuildContext context) {
    Future.delayed(
        Duration(
          seconds: 2,
        ), () {
      Get.toNamed(
        routes.HOME,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
        child: Text(
          'Hacker News',
          style: title,
        ),
      ),
    );
  }
}

TextStyle title = TextStyle(
  fontSize: 10 * SizeConfig.safeBlockHorizontal,
  color: Colors.black,
);

import 'package:flutter/material.dart';
import 'package:hackernews/config/size_config.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            'Home Screen',
            style: title,
          ),
        ),
      ),
    );
  }
}

TextStyle title = TextStyle(
  fontSize: 5 * SizeConfig.safeBlockHorizontal,
  color: Colors.black,
);

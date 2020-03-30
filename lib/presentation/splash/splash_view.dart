
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_news_app/constant/asset_icons.dart';
import 'package:flutter_news_app/presentation/newsboard/newsboard_view.dart';
import 'package:flutter_news_app/route_paths.dart';

class SplashView extends StatefulWidget {
  @override
  SplashPageScreen createState() => new SplashPageScreen();
}
class SplashPageScreen extends State<SplashView> {

  startTime() async {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, _navigationPage);
  }

  _navigationPage() {
    Navigator.of(context).pushReplacementNamed(RoutePaths.NewsBoard);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        child: Center(
          child: Image(height: 130.0,
            image: AssetImage(AssetIcons.news_logo,),
          ),
        ),

        color: Colors.white,
      ),
    );
  }
}
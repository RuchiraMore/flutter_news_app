import 'package:flutter/material.dart';
import 'package:flutter_news_app/di/providers.dart';
import 'package:flutter_news_app/route_paths.dart';
import 'package:flutter_news_app/router.dart';
import 'package:provider/provider.dart';

class NewsApplication extends StatelessWidget {

  NewsApplication();

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RoutePaths.Splash,
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}

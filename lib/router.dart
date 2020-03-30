import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/presentation/newsboard/newsboard_view.dart';
import 'package:flutter_news_app/presentation/newsboardDetails/newsboard_details_view.dart';
import 'package:flutter_news_app/route_paths.dart';

class Router {
  
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.NewsBoard:
        return MaterialPageRoute(builder: (_) => NewsBoardView());
      case RoutePaths.NewsBoardDetails:
        var newsListDetails = settings.arguments;
        print('pass news data -> \n'+newsListDetails);
        return MaterialPageRoute(builder: (_) => NewsBoardDetailsView(
          indexTag: newsListDetails,
          newsDetails: newsListDetails,
        ));
    }
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/ui/base_widget.dart';
import 'package:flutter_news_app/presentation/base/newsboard_baseview.dart';
import 'package:flutter_news_app/presentation/newsboard/newsboard_view_ui.dart';
import 'package:flutter_news_app/presentation/newsboard/newsboard_viewmodel.dart';
import 'package:provider/provider.dart';

class NewsBoardView extends NewsboardBaseview<NewsboardViewmodel> {
  @override
  NewsboardScreen createState() => NewsboardScreen();
}

class NewsboardScreen extends NewsboardBaseState<NewsboardViewmodel, NewsBoardView> {

  final GlobalKey<RefreshIndicatorState> refreshKey = new GlobalKey<RefreshIndicatorState>();

  NewsboardScreen() : super(){
    setRequiresLogin(false);
  }

  @override
  Color scaffoldColor() {
    return Colors.white;
  }

  @override
  void initState() {
    super.initState();
  }

  Future<Null> refreshNewsList() async {
    print('refreshing news');
    refreshKey.currentState.show(atTop: false);
    setState((){
      NewsboardViewUi();
    });
//    return null;
  }

  @override
  Widget buildBody() {

    return BaseWidget<NewsboardViewmodel>(
      viewModel: getViewModel(),
      onModelReady: (model){
        print('new model is ready');
        model.fetchNewsList(onSuccess: (success){
          print('News list data fetched successfully-> ${success.articles}');
        });
      },
      builder: (BuildContext context, NewsboardViewmodel model, Widget child){
        return model.busy
            ? Center(child: CircularProgressIndicator())
            : (model.newsList != null && model.newsList.articles.length >= 0)
            ? RefreshIndicator(key: refreshKey, onRefresh: refreshNewsList,child: NewsboardViewUi())
            : Container(color: Colors.red,);
      },
    );
  }

  @override
  NewsboardViewmodel initViewModel() {
    return NewsboardViewmodel(Provider.of(context));
  }

}

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

  NewsboardScreen() : super(){
    setRequiresLogin(false);
  }

  @override
  Widget buildBody() {

    return BaseWidget<NewsboardViewmodel>(
      viewModel: getViewModel(),
      onModelReady: (model){
        print('new model is ready');
      },
      builder: (BuildContext context, NewsboardViewmodel model, Widget child){
        return NewsboardViewUi();
      },
    );
  }

  @override
  NewsboardViewmodel initViewModel() {
    return NewsboardViewmodel(Provider.of(context));
  }
}

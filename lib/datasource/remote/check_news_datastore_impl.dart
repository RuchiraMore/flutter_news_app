import 'package:flutter_news_app/data/datasource/check_news_datasource.dart';
import 'package:flutter_news_app/data/models/check_news_datasource_model.dart';
import 'package:flutter_news_app/datasource/entity/app_news_list_entity.dart';
import 'package:flutter_news_app/datasource/remote/api/endpoints.dart';
import 'package:flutter_news_app/datasource/remote/api/request/check_news_request.dart';
import 'package:flutter_news_app/datasource/remote/api/response/check_news_response.dart';
import 'package:flutter_news_app/datasource/store/news_datastore.dart';
import 'package:flutter_news_app/presentation/base/newsboard_baseview.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/src/observables/observable.dart';

class CheckNewsDatasourceImpl extends CheckNewsDatasource {

  CheckNewsRequest checkNewsRequest;
  CheckNewsDatasourceImpl(this.checkNewsRequest);

  @override
  Observable<CheckNewsDatasourceModel> getNewsList() {
    return Observable.fromFuture(checkNewsRequest.apiGetNewsList(Parameter.COUNTRY, Parameter.API_KEY).then((response) {

      var newsResponse = CheckNewsResponse(response);
      print('Datasource news entity -> '+ newsResponse.toString());

      if (newsResponse.getErrors().length != 0) {
        throw NewsboardError(message: newsResponse.getErrors(),
        type: NewsboardErrorType.SERVER_ERROR_MESSAGE);
      }

      try{
        print('News response ->');
        return newsResponse.getData().first.mapToDomain;
      }
      catch (e) {
        throw NewsboardError(
          message: e.toString(),
          type: NewsboardErrorType.SERVER_ERROR_MESSAGE
        );
      }

    }));
  }

}
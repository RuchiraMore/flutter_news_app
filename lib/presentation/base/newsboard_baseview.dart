import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/dto/base_dto.dart';
import 'package:flutter_base_architecture/exception/base_error.dart';
import 'package:flutter_base_architecture/exception/base_error_parser.dart';
import 'package:flutter_base_architecture/ui/base_model_widget.dart';
import 'package:flutter_base_architecture/ui/base_statefulwidget.dart';
import 'package:flutter_base_architecture/viewmodels/base_view_model.dart';
import 'package:flutter_news_app/domain/entities/user.dart';

abstract class NewsboardBaseview<VM extends BaseViewModel> extends BaseStatefulWidget<VM> {}

abstract class NewsboardBaseState
<VM extends BaseViewModel,
T extends NewsboardBaseview<VM>>
    extends BaseStatefulScreen<VM, T, NewsboardErrorParser, BaseDto> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  String onBoardingRoutePath() {
    return '';
  }

  @override
  String widgetErrorMessage() {
    return 'There was an unexpected error. Please try again later';
  }

  @override
  String errorLogo() {
    return '';
  }

  @override
  Color scaffoldColor() {
    return Color(0xffD71717);
  }

  @override
  Color statusBarColor() {
    return Colors.black;
  }
}

class NewsboardError extends BaseError {
  NewsboardError({message, type, error})
      : super(message:message, type:type, error:error);
}

class NewsboardErrorType extends BaseErrorType {
  const NewsboardErrorType(value) : super(value);
  static const NewsboardErrorType SERVER_ERROR_MESSAGE = const NewsboardErrorType(6);
}

class NewsboardErrorParser extends BaseErrorParser {

  NewsboardErrorParser() : super();

  @override
  String parseError(BuildContext context, BaseError error){
    var errorMessage = super.parseError(context, error);
    if (errorMessage != null) {
      return errorMessage;
    }

    switch (error.type) {
      case NewsboardErrorType.SERVER_ERROR_MESSAGE:
        return error.message;
      default:
        return "There was an unexpected error. Please try again later";
        break;
    }
  }
}

abstract class NewsboardBaseModelWidget<VM>
    extends BaseModelWidget<VM, NewsboardErrorParser> {

}
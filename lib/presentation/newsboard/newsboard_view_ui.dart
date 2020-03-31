import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/constant/asset_icons.dart';
import 'package:flutter_news_app/presentation/base/newsboard_baseview.dart';
import 'package:flutter_news_app/presentation/newsboard/newsboard_viewmodel.dart';
import 'package:flutter_news_app/presentation/newsboardDetails/newsboard_details_view.dart';
import 'package:flutter_news_app/utils/content_scroll.dart';
import 'package:flutter_news_app/utils/date_class.dart';

class NewsboardViewUi extends NewsboardBaseModelWidget<NewsboardViewmodel> {

  BuildContext contextNewsList;
  final GlobalKey<RefreshIndicatorState> refreshKey = new GlobalKey<RefreshIndicatorState>();

  _newsSelector(int index, NewsboardViewmodel model) {

    print("navigating from Index--> $index");

    return AnimatedBuilder(
      animation: model.pageController,
      builder: (BuildContext context,Widget widget){

        double value = 1;
        if(model.pageController.position.haveDimensions) {
          value = model.pageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }

        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 270,//500.0,
            width: Curves.easeInOut.transform(value) * 400,//500.0,
            child: widget,
          ),
        );
      },

      child: GestureDetector(

        onTap: () => Navigator.push(
          contextNewsList,
          MaterialPageRoute(
              builder: (_) => NewsBoardDetailsView(
                indexTag: 'NewsTag-$index',
                newsDetails: model.newsList.articles[index],
              )
          )
      ),

        child: Stack(children: <Widget>[
          Center(
            child: Container(

              margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [(BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0.0,1.0),
                  blurRadius: 5.0,
                ))],
              ),

              ///Set Image to container
              child: Center(
                child: Hero(
                  tag: index,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.network(
                      model.newsList.articles[index].urlToImage,
                      fit: BoxFit.cover,
                      height: 500,
                      width: 500,
                    ),
//                  Image(
//                    image: AssetImage(model.newsList.articles[index].urlToImage),//"assets/images/breaking-news.jpg"
//                    height: 500,//250.0,
//                    width: 500,//300.0,
//                    fit: BoxFit.fill,
//                  ),
                  ),
                ),
              ),
            ),
          ),

          //set bookmark on top right
          Positioned(
            top: 30,
            right: 40,
            child: Container(
              height: 30,
              width: 30,
              child: IconButton(
                iconSize: 30.0,
                  icon: new Icon(
                    Icons.bookmark_border,
                    color: Colors.white,
                  ),
                  onPressed: (){
                    print("Bookmark icon tappeed");

                })
            ),
          ),

          ///set news Headline
          Positioned(
            left: 20,
            bottom: 90,
            child: Container(
//            color: Colors.lime,
              width: 280,
              child: Text(model.newsList.articles[index].title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),),
            ),
          ),

          //set Reporter information
          Positioned(
            left: 20,
            bottom: 40,
            child: Container(
//            color: Colors.amber,
              width: 280,
              child: Row(
                children: <Widget>[

                  ///set Reporter image
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Container(
                      child: CircleAvatar(
                        child: ClipOval(
                          child: Image.asset(
                            "assets/images/user_logo.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        radius: 20.0,
                      ),
                    ),
                  ),

                  ///for handling space
                  SizedBox(width: 10),

                  ///set Reporter name and news time
                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        Text(
                          model.newsList.articles[index].source.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                        ),

                        SizedBox(height: 2),

                        Container(
                          child: Row(
                            children: <Widget>[

                              Icon(
                                Icons.access_time,
                                color: Colors.white,
                                size: 20.0,
                              ),

//                            CircleAvatar(
//                              child: ClipOval(
//                                child: Image.asset(AssetIcons.time,
//                                  fit: BoxFit.contain,
//                                ),
//                              ),
//                              radius: 8.0,
//                            ),

                              SizedBox(width: 2),

                              Text(
                                DateClass.convertDateToTime(model.newsList.articles[index].publishedAt),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.0,
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],),
      ),
    );
  }

  @override
  Widget build(BuildContext context, model) {

    print('inside newsboard class ');

    contextNewsList = context;

    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 3,
        itemBuilder:(context, i) {

          if (i == 0) {
            ///First - Header View
            return Container(
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Top Headlines",
                          style: new TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          DateClass.todayDate(),
                          style: new TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.red,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      child: CircleAvatar(
                        child: ClipOval(
                          child: Image.asset(
                            AssetIcons.user_logo,
                            fit: BoxFit.contain,
                          ),
                        ),
                        radius: 25,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          else if (i == 1) {
            ///Second - News slider container view
            return Container(
              width: double.infinity,
              height: 300.0,
              child: PageView.builder(
                controller: model.pageController,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index){
                  return _newsSelector(index, model);
                },
              ),
            );
          }
          else if (i == 2) {
            //Third - Display all news list
            return ContentScroll(
              newsList: model.newsList.articles,
              title: ConstantsHeader.HeaderAllNews,
              subtitle: "Show more",
              imageHeight: 150.0,
              imageWidth: 500.0,
            );

//          return Container(
//            height: (model.newsList.articles.length * 100).toDouble(),
//            child:
//              ListView.builder(
//                  itemCount: model.newsList.articles.length,
//                  padding: const EdgeInsets.all(16.0),
//                  itemBuilder:(context, i) {
//                    return new Text(model.newsList.articles[i].title);
//                  }),
//          );
          }
        }

//        primary: true,
//        children: <Widget>[
//
//          ///First - Header View
//          new Container(
//            padding: const EdgeInsets.all(20),
//            color: Colors.white,
//            child: Row(
//              children: <Widget>[
//                Expanded(
//                  child: new Column(
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: <Widget>[
//                      Text(
//                        "Technology",
//                        style: new TextStyle(
//                          fontSize: 30,
//                          fontWeight: FontWeight.bold,
//                          color: Colors.black,
//                        ),
//                        textAlign: TextAlign.left,
//                      ),
//                      Text(
//                        DateClass.todayDate(),//"FRI 20 MARCH",
//                        style: new TextStyle(
//                          fontSize: 16,
//                          fontWeight: FontWeight.normal,
//                          color: Colors.red,
//                        ),
//                        textAlign: TextAlign.left,
//                      ),
//                    ],
//                  ),
//                ),
//                Padding(
//                  padding: const EdgeInsets.only(right: 10),
//                  child: Container(
//                    child: CircleAvatar(
//                      child: ClipOval(
//                        child: Image.asset(
//                          AssetIcons.user_logo,
//                          fit: BoxFit.contain,
//                        ),
//                      ),
//                      radius: 25,
//                    ),
//                  ),
//                ),
//              ],
//            ),
//          ),
//
//          ///Second - News slider container view
//          Container(
//            width: double.infinity,
//            height: 300.0,
//            child: PageView.builder(
//              controller: model.pageController,
//              itemCount: 5,
//              itemBuilder: (BuildContext context, int index){
//                return _movieSelector(index, model);
//              },
//            ),
//          ),
//
//          //Third - Display Popular list
////          ContentScroll(
////            images: myImgList,
////            title: ConstantsHeader.HeaderPopular,
////            subtitle: "Show more",
////            imageHeight: 150.0,
////            imageWidth: 500.0,
////          ),
//
//
//        ListView.builder(
//            itemCount: model.newsList.articles.length,
//            padding: const EdgeInsets.all(16.0),
//            itemBuilder:(context, i) {
//
//             return Text(model.newsList.articles[i].title,
//             style: TextStyle(
//               color: Colors.black
//             ),);
//         }),

//        _buildNewsList(model),

//        ],
      );
  }

//
//  Future<Null> refreshNewsList() {
//    print('refreshing news');
////    refreshKey.currentState.show(atTop: false);
//
//    setState((){
//      NewsboardViewUi();
//    });
////    return null;
//  }

}
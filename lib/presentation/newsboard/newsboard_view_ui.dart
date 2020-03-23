import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/constant/asset_icons.dart';
import 'package:flutter_news_app/presentation/base/newsboard_baseview.dart';
import 'package:flutter_news_app/presentation/newsboard/newsboard_viewmodel.dart';
import 'package:flutter_news_app/utils/content_scroll.dart';

class NewsboardViewUi extends NewsboardBaseModelWidget<NewsboardViewmodel> {

  var myImgList = ["assets/images/news.jpg","assets/images/news.jpg","assets/images/news.jpg"];

  _movieSelector(int index, NewsboardViewmodel model) {

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
            height: 500,//Curves.easeInOut.transform(value) * 270,//270.0,
            width: 500,//Curves.easeInOut.transform(value) * 400,//400.0,
            child: widget,
          ),
        );
      },

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
                  child: Image(
                    image: AssetImage("assets/images/breaking-news.jpg"),
                    height: 500,//250.0,
                    width: 500,//300.0,
                    fit: BoxFit.fill,
                  ),
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
            color: Colors.lime,
            width: 280,
            child: Text("Drones: A Bird's Eye View of Photographer",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),),
          ),
        ),

        //set Reporter information
        Positioned(
          left: 20,
          bottom: 40,
          child: Container(
            color: Colors.amber,
            width: 280,
            child: Row(
              children: <Widget>[

                ///set Reporter image
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Container(
                    child: CircleAvatar(
                      child: ClipOval(
                        child: Image.asset(AssetIcons.news,
                          fit: BoxFit.contain,
                        ),
                      ),
                      radius: 20.0,
                    ),
                  ),
                ),

                ///for handling space
                SizedBox(width: 10,),

                ///set Reporter name and news time
                Expanded(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Text(
                        "Jone Green",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 14.0,
                        ),
                      ),

                      Container(
                        child: Row(
                          children: <Widget>[

                            CircleAvatar(
                              child: ClipOval(
                                child: Image.asset(AssetIcons.news,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              radius: 8.0,
                            ),

                            Padding(
                              padding: EdgeInsets.only(left: 2),
                              child: Text(
                                "10 hours ago",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.0,
                                ),
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
    );
  }

  @override
  Widget build(BuildContext context, model) {

    print('inside newsboard class ');

    return Container(
      color: Colors.white,
      child: ListView(
        children: <Widget>[

              ///First - Header View
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: new Container(
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Technology",
                              style: new TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              "FRI 20 MARCH",
                              style: new TextStyle(
                                fontSize: 20,
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
                                  "assets/images/news_icon.png",
                                fit: BoxFit.contain,
                              ),
                            ),
                            radius: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              ///Second - News slider container view
              Container(
                width: double.infinity,
                height: 300.0,
                child: PageView.builder(
                  controller: model.pageController,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index){
                    return _movieSelector(index, model);
                  },
                ),
              ),

              //Third - Display Popular list
        ],
      ),
    );
  }
}

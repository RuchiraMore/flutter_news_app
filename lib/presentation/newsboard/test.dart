//class test {
//  fjie() {
//    return RefreshIndicator(
//
//      child: ListView.builder(
//          scrollDirection: Axis.vertical,
//          itemCount: 3,
//          itemBuilder:(context, i) {
//
//            if (i == 0) {
//              ///First - Header View
//              return Container(
//                padding: const EdgeInsets.all(20),
//                color: Colors.white,
//                child: Row(
//                  children: <Widget>[
//                    Expanded(
//                      child: new Column(
//                        crossAxisAlignment: CrossAxisAlignment.start,
//                        children: <Widget>[
//                          Text(
//                            "Top Headlines",
//                            style: new TextStyle(
//                              fontSize: 30,
//                              fontWeight: FontWeight.bold,
//                              color: Colors.black,
//                            ),
//                            textAlign: TextAlign.left,
//                          ),
//                          Text(
//                            DateClass.todayDate(),
//                            style: new TextStyle(
//                              fontSize: 16,
//                              fontWeight: FontWeight.normal,
//                              color: Colors.red,
//                            ),
//                            textAlign: TextAlign.left,
//                          ),
//                        ],
//                      ),
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.only(right: 10),
//                      child: Container(
//                        child: CircleAvatar(
//                          child: ClipOval(
//                            child: Image.asset(
//                              AssetIcons.user_logo,
//                              fit: BoxFit.contain,
//                            ),
//                          ),
//                          radius: 25,
//                        ),
//                      ),
//                    ),
//                  ],
//                ),
//              );
//            }
//            else if (i == 1) {
//              ///Second - News slider container view
//              return Container(
//                width: double.infinity,
//                height: 300.0,
//                child: PageView.builder(
//                  controller: model.pageController,
//                  itemCount: 5,
//                  itemBuilder: (BuildContext context, int index){
//                    return _newsSelector(index, model);
//                  },
//                ),
//              );
//            }
//            else if (i == 2) {
//              //Third - Display all news list
//              return ContentScroll(
//                newsList: model.newsList.articles,
//                title: ConstantsHeader.HeaderAllNews,
//                subtitle: "Show more",
//                imageHeight: 150.0,
//                imageWidth: 500.0,
//              );
//
////          return Container(
////            height: (model.newsList.articles.length * 100).toDouble(),
////            child:
////              ListView.builder(
////                  itemCount: model.newsList.articles.length,
////                  padding: const EdgeInsets.all(16.0),
////                  itemBuilder:(context, i) {
////                    return new Text(model.newsList.articles[i].title);
////                  }),
////          );
//            }
//          }
//
////        primary: true,
////        children: <Widget>[
////
////          ///First - Header View
////          new Container(
////            padding: const EdgeInsets.all(20),
////            color: Colors.white,
////            child: Row(
////              children: <Widget>[
////                Expanded(
////                  child: new Column(
////                    crossAxisAlignment: CrossAxisAlignment.start,
////                    children: <Widget>[
////                      Text(
////                        "Technology",
////                        style: new TextStyle(
////                          fontSize: 30,
////                          fontWeight: FontWeight.bold,
////                          color: Colors.black,
////                        ),
////                        textAlign: TextAlign.left,
////                      ),
////                      Text(
////                        DateClass.todayDate(),//"FRI 20 MARCH",
////                        style: new TextStyle(
////                          fontSize: 16,
////                          fontWeight: FontWeight.normal,
////                          color: Colors.red,
////                        ),
////                        textAlign: TextAlign.left,
////                      ),
////                    ],
////                  ),
////                ),
////                Padding(
////                  padding: const EdgeInsets.only(right: 10),
////                  child: Container(
////                    child: CircleAvatar(
////                      child: ClipOval(
////                        child: Image.asset(
////                          AssetIcons.user_logo,
////                          fit: BoxFit.contain,
////                        ),
////                      ),
////                      radius: 25,
////                    ),
////                  ),
////                ),
////              ],
////            ),
////          ),
////
////          ///Second - News slider container view
////          Container(
////            width: double.infinity,
////            height: 300.0,
////            child: PageView.builder(
////              controller: model.pageController,
////              itemCount: 5,
////              itemBuilder: (BuildContext context, int index){
////                return _movieSelector(index, model);
////              },
////            ),
////          ),
////
////          //Third - Display Popular list
//////          ContentScroll(
//////            images: myImgList,
//////            title: ConstantsHeader.HeaderPopular,
//////            subtitle: "Show more",
//////            imageHeight: 150.0,
//////            imageWidth: 500.0,
//////          ),
////
////
////        ListView.builder(
////            itemCount: model.newsList.articles.length,
////            padding: const EdgeInsets.all(16.0),
////            itemBuilder:(context, i) {
////
////             return Text(model.newsList.articles[i].title,
////             style: TextStyle(
////               color: Colors.black
////             ),);
////         }),
//
////        _buildNewsList(model),
//
////        ],
//      ),
//    );
//
//  }
//}
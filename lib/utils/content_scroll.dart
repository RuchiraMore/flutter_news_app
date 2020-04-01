import 'package:flutter/material.dart';
import 'package:flutter_news_app/constant/asset_icons.dart';
import 'package:flutter_news_app/datasource/entity/app_news_list_entity.dart';
import 'package:flutter_news_app/presentation/newsboardDetails/newsboard_details_view.dart';
import 'package:flutter_news_app/utils/date_class.dart';

class ContentScroll extends StatelessWidget {

  final List<Article> newsList;
//  final List<String> images;
//  final Image image;
  final String title;
  final String subtitle;
  final double imageHeight;
  final double imageWidth;

  ContentScroll({this.newsList,this.title,this.subtitle,this.imageHeight,this.imageWidth});

  @override
  Widget build(BuildContext context) {

    _displayNewsDetails(index){
      return Container(

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Padding(
              padding: EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FadeInImage.assetNetwork(
                  placeholder: AssetIcons.news_logo,
                  image: newsList[index].urlToImage,
                  fit: BoxFit.cover,
                  height: 100,
                  width: 100,
//                  child: Image.network(
//                    newsList[index].urlToImage,
//                    fit: BoxFit.cover,
//                    height: 100,
//                    width: 100,
//                  ),
                ),
              ),
            ),


            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10,top: 10),
                child: Column(
                  children: <Widget>[
                    Text(
                      newsList[index].title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        child: Row(
                          children: <Widget>[

                            Icon(
                              Icons.access_time,
                              color: Colors.black54,
                              size: 25.0,
                            ),

                            SizedBox(width: 2),
                            Text(
                              DateClass.convertDateToTime(newsList[index].publishedAt),
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal
                              ),
                            ),

                            SizedBox(width: 25),

                            Icon(
                              Icons.bookmark_border,
                              color: Colors.black54,
                              size: 25.0,
                            ),

                            SizedBox(width: 2),
                            Text(
                              "50",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal
                              ),
                            ),


                          ],
                        ),
                      ),
                    )

                  ],
                ),
              ),
            ),

          ],
        ),

      );
    }

    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,//w600,
                  ),
                ),
              ),

              GestureDetector(
                child: IconButton(
                    iconSize: 30.0,
                    icon: new Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black26,
                      size: 30.0,
                    ),
                    onPressed: (){
                      print("Bookmark icon tappeed");
                    }
                  ),
              ),
            ],
          ),
        ),

        SingleChildScrollView(
          physics: ScrollPhysics(),
//          height: imageHeight * newsList.length,//images.length,
          child: Column(
            children: <Widget>[
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 30.0),
//                scrollDirection: Axis.vertical,//horizontal,
                itemCount: newsList.length,//images.length,
                itemBuilder: (BuildContext context, int index){
                  return new GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) =>
                            NewsBoardDetailsView(
                              indexTag: 'NewsTag-$index',
                              newsDetails: newsList[index],
                            )
                        )
                    ),
                    child: _displayNewsDetails(index),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}


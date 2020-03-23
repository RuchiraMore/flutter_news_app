import 'package:flutter/material.dart';
import 'package:flutter_news_app/constant/asset_icons.dart';

class ContentScroll extends StatelessWidget {

  final List<String> images;
  final String title;
  final String subtitle;
  final double imageHeight;
  final double imageWidth;

  ContentScroll({this.images,this.title,this.subtitle,this.imageHeight,this.imageWidth});

  @override
  Widget build(BuildContext context) {

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

//              Padding(
//                padding: EdgeInsets.only(right: 10),
//                child: Text(
//                  subtitle,
//                  style: TextStyle(
//                    color: Colors.red,
//                    fontSize: 18.0,
//                    fontWeight: FontWeight.normal,//w600,
//                  ),
//                ),
//              ),

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

        Container(
          height: imageHeight * images.length,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            scrollDirection: Axis.vertical,//horizontal,
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index){
              return Container(

                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Padding(
                      padding: EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(
                          height: 100,
                          width: 100,
                          image: AssetImage("assets/images/breaking-news.jpg"),
                          fit: BoxFit.fill,),
                      ),
                    ),


                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10,top: 10),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Drones: A Bird's Eye View of Photographer",
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
                                      "2 days ago",
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
            },
          ),
        ),
      ],
    );
  }
}

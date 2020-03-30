import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_news_app/datasource/entity/app_news_list_entity.dart';
import 'package:flutter_news_app/utils/date_class.dart';
import 'package:flutter_news_app/utils/read_more_text.dart';

class NewsBoardDetailsView extends StatefulWidget{

  final Article newsDetails;

  final String indexTag;

  NewsBoardDetailsView({
    this.indexTag,
    this.newsDetails,
  });

  @override
  NewsboardDetailsScreen createState() {
    return NewsboardDetailsScreen();
  }
}

class NewsboardDetailsScreen extends State<NewsBoardDetailsView>{

  @override
  Widget build(BuildContext context){

    print(widget.newsDetails.title);

    double heightDevice = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,

        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.only(right: 8),
            icon: Icon(Icons.bookmark_border),
            iconSize: 30.0,
            color: Colors.black87,
            onPressed: () => print('favourite news details tapped.'),
          ),
        ],
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black87,
            ),
            onPressed: () => Navigator.pop(context)
        ),

      ),
      extendBodyBehindAppBar: true,

      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[

          Stack(
            children: <Widget>[

              //Top Header Image
              Container(
                height: heightDevice * 0.5,//400,
                child: Hero(
                  tag: widget.indexTag,
                  child: Image.network(
                    widget.newsDetails.urlToImage,
                    fit: BoxFit.cover,
//                    height: 400,
                  ),
                ),
              ),

              //News details card
            Padding(
                  padding: EdgeInsets.only(top: heightDevice * 0.4),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(30),
                      topRight: const Radius.circular(30),
                    ),
                    child: Container(
                      color: Colors.white,
                      height: heightDevice * 0.6,//heightDevice - 300,

                      child: Column(
                        children: <Widget>[

                          Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Text(
                              widget.newsDetails.title,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),

                          Row(
                            children: <Widget>[
                              ///set Reporter image
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Container(
                                  child: CircleAvatar(
                                    child: ClipOval(
                                      child: Image.asset(
                                        "assets/images/user_logo.png",
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    radius: 25.0,
                                  ),
                                ),
                              ),

                              ///for handling space
                              SizedBox(width: 10),

                              ///set Reporter name and news time
                              Expanded(
                                child: new Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[

                                    Text(
                                      widget.newsDetails.source.name,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[

                                      Icon(
                                        Icons.access_time,
                                        color: Colors.black54,
                                        size: 25.0,
                                      ),

                                      SizedBox(width: 2),

                                      Text(
                                        DateClass.convertDateToTime(widget.newsDetails.publishedAt),
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 18.0,
                                        ),
                                      ),

                                      SizedBox(width: 30),

                                      Icon(
                                        Icons.bookmark_border,
                                        color: Colors.black54,
                                        size: 25.0,
                                      ),

                                      Text(
                                        '50',
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Expanded(
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: EdgeInsets.only(left: 20,right: 20),
                                child: ReadMoreText(
                                  widget.newsDetails.description,
                                  trimLines: 2,
                                  colorClickableText: Colors.pink,
                                  trimMode: TrimMode.Line,
                                  trimCollapsedText: '...Read more',
                                  trimExpandedText: ' Read less',
                                ),

//                        child: Text(
//                              widget.newsDetails.description,
//                              style: TextStyle(
//                                color: Colors.black87,
//                                fontSize: 16,
//                              ),
//                            ),

                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

            ],
          ),
        ],
      ),
    );

  }
}


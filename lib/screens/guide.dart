import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class guide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget imageSlider = new Container(
      height: 300,
      child: Carousel(
        boxFit: BoxFit.fill,
        images: [
          AssetImage('assets/image1.jpg'),
          AssetImage('assets/image2.png'),
          AssetImage('assets/image3.png'),
          AssetImage('assets/image4.png'),
        ],
        autoplay: true,
        autoplayDuration: Duration(seconds: 5),
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotBgColor: Colors.green[400].withOpacity(0.5),
        indicatorBgPadding: 10,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: Column(
//          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                imageSlider,
              ],
            ),
            SizedBox(height: 12,),
            Container(
              margin: EdgeInsets.fromLTRB(20, 23, 20, 8),
              height: 112,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          new Image.asset(
                            'assets/wash.png',
                            width: 73,
                            height: 73,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 45,),
                          Text(
                            'Wash your hand',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 8, 20, 8),
              height: 112,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          new Image.asset(
                            'assets/contact.png',
                            width: 73,
                            height: 73,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 45,),
                          Text(
                            'Avoid close contact',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 8, 20, 8),
              height: 112,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          new Image.asset(
                            'assets/clean.png',
                            width: 73,
                            height: 73,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 45,),
                          Text(
                            'Clean and disinfect',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

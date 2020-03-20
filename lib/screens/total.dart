import 'package:covidtracker/services/total_corona.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:covidtracker/services/total_corona.dart';
import 'package:intl/intl.dart';

class totalCorona extends StatefulWidget {
  @override
  _totalCoronaState createState() => _totalCoronaState();
}

class _totalCoronaState extends State<totalCorona> {

  TotalCorona coro = new TotalCorona();
  String text;

  final formatter = new NumberFormat("###,###");

  Future getData() async{
     await coro.getData();
  }
//

  Widget _homeData(){
    return Column(
      children: <Widget>[
        SizedBox(height: 91,),
        Container(
          margin: EdgeInsets.fromLTRB(26, 8, 26, 8),
          height: 150,

          width: 400,
          child: Card(
            color: Colors.red[200],
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      new Image.asset(
                        'assets/earth.png',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 35,),
                      Text(
                          'Corona Virus Cases',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12,),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 90,),
                      Text(
                        'Number: ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                       coro.cases ?? '',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(26, 8, 26, 8),
          height: 150,
          width: 400,
          child: Card(
            color: Colors.deepOrangeAccent[100],
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      new Image.asset(
                        'assets/earth.png',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 35,),
                      Text(
                        'Corona Virus Deaths',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12,),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 90,),
                      Text(
                        'Number: ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        coro.deaths ?? '',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(26, 8, 26, 8),
          height: 150,
          width: 400,
          child: Card(
            color: Colors.green[200],
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      new Image.asset(
                        'assets/earth.png',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 35,),
                      Text(
                        'Corona Virus Recovered',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12,),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 90,),
                      Text(
                        'Number: ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        coro.recovered ?? '',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

Map data = {};

  @override
  Widget build(BuildContext context) {

    return Scaffold (
      backgroundColor: Colors.grey[200],
      appBar: AppBar (
        backgroundColor: Colors.green[400],
        title: Text ('Global Information'),
      ),
      body: Column(
        children: <Widget>[
          FutureBuilder(
            future: getData(),
            builder: (context, AsyncSnapshot snapshot) {
                return _homeData();
            }
          ),
        ],
      )
    );
  }
}

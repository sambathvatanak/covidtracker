import 'package:covidtracker/services/total_corona.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:covidtracker/services/total_corona.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class totalCorona extends StatefulWidget {
  @override
  _totalCoronaState createState() => _totalCoronaState();
}

class _totalCoronaState extends State<totalCorona> {

  TotalCorona coro = new TotalCorona();
  String text;
  double result = 0;

  Future getData() async{
     await coro.getData();
  }

  findPercentage(String total, String data){
    double totalcase = double.parse(total);
    double datacase = double.parse(data);
    result = (datacase * 100) / totalcase;
    return result.toStringAsFixed(2);
  }

  findProgressPercentage(){
    double total = result;
    total = result / 100;
    return total;
  }
//

  Widget _homeData(){
    return Column(
      children: <Widget>[
        SizedBox(height: 91,),
        Container(
          margin: EdgeInsets.fromLTRB(26, 8, 26, 8),
          height: 153,
          width: 400,
          child: Card(
            color: Colors.indigo[200],
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
                      SizedBox(width: 38,),
                      Text(
                        'Total Cases',
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
          height: 153,
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
                      SizedBox(width: 38,),
                      Text(
                        'Total Deaths',
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
          height: 153,
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
                      SizedBox(width: 38,),
                      Text(
                        'Total Recovered',
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
//      body: Container(
//        decoration: BoxDecoration(
//        gradient: LinearGradient(
//          colors: [Colors.deepOrangeAccent, Colors.green],
//          begin: Alignment.topLeft,
//          end: Alignment.bottomRight
//        )),
        body: Column(
          children: <Widget>[
            FutureBuilder(
              future: getData(),
              builder: (context, AsyncSnapshot snapshot) {
                  return _homeData();
              }
            ),
          ],
        ),
    );
  }
}

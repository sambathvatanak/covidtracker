import 'package:covidtracker/screens/details/detailData.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class detailCountry extends StatefulWidget {

  String country; String cases; String todayCases;
  String deaths; String todayDeaths; String recovered;
  String active; String critical;

  detailCountry({this.country,this.cases,this.todayCases,this.deaths,this.todayDeaths,this.recovered,this.active,this.critical,});
  @override
  _detailCountryState createState() => _detailCountryState();
}

class _detailCountryState extends State<detailCountry> {

  final formatter = new NumberFormat("###,###");
  double result = 0;
  
  Widget _deviderHorizontal(){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Divider(
        thickness: 3,
      ),
    );
  }

  Widget _deviderVertical(){
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: VerticalDivider(
        thickness: 3,
      ),
    );
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

  Widget _showData(){
    return Column(
      children: <Widget>[
        Container(
          width: 400,
          height: 120,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(26),
            child: Column(
              children: <Widget>[
                Card(
                  color: Colors.grey[200],
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Recovered',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.indigo[900],
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      formatter.format(double.parse(widget.recovered)),
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                    Text(
                                      "(" + findPercentage(widget.cases, widget.recovered) + "%)",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.indigo[900],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                new LinearPercentIndicator(
                                  width: 112.0,
                                  lineHeight: 8.0,
                                  percent: findProgressPercentage(),
                                  backgroundColor: Colors.grey,
                                  progressColor: Colors.green,
                                ),
                              ],
                            ),
                            SizedBox(width: 5,),
                            _deviderVertical(),
                            SizedBox(width: 5,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Deaths',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.indigo[900],
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      formatter.format(double.parse(widget.deaths)),
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                    Text(
                                      "(" + findPercentage(widget.cases, widget.deaths) + "%)",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.indigo[900],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                new LinearPercentIndicator(
                                  width: 112.0,
                                  lineHeight: 8.0,
                                  percent: findProgressPercentage(),
                                  backgroundColor: Colors.grey,
                                  progressColor: Colors.red,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
  Widget _showDataUpdate(){
    return Column(
      children: <Widget>[
        Container(
          width: 400,
          height: 165,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(26),
            child: Column(
              children: <Widget>[
                Card(
                  color: Colors.grey[200],
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Last Update',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo[900],
                          ),
                        ),
                        _deviderHorizontal(),
                        Row(
                          children: <Widget>[
                            SizedBox(width: 20,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Today Cases',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.indigo[900],
                                  ),
                                ),
                                SizedBox(height: 3,),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      formatter.format(double.parse(widget.todayCases)),
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.indigo[900],
                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                    Text(
                                      "(" + findPercentage(widget.cases, widget.todayCases) + "%)",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.indigo[900],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8,),
                                new LinearPercentIndicator(
                                  width: 112.0,
                                  lineHeight: 8.0,
                                  percent: findProgressPercentage(),
                                  backgroundColor: Colors.grey,
                                  progressColor: Colors.blue,
                                ),
                              ],
                            ),
                            SizedBox(width: 35,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Today Deaths',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.indigo[900],
                                  ),
                                ),
                                SizedBox(height: 3,),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      formatter.format(double.parse(widget.todayDeaths)),
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                    Text(
                                      "(" + findPercentage(widget.cases, widget.todayDeaths) + "%)",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.indigo[900],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8,),
                                new LinearPercentIndicator(
                                  width: 112.0,
                                  lineHeight: 8.0,
                                  percent: findProgressPercentage(),
                                  backgroundColor: Colors.grey,
                                  progressColor: Colors.red,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
  Widget _showDataActive(){
    return Column(
      children: <Widget>[
        Container(
          width: 400,
          height: 230,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(26),
            child: Column(
              children: <Widget>[
                Card(
                  color: Colors.grey[200],
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Active Cases',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo[900],
                          ),
                        ),
                        _deviderHorizontal(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 3,),
                            Row(
                              children: <Widget>[
                                Text(
                                  formatter.format(double.parse(widget.active)),
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.indigo[900],
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Text(
                                  "(" + findPercentage(widget.cases, widget.active) + "%)",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.indigo[900],
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Currently',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.indigo[400],
                                      ),
                                    ),
                                    Text(
                                      'Infected Patients',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.indigo[400],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 8,),
                            new LinearPercentIndicator(
                              width: 112.0,
                              lineHeight: 8.0,
                              percent: findProgressPercentage(),
                              backgroundColor: Colors.grey,
                              progressColor: Colors.blue,
                            ),
                          ],
                        ),
                        SizedBox(height: 15,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  formatter.format(double.parse(widget.critical)),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.indigo[900],
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Text(
                                  "(" + findPercentage(widget.active, widget.critical) + "%)",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.indigo[900],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 3,),
                            Text(
                              'Critical Cases',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo[900],
                              ),
                            ),
                            SizedBox(height: 8),
                            new LinearPercentIndicator(
                              width: 112.0,
                              lineHeight: 8.0,
                              percent: findProgressPercentage(),
                              backgroundColor: Colors.grey,
                              progressColor: Colors.blue,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
  Widget _showDetailDataCountry(){
    return Column(
      children: <Widget>[
        Container(
          width: 400,
          height: 60,
          child: Card(
            color: Colors.grey[200],
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => detailData(
                  country: widget.country,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(19, 0, 5, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                            'Tap to see more detail of each days',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.indigo[900],
                            ),
                        ),
                        SizedBox(width: 28,),
                        IconButton(
                          icon: Icon(Icons.arrow_forward),
                          iconSize: 26,
                          color: Colors.red[900],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: Text('Country Details'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.country,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo[900],
                    ),
                  ),
                ],
              ),
              _deviderHorizontal(),
              Row(
                children: <Widget>[
                  Text(
                    'Infected',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo[900],
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    formatter.format(double.parse(widget.cases)),
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo[900],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              _showDetailDataCountry(),
              _showData(),
              _showDataUpdate(),
              SizedBox(height: 5,),
              _showDataActive(),
            ],
          ),
        ),
      ),
    );

  }
}

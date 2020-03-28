import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class detailData extends StatefulWidget {

  String country;

  detailData({this.country});

  @override
  _detailDataState createState() => _detailDataState();
}

class _detailDataState extends State<detailData> {

  List data;

  Future<List<dynamic>> fetchCorona() async {
    String country = widget.country;
    var url = 'https://pomber.github.io/covid19/timeseries.json';
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

//    setState(() {
      var extractdata = json.decode(response.body);
      data = extractdata[country];
      print(data);
//    });
    return data;
  }

  void initState(){
    this.fetchCorona();
  }

  Widget _listview(index){
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 380,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Card(
            color: Colors.grey[100],
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    data[index]['date'].toString(),
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo[900],
                    ),
                  ),
                  SizedBox(height: 8,),
                  Row(
                    children: <Widget>[
                      Text('Confirmed: ',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.indigo[800],
                        ),
                      ),
                      Text(
                        data[index]['confirmed'].toString(),
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(width: 10,),
                      Text('Deaths: ',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.indigo[800],
                        ),
                      ),
                      Text(
                        data[index]['deaths'].toString(),
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(width: 10,),
                      Text('Recovered: ',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.indigo[800],
                        ),
                      ),
                      Text(
                        data[index]['recovered'].toString(),
                        style: TextStyle(
                          fontSize: 13,
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
      ),
    );
  }

  Widget _noData(){
    return Container(
      child: Center(
        child: Text(
          'No data available for this country',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[400],
          title: Text(widget.country),
        ),
        body: FutureBuilder(
          future: fetchCorona(),
          builder: (context, AsyncSnapshot snapshot){
              if(!snapshot.hasData){
              return Center(child: CircularProgressIndicator());
              }else{
                return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: data == null? 0: data.length,
                    itemBuilder: (BuildContext context, index){
                  return _listview (index);
                  },
                );
              }
          },
          ),
//        ),
    );
  }
}

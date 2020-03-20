import 'package:flutter/material.dart';
import 'package:covidtracker/services/world_corona.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {

  List<Corona> _corona = List<Corona>();
  List<Corona> _coronaForDisplay = List<Corona>();
  bool isSearching = false;
  var listdata;

  RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  Function mathFunc = (Match match) => '${match[1]},';

  Future<List<Corona>> fetchCorona() async {
    var url = 'https://coronavirus-19-api.herokuapp.com/countries';
    var response = await http.get(url);
    var coronas = List<Corona>();
    if(response.statusCode == 200){
        var coronasJson = json.decode(response.body);
        for (var coronaJson in coronasJson){
          coronas.add(Corona.fromJson(coronaJson));
        }
    }
    return coronas;
  }

  void initState(){
    fetchCorona().then((value){
      setState(() {
        _corona.addAll(value);
        _coronaForDisplay = _corona;
      });
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scrollbar(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.green[400],
          title: !isSearching? Text('Country')
               : TextField(
                  autofocus: true,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: "search by country...",
                      icon: Icon(Icons.search, color: Colors.white,),
                      hintStyle: TextStyle(color: Colors.white),
                   ),
                  onChanged: (text){
                    text = text.toLowerCase();
                    setState(() {
                      _coronaForDisplay = _corona.where((corona){
                        var coronaCountry = corona.country.toLowerCase();
                        return coronaCountry.contains(text);
                      }).toList();
                    });
                  },
                ),
          actions: <Widget>[
            isSearching ?
            IconButton(
              icon: Icon(Icons.cancel),
              onPressed: () {
                setState(() {
                  this.isSearching = false;
                  _coronaForDisplay = _corona.where((corona){
                    var coronaCountry = corona.country.toLowerCase();
                    return coronaCountry.contains('');
                  }).toList();
                });
              },
            )
                : IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                setState(() {
                  this.isSearching = true;
                });
              },
            )
          ],
        ),
        body: Center(
          child: FutureBuilder(
            future: fetchCorona(),
            builder: (context, AsyncSnapshot snapshot){
              if(!snapshot.hasData){
                return Center(child: CircularProgressIndicator());
              }else{
                return Container(
                  child: new ListView.builder(
                    itemCount: _coronaForDisplay.length,
                    itemBuilder: (BuildContext context,index){
                      return _listItem(index);
                    },
                  ),
                );
              }
            },

          ),
        ),
      ),
    );
  }

  _listItem(index){
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: Colors.grey[100],
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                _coronaForDisplay[index].country,
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w800,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 5,),
              Row(
                children: <Widget>[
                  Text('Cases: ',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(_coronaForDisplay[index].cases.replaceAllMapped(reg, mathFunc),
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.red,
                    ),
                  ),
                  SizedBox(width: 30,),
                  Text('Today Cases: ',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  Text(_coronaForDisplay[index].todayCases.replaceAllMapped(reg, mathFunc),
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
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  Text(_coronaForDisplay[index].deaths.replaceAllMapped(reg, mathFunc),
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3,),
              Row(
                children: <Widget>[
                  Text('Today Deaths: ',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  Text(_coronaForDisplay[index].todayDeaths.replaceAllMapped(reg, mathFunc),
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.red,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text('Recoverd: ',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  Text(_coronaForDisplay[index].recovered.replaceAllMapped(reg, mathFunc),
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.red,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3,),
              Row(
                children: <Widget>[
                  Text('Active: ',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  Text(_coronaForDisplay[index].active.replaceAllMapped(reg, mathFunc),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(width: 30,),
                  Text('Critical: ',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  Text(_coronaForDisplay[index].critical.replaceAllMapped(reg, mathFunc),
                    style: TextStyle(
                        fontSize: 14,
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
    );
  }

}

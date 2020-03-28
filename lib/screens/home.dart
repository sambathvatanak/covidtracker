import 'package:covidtracker/screens/details/detailCountry.dart';
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
//           if(coronaJson['country'] == "Cambodia"){
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
        backgroundColor: Colors.grey[300],
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
                  child: RefreshIndicator(
                    child: new ListView.builder(
                      itemCount: _coronaForDisplay.length,
                      itemBuilder: (BuildContext context,index){
                        return _listItem(index);
                      },
                    ),
                    onRefresh: fetchCorona,
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
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => detailCountry(
            country: _coronaForDisplay[index].country,
            cases: _coronaForDisplay[index].cases,
            todayCases: _coronaForDisplay[index].todayCases,
            deaths: _coronaForDisplay[index].deaths,
            todayDeaths: _coronaForDisplay[index].todayDeaths,
            recovered: _coronaForDisplay[index].recovered,
            active: _coronaForDisplay[index].active,
            critical: _coronaForDisplay[index].critical,
            ),
          ),
        );
      },
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: 390,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Card(
              color: Colors.grey[100],
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          _coronaForDisplay[index].country,
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo[900],
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_forward),
                          iconSize: 26,
                          color: Colors.red[900],
                        )
                      ],
                    ),
                    SizedBox(height: 8,),
                    Row(
                      children: <Widget>[
                        Text('Cases: ',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            color: Colors.indigo[800],
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
                        Text('Recovered: ',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.indigo[800],
                          ),
                        ),
                        Text(_coronaForDisplay[index].recovered.replaceAllMapped(reg, mathFunc),
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
                              fontWeight: FontWeight.w500,
                              color: Colors.indigo[800],
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
                        Text('Today Cases: ',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.indigo[800],
                          ),
                        ),
                        Text(_coronaForDisplay[index].todayCases.replaceAllMapped(reg, mathFunc),
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
                              fontWeight: FontWeight.w500,
                              color: Colors.indigo[800],
                          ),
                        ),
                        Text(_coronaForDisplay[index].active.replaceAllMapped(reg, mathFunc),
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(width: 30,),
                        Text('Critical: ',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            color: Colors.indigo[800],
                          ),
                        ),
                        Text(_coronaForDisplay[index].critical.replaceAllMapped(reg, mathFunc),
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
      ),
    );
  }

}

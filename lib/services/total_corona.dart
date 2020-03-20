import 'package:http/http.dart';
import 'dart:convert';

class TotalCorona{
  String cases;
  String deaths;
  String recovered;

  TotalCorona({this.cases,this.deaths,this.recovered});

  Future<List<TotalCorona>> getData() async {
    try{
      Response response = await get('https://coronavirus-19-api.herokuapp.com/all');
      Map data = jsonDecode(response.body);
      cases = data['cases'].toString();
      deaths = data['deaths'].toString();
      recovered = data['recovered'].toString();
//      print(cases);
//      print(deaths);
//      print(recovered);
    }catch(e){
      print(e.toString());
    }
  }

}
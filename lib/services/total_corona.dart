import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class TotalCorona{
  String cases;
  String deaths;
  String recovered;
  final formatter = new NumberFormat("###,###");

  TotalCorona({this.cases,this.deaths,this.recovered});

  Future<List<TotalCorona>> getData() async {
    try{
      Response response = await get('https://coronavirus-19-api.herokuapp.com/all');
      Map data = jsonDecode(response.body);
      String Cases = data['cases'].toString();
      String Deaths = data['deaths'].toString();
      String Recovered = data['recovered'].toString();

      cases = formatter.format(int.parse(Cases));
      deaths = formatter.format(int.parse(Deaths));
      recovered = formatter.format(int.parse(Recovered));
//      print(cases);
//      print(deaths);
//      print(recovered);
    }catch(e){
      print(e.toString());
    }
  }

}
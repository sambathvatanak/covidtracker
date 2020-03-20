
class Corona{
  String country;
  String cases;
  String todayCases;
  String deaths;
  String todayDeaths;
  String recovered;
  String active;
  String critical;

  Corona(
    this.country,
    this.cases,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
    this.active,
    this.critical,
  );

  // ignore: missing_return
   Corona.fromJson(Map<String, dynamic> json){
      country = json['country'].toString();
      cases = json['cases'].toString();
      todayCases = json['todayCases'].toString();
      deaths = json['deaths'].toString();
      todayDeaths = json['todayDeaths'].toString();
      recovered = json['recovered'].toString();
      active = json['active'].toString();
      critical = json['critical'].toString();
  }
}
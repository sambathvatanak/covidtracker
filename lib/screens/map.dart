import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class map extends StatefulWidget {
  @override
  _mapState createState() => _mapState();
}

class _mapState extends State<map> {
  LatLng latlng = LatLng(
      11.547041, 104.880565,
  );
  Iterable markers = [];
  int num = 0;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    try {
      final response =
      await http.get('https://coronavirus-tracker-api.herokuapp.com/v2/locations');

      final int statusCode = response.statusCode;
      if (statusCode == 201 || statusCode == 200) {
        Map responseBody = json.decode(response.body);
        List results = responseBody["locations"];

        Iterable _markers = Iterable.generate(240, (index) {
          Map result = results[index];
          Map location = result["coordinates"];
         // print(result['coordinates']);
          LatLng latLngMarker = LatLng(double.parse(location["latitude"]), double.parse(location["longitude"]));
          return Marker(markerId: MarkerId("marker$index"),position: latLngMarker);
        });
        print(_markers);
        setState(() {
          markers = _markers;
          //print(markers);
        });
      } else {
        throw Exception('Error');
      }
    } catch(e) {
      print("Error" + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: GoogleMap(
                markers: Set.from(
                  markers,
                ),
                initialCameraPosition: CameraPosition(target: latlng, zoom: 4.0),
                mapType: MapType.normal,
                zoomGesturesEnabled: true,
                onMapCreated: (GoogleMapController controller) {},
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:location/location.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LocationPage(),
    );
  }
}

class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  var lat;
  var long;
  var locationData;
  Location location = Location();
  getLocation() async {
    locationData = await location.getLocation();
    this.setState(() {
      lat = locationData.latitude;
      long = locationData.longitude;
    });
  }
  @override
  void initState() {
    super.initState();
    getLocation();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location Page"),
      ),
      body: Center(
        child: lat == null && long == null ? Column(
          mainAxisAlignment: MainAxisAlignment.center ,
          children: <Widget>[
            CircularProgressIndicator(),
            Text("Loading.....")
          ],
        ): Text("Latitude $lat  Longitude $long"),
      ),
    );
  }
}
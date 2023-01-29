import 'package:flutter/material.dart';
import '../services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            getLocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    double latitude = location.latitude;
    double longitude = location.longitude;
    // print(
    // 'latitude: $location.latitude | longitude: $location.longitude'); // this doesn't work for some reason. Later learnt that await is needed for $location when doing to call.
    print('latitude: $latitude | longitude: $longitude');
  }

  void getData() async {
    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=57&lon=-2.15&appid=c25ea5f04e364669cad0caf7c4eb9045'));
    // print(response.body);
    int responseCode = response.statusCode;
    if (responseCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      String weatherID = decodedData['weather'][0]['main'];
      String city = decodedData['name'];
      double temp = decodedData['main']['temp'] - 273;

      debugPrint('$city is $weatherID today at a temperature of $temp');
    } else {
      debugPrint(responseCode.toString());
    }
  }
}

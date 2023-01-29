import 'package:flutter/material.dart';
import 'package:clima/screens/loading_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}

// String weatherID = weatherData['weather'][0]['main'];
// String city = weatherData['name'];
// double temp = weatherData['main']['temp'] - 273;
import 'package:flutter/material.dart';
import 'package:weather_app/services/weather.dart';
import 'dart:convert';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key, this.locationWeather});

  final locationWeather;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late double temperature;
  late int condition;
  late String cityName;

  void updateUI(dynamic weatherData) {
    dynamic data = jsonDecode(weatherData);
    temperature = data["main"]["temp"];
    condition = data["weather"][0]["id"];
    cityName = data["name"];
    // Creating the Weather Model
    WeatherModel weatherModer = WeatherModel();
    String weatherIcon = weatherModer.getWeatherIcon(condition);
    String weatherMessage = weatherModer.getMessage(temperature);
    print(temperature);
    print(condition);
    print(cityName);
    print(weatherIcon);
    print(weatherMessage);
  }

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text("Location screen.."),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, const Color.fromARGB(255, 32, 29, 29)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          // image: DecorationImage(
          //   image: AssetImage("assets/images/wallpaper.jpg"),
          //   fit: BoxFit.fill,
          // ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: Text("Soon the data will be available"),
            ),
            Expanded(
              child: Text("This place will for cards"),
            ),
          ],
        ),
      ),
    );
  }
}

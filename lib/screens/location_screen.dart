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
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/wallpaper.jpg"),
          ),
        ),
      ),
    );
  }
}

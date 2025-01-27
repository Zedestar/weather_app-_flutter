import 'package:flutter/material.dart';
import 'dart:convert';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key, this.locationWeather});

  final locationWeather;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late dynamic temperature;
  late dynamic condition;
  late dynamic cityName;

  void updateUI(dynamic weatherData) {
    dynamic data = jsonDecode(weatherData);
    temperature = data["main"]["temp"];
    condition = data["weather"][0]["main"];
    cityName = data["name"];
    print(temperature);
    print(condition);
    print(cityName);
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

import 'package:flutter/material.dart';

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
    temperature = weatherData["main"]["temp"]; // Double type
    condition = weatherData["weather"][0]["id"]; // Integer type
    cityName = weatherData["name"]; // String type

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

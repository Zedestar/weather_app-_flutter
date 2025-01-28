import 'package:flutter/material.dart';
import 'package:weather_app/services/weather.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

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
  late String weatherIcon;
  late String weatherMessage;

  DateTime presentDate = DateTime.now();
  late String formattedDate;

  void updateUI(dynamic weatherData) {
    dynamic data = jsonDecode(weatherData);
    temperature = data["main"]["temp"];
    condition = data["weather"][0]["id"];
    cityName = data["name"];
    // Creating the Weather Model
    WeatherModel weatherModer = WeatherModel();
    weatherIcon = weatherModer.getWeatherIcon(condition);
    weatherMessage = weatherModer.getMessage(temperature);
    print(temperature);
    print(condition);
    print(cityName);
    print(weatherIcon);
    print(weatherMessage);
  }

  @override
  void initState() {
    super.initState();
    formattedDate = DateFormat('yyyy-MM-dd').format(presentDate);
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
          // gradient: LinearGradient(
          //   colors: [Colors.black, const Color.fromARGB(255, 32, 29, 29)],
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          // ),
          image: DecorationImage(
            image: AssetImage("assets/images/wallpaper.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(200, 33, 149, 243),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    Text(
                      cityName,
                      style: TextStyle(fontSize: 40),
                    ),
                    Text(
                      presentDate.toString(),
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      weatherIcon,
                      style: TextStyle(fontSize: 150),
                    ),
                    Row()
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(200, 33, 149, 243),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/screens/location_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String apiKey = "733595407526d7280b04fd76a9fb03d4";
  double latitude = 0.0;
  double longitude = 0.0;
  bool isLoading = true;
  var weatherData;

  @override
  void initState() {
    super.initState();
    _setLocationWeatherData();
  }

  void _setLocationWeatherData() async {
    Location location = Location();
    await location.getCurrentLocation();
    setState(() {
      latitude = location.getCurrentLatitude();
      longitude = location.getCurrentLongitude();
    });
    NetworkHelper networkHelper = NetworkHelper(
      Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey",
      ),
    );
    var data = await networkHelper.fetchWeatherData();
    setState(() {
      isLoading = false;
      weatherData = data;
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(
            locationWeather: weatherData,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // _setLocationWeatherData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text("Loading screen.."),
        ),
      ),
      body: isLoading
          ? Center(
              child: SpinKitRotatingCircle(
                color: Colors.blue,
                size: 200.0,
              ),
            )
          : Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isLoading = true;
                  });
                  _setLocationWeatherData();
                },
                child: Text("Loading button"),
              ),
            ),
    );
  }
}

// double temperature = jsonDecode(data)["main"]["temp"];
//         int conditionNumber = jsonDecode(data)["weather"][0]["id"];
//         String cityName = jsonDecode(data)["name"];
//         print(temperature);
//         print(conditionNumber);
//         print(cityName);


   // // data = jsonDecode(data);
    // print(latitude);
    // print(longitude);
    // print(data);
    // // print(data);

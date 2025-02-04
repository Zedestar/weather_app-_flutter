import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/components/card_with_two_text.dart';
import 'package:weather_app/components/dialog_box.dart';
import 'package:weather_app/services/networking.dart';
import 'package:weather_app/services/weather.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:weather_app/utilities/constants.dart';
import 'dart:io';

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
  late String countryCode;
  late double windSpeed;
  late int humidity;
  late String weatherIcon;
  late String weatherMessage;
  late String locationName;
  String apiKey = "733595407526d7280b04fd76a9fb03d4";
  bool LoadingState = false;

  DateTime presentDate = DateTime.now();
  late String formattedDate;

  void updateUI(dynamic weatherData) {
    dynamic data = jsonDecode(weatherData);
    temperature = double.parse(
      (data["main"]["temp"] - 273.17).toStringAsFixed(2),
    );
    condition = data["weather"][0]["id"];
    humidity = data["main"]["humidity"];
    cityName = data["name"];
    countryCode = data["sys"]["country"];
    windSpeed = data["wind"]["speed"];
    // Creating the Weather Model
    WeatherModel weatherModer = WeatherModel();
    weatherIcon = weatherModer.getWeatherIcon(condition);
    weatherMessage = weatherModer.getMessage(temperature);
    print(temperature);
    print(condition);
    print(cityName);
    print(weatherIcon);
    print(weatherMessage);
    print(data);
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
      // resizeToAvoidBottomInset: true,
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
              flex: 5,
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(200, 33, 149, 243),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: LoadingState
                    ? loadingSpiking
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "$cityName $countryCode",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            presentDate.toString(),
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            weatherIcon,
                            style: TextStyle(fontSize: 150),
                          ),
                          Text(
                            weatherMessage,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Row(
                            children: [
                              CardWithTwoText(
                                weatherElement: "temp",
                                weatherAmount: temperature,
                                weatherUnit: "°C",
                              ),
                              CardWithTwoText(
                                  weatherElement: "humid",
                                  weatherAmount: humidity.toDouble(),
                                  weatherUnit: "%"),
                              CardWithTwoText(
                                weatherElement: "wind",
                                weatherAmount: windSpeed,
                                weatherUnit: "km/h",
                              )
                            ],
                          )
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
                child: Column(
                  children: [
                    TextField(
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.text,
                      decoration: kTextFieldInputDecorationsSettings,
                      onChanged: (value) {
                        locationName = value;
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          LoadingState = true;
                        });
                        // Fetch weather data for entered location
                        try {
                          NetworkHelper placeWeather = NetworkHelper(
                            Uri.parse(
                                "https://api.openweathermap.org/data/2.5/weather?q=$locationName&appid=$apiKey"),
                          );

                          placeWeather.fetchWeatherData().then((weatherData) {
                            setState(() {
                              LoadingState = false;
                            });
                            if (placeWeather.getStatusCode() == 200) {
                              setState(() {
                                updateUI(weatherData);
                              });
                            } else if (placeWeather.getStatusCode() == 404) {
                              setState(
                                () {
                                  showCustomDialog(
                                    context: context,
                                    title: "Error",
                                    content: "Location is not available",
                                  );
                                },
                              );
                            } else if (placeWeather.getStatusCode() == 408) {
                              setState(() {
                                showCustomDialog(
                                  context: context,
                                  title: "Error",
                                  content:
                                      "Timeout. \nCheck your internet connection",
                                );
                              });
                            }
                          });
                        } on SocketException {
                          setState(() {
                            showCustomDialog(
                              context: context,
                              title: "Error",
                              content:
                                  "Network error. \nCheck your internet connection",
                            );
                          });
                        } catch (e) {
                          print("There is an error, $e");
                        }
                      },
                      child: Text(
                        "Get Weather",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const kTextFieldInputDecorationsSettings = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
    size: 40.0,
  ),
  hintText: "Search place by name",
  hintStyle: TextStyle(color: Colors.black),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);

final elevatedButtonBottomStyles = ElevatedButton.styleFrom(
  elevation: 6,
  minimumSize: Size(150, 50),
  padding: const EdgeInsets.all(10),
  backgroundColor: Colors.blue,
);

// The spinking of the loading button
const loadingSpiking = Center(
  child: SpinKitRotatingCircle(
    color: Colors.blue,
    size: 200.0,
  ),
);

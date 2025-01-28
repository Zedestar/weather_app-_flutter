import 'package:flutter/material.dart';

class CardWithTwoText extends StatelessWidget {
  const CardWithTwoText(
      {super.key, required this.weatherElement, required this.weatherAmount});
  final String weatherElement;
  final double weatherAmount;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              weatherElement,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              '$weatherAmount°C',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

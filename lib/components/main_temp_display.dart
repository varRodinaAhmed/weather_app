import 'package:flutter/material.dart';

class mainTempDisplay extends StatelessWidget {
  double mainTemp;
  double minTemp;
  double maxTemp;
  String city;
  String country;
  mainTempDisplay({
    super.key,
    required this.mainTemp,
    required this.minTemp,
    required this.maxTemp,
    required this.city,
    required this.country,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${mainTemp.round().toString()}°",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 55,
              ),
            ),
            SizedBox(width: 8),
            Column(
              children: [
                Text(
                  'H : ${maxTemp.round()}°',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                Text(
                  'L : ${minTemp.round()}°',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.location_on, color: Colors.white),
            Text(
              '$city, $country',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class titleAndSubtitle extends StatelessWidget {
  const titleAndSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          """Weather\nForecast""",
          style: TextStyle(
            height: 1.1,

            fontSize: 45,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 13),
        Text(
          """Find the weather\nanywhere in the world""",

          style: TextStyle(fontSize: 15, color: Colors.white, height: 1.1),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:weather_app/components/grid_item.dart';

class popularCities extends StatelessWidget {
  popularCities({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            'Popular cities',

            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 123, 159, 212),
            ),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          itemCount: 4,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: 15),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 8,
            childAspectRatio: 2.75,
          ),
          itemBuilder: (context, index) {
            return gridItem(index: index);
          },
        ),
      ],
    );
  }
}

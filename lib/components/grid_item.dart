import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';

class gridItem extends StatelessWidget {
  final cities = ["Cairo", "London", "Paris", "Dubai"];
  final icons = [
    Icons.landscape,
    Icons.location_city,
    Icons.location_city,
    Icons.location_city,
  ];
  int index;
  gridItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final cubit = context.read<WeatherCubit>();
        cubit.getWeather(searchCity: cities[index]);
      },
      child: Container(
        height: 20,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              spreadRadius: 2,
              offset: Offset(0, 8),
            ),
          ],
          color: Color.fromARGB(255, 254, 249, 249),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icons[index], color: Color(0xffA9C8F5)),
            SizedBox(width: 8),
            Text(cities[index]),
          ],
        ),
      ),
    );
  }
}

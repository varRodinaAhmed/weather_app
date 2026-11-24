import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:weather_app/components/background.dart';
import 'package:weather_app/components/grid_item.dart';
import 'package:weather_app/components/popular_cities.dart';
import 'package:weather_app/components/search_field.dart';
import 'package:weather_app/components/title_and_subtitle.dart';
import 'package:weather_app/const/backgroundData.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/cubits/weather_cubit/weather_states.dart';
import 'package:weather_app/models/today_weather_model.dart';
import 'package:weather_app/services/weatherService.dart';
import 'package:weather_app/views/weather_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: Builder(
        builder: (context) {
          final cubit = context.read<WeatherCubit>();
          return BlocListener<WeatherCubit, WeatherStates>(
            listener: (context, state) {
              if (state is WeatherSuccessState) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WeatherView(weather: cubit.weather),
                  ),
                );
              } else if (state is WeatherFailureState) {
                Get.snackbar('Error', state.err);
              }
            },
            child: Scaffold(
              body: BlocBuilder<WeatherCubit, WeatherStates>(
                builder: (context, state) {
                  if (state is WeatherLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return Stack(
                    children: [
                      background(imageUrl: Backgrounddata.homeBackground),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 70,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                titleAndSubtitle(),
                                SizedBox(height: 250),
                                searchField(
                                  searchFun: (String searchCity) async {
                                    cubit.getWeather(searchCity: searchCity);
                                  },
                                ),

                                popularCities(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

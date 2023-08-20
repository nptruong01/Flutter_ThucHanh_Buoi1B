import 'package:flutter/material.dart';
import 'package:open_weather/src/constants/app_colors.dart';
import 'package:open_weather/src/features/weather/presentation/city_search_box.dart';
import 'package:open_weather/src/features/weather/presentation/current_weather.dart';
import 'package:open_weather/src/features/weather/presentation/hourly_weather.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key, required this.city}) : super(key: key);
  final String city;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.primaryColor, AppColors.accentColor],
          ),
        ),
        child: const SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40), // Add more space at the top
              CitySearchBox(),
              SizedBox(
                  height:
                      150), // Add more space between CitySearchBox and the weather widgets
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Center(
                          child: CurrentWeather(),
                        ),
                      ),
                      SizedBox(
                          width:
                              24), // Add more space between CurrentWeather and HourlyWeather
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              HourlyWeather(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

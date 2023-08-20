import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_weather/src/constants/app_colors.dart';
import 'package:open_weather/src/features/weather/application/providers.dart';

class CitySearchBox extends ConsumerStatefulWidget {
  const CitySearchBox({Key? key}) : super(key: key);

  @override
  ConsumerState<CitySearchBox> createState() => _CitySearchRowState();
}

class _CitySearchRowState extends ConsumerState<CitySearchBox> {
  static const _radius = 30.0;
  final List<String> cities = [
    'New York',
    'Los Angeles',
    'London',
    'Paris',
    'Tokyo',
    'Sydney',
    'Ho Chi Minh City',
    'Berlin',
    'Moscow',
    'Beijing',
    'Rome',
    'Seoul',
    'Cairo',
    'Mumbai',
    'Istanbul',
    'Bangkok',
    'Singapore',
    'Dubai',
    'Toronto',
    'Barcelona',
    'Vienna',
    'Amsterdam',
    'Prague',
    'Budapest',
    'Cape Town',
    'Rio de Janeiro',
    // Add more cities here
  ];

  List<String> _sortedCities() {
    final sortedCities = List.of(cities);
    sortedCities.remove('Ho Chi Minh City');
    sortedCities.sort();
    sortedCities.insert(0, 'Ho Chi Minh City');
    sortedCities.insert(1, 'Hanoi');
    // sortedCities.insert(2, 'Phu Yen');
    return sortedCities;
  }

  int _visibleCityCount = 3;

  @override
  Widget build(BuildContext context) {
    final sortedCities = _sortedCities();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _visibleCityCount,
                itemBuilder: (context, index) {
                  final city = sortedCities[index];
                  return GestureDetector(
                    onTap: () {
                      ref.read(cityProvider.notifier).state = city;
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                            index == 0 ? _radius : 0.0,
                          ),
                          bottomLeft: Radius.circular(
                            index == 0 ? _radius : 0.0,
                          ),
                          topRight: Radius.circular(
                            index == _visibleCityCount - 1 ? _radius : 0.0,
                          ),
                          bottomRight: Radius.circular(
                            index == _visibleCityCount - 1 ? _radius : 0.0,
                          ),
                        ),
                      ),
                      child: Text(city,
                          style: const TextStyle(color: Colors.black)),
                    ),
                  );
                },
              ),
            ),
          ),
          InkWell(
            child: Container(
              height: 50,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: AppColors.accentColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(_radius),
                  bottomRight: Radius.circular(_radius),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  'More',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
            onTap: () {
              setState(() {
                _visibleCityCount =
                    (_visibleCityCount + 3).clamp(0, sortedCities.length);
              });
            },
          ),
        ],
      ),
    );
  }
}

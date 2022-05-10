import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:weather_apps/providers/weather_provider.dart';
import 'package:weather_apps/ui/ui_widgets.dart';

import '../models/weather_model.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final WeatherProvider _weatherProvider = WeatherProvider();
  Position? _location;

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  @override
  void dispose() {
    _location = null;
    super.dispose();
  }

  getCurrentLocation() async {
    _location = await _weatherProvider.getLocation();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: SafeArea(
        child: _location == null
            ? const Center(child: CircularProgressIndicator())
            : StreamBuilder<Weather>(
                stream: _weatherProvider.getWeatherInfo(
                  latitude: _location!.latitude,
                  longitude: _location!.longitude,
                ),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting &&
                      snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.data == null) {
                    return const Center(child: Text('No data'));
                  }

                  return Column(
                    children: [
                      const SizedBox(height: 35),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.location_on),
                          FutureBuilder<List<Placemark>>(
                              future: placemarkFromCoordinates(
                                  _location!.latitude, _location!.longitude),
                              builder: (context, snapshot) {
                                final data = snapshot.data ?? [];
                                return Text(
                                  data.isEmpty ? 'N/A' : '${data[0].name}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                );
                              }),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(DateFormat('E dd MMM yyyy').format(
                          DateTime.fromMillisecondsSinceEpoch(
                              snapshot.data!.dt * 1000))),
                      const SizedBox(height: 56),
                      Card(
                        elevation: 2,
                        shadowColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${snapshot.data!.main!.temp}°',
                                    style: const TextStyle(
                                      fontSize: 65,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'Real Feel: ${snapshot.data!.main!.feelsLike}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.network(
                                    'http://openweathermap.org/img/wn/${snapshot.data!.weather!.first.icon}@2x.png',
                                    width: 65,
                                    height: 65,
                                  ),
                                  Text(
                                    '${snapshot.data!.weather!.first.description}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        child: Column(
                          children: [
                            WeatherDetailLabel(
                              label: 'Humidity',
                              value: '${snapshot.data!.main!.humidity}%',
                            ),
                            const SizedBox(height: 15),
                            const WeatherDetailLabel(
                              label: 'UV index',
                              value: '',
                            ),
                            const SizedBox(height: 15),
                            WeatherDetailLabel(
                              label: 'Wind Speed',
                              value: '${snapshot.data!.wind!.speed} mph',
                            ),
                            const SizedBox(height: 15),
                            const WeatherDetailLabel(
                              label: 'Rain probability',
                              value: 'N/A%',
                            ),
                            const SizedBox(height: 15),
                            WeatherDetailLabel(
                              label: 'Pressure',
                              value: '${snapshot.data!.main!.pressure} Pa',
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                }),
      ),
    );
  }
}

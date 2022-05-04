import 'dart:math';

import 'package:flutter/material.dart';
import 'package:weather_apps/ui/home_view.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F8F9),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on),
                const Text(
                  'CAPE COAST',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text("${DateTime.now()}"),
              SizedBox(height: 10,),

            Card(
              elevation: 10,
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(27.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          " 27°",
                          style: TextStyle(
                              fontSize: 62, fontWeight: FontWeight.w600),
                        ),
                        Text("Real feel: 27°"),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.sunny_snowing,
                          size: 65,
                        ),
                        Text(
                          "Sunny",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                children: [
                  WeatherDetailsLabel(
                    label: "Humidity",
                    value: "${Random().nextInt(100)}%",
                  ),
                  SizedBox(height: 16),
                  WeatherDetailsLabel(
                    label: "UV Index",
                    value: "",
                  ),
                  SizedBox(height: 16),
                  WeatherDetailsLabel(
                    label: "Wind",
                    value: "${Random().nextInt(100)}km/h",
                  ),
                  SizedBox(height: 16),
                  WeatherDetailsLabel(
                    label: "Pressure",
                    value: "${Random().nextInt(100)}hPa",
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}

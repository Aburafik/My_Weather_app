import 'dart:math';

import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Row(
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
          Column(
            children: [
              WeatherDetailsLabel()
            ],
          )
        ]),
      ),
    );
  }
}

class WeatherDetailsLabel extends StatelessWidget {
  const WeatherDetailsLabel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Humidity",style: TextStyle(fontWeight: FontWeight.w600),),
        Text("${Random().nextInt(100)}%"),
      ],
    );
  }
}

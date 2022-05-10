import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:weather_apps/ui/homepage.dart';
import 'package:weather_apps/ui/location_view.dart';
import 'package:weather_apps/ui/news_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var _selectedTab = 0;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = i;
    });
  }

  List<Widget> screens =const [
    Homepage(),
    LatestNews(),
    LocationView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8F9),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: IndexedStack(
          children: screens,
          index: _selectedTab,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: DotNavigationBar(
          marginR: const EdgeInsets.symmetric(vertical: 10),
          currentIndex: _selectedTab,
          selectedItemColor: const Color(0xff637DFF),
          unselectedItemColor: const Color(0xffA6ABB2),
          onTap: _handleIndexChanged,
          items: [
            DotNavigationBarItem(
              icon: Column(
                children: const [Icon(Icons.sunny_snowing), Text("Weather")],
              ),
            ),

            /// Likes
            DotNavigationBarItem(
              icon: Column(
                children: const [Icon(Icons.newspaper),Text("News")],
              ),
            ),

            /// Search
            DotNavigationBarItem(
              icon: Column(
                children: const [Icon(Icons.location_on), Text("Places")],
              ),
            ),

            /// Profile
          ],
        ),
      ),
    );
  }
}

class WeatherDetailsLabel extends StatelessWidget {
  const WeatherDetailsLabel({
    Key? key,
    this.label,
    this.value,
  }) : super(key: key);
  final String? label;
  final String? value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label!,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        Text("$value"),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:weather_apps/models/news_model.dart';

import '../repositories/news_repository.dart';

Color commonColor = const Color(0xff808791);

class LocationView extends StatefulWidget {
  const LocationView({Key? key}) : super(key: key);

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  Future<List<GenerateTraveler>>? data;
  List<GenerateTraveler>? getData;
  @override
  void initState() {
    Network network = Network();
    data = network.getReportData().then((value) {
      setState(() {
        getData = value;
      });
      return value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle headerTitleStyle = const TextStyle(
        fontSize: 20,
        color: const Color(0xff212D3F),
        fontWeight: FontWeight.bold);

    return Scaffold(
      body: FutureBuilder<List<GenerateTraveler>>(
        future: data,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: ((context, index) {
                Logger().d(getData![index].day!);
                return Card(
                  child: Column(
                    children: [
                      Text(getData![index].children![index].name!),
                      Text(getData![index].day!.toString()),
                    ],
                  ),
                );
              }),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
    // return Scaffold(
    //   body: SafeArea(
    //     child: Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 10),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           SizedBox(height: MediaQuery.of(context).size.height * 0.06),
    //           Card(
    //               color: const Color(0xffF7F7F7),
    //               shape: RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.circular(15),
    //               ),
    //               elevation: 15,
    //               child: Padding(
    //                 padding: const EdgeInsets.all(15),
    //                 child: Row(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     const Card(
    //                       color: const Color(0xffDBDBDB),
    //                       elevation: 20,
    //                       child: SizedBox(
    //                         height: 120,
    //                         width: 120,
    //                       ),
    //                     ),
    //                     const SizedBox(
    //                       width: 10,
    //                     ),
    //                     SizedBox(
    //                       height: 120,
    //                       child: Column(
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         children: [
    //                           Text(
    //                             "UserName",
    //                             style: headerTitleStyle,
    //                           ),
    //                           const Padding(
    //                             padding: const EdgeInsets.only(top: 10),
    //                             child: Text("City"),
    //                           ),
    //                           const Spacer(),
    //                           SizedBox(
    //                             width: MediaQuery.of(context).size.width / 2.5,
    //                             child: Material(
    //                               shape: RoundedRectangleBorder(
    //                                 side: const BorderSide(color: Colors.red),
    //                                 borderRadius: BorderRadius.circular(10),
    //                               ),
    //                               child: const Padding(
    //                                 padding: const EdgeInsets.all(10),
    //                                 child: Center(child: Text("LOGOUT")),
    //                               ),
    //                             ),
    //                           )
    //                         ],
    //                       ),
    //                     )
    //                   ],
    //                 ),
    //               )),
    //           Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    //             SizedBox(height: MediaQuery.of(context).size.height * 0.06),
    //             Text("SETTINGS", style: headerTitleStyle),
    //             const SettingsTiles(
    //               titleTile: "Temperature",
    //             ),
    //             const SettingsTiles(
    //               titleTile: "Wind Speeed mph",
    //             ),
    //             const SettingsTiles(
    //               titleTile: "24-HOUR Time",
    //             ),
    //           ]),
    //           SizedBox(height: MediaQuery.of(context).size.height * 0.06),
    //           Text("ABOUT", style: headerTitleStyle),
    //           Padding(
    //             padding: const EdgeInsets.symmetric(vertical: 10),
    //             child: aboutDetails(title: "Version 1.0.0"),
    //           ),
    //           aboutDetails(title: "Author: CitizenRaf Pretech-Cape Coast"),
    //           aboutDetails(title: "Weather App infor: OpenWeatherMap"),
    //           aboutDetails(title: "News App infor: NewsAPI"),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }

  Text aboutDetails({String? title}) => Text(
        title!,
        style: TextStyle(fontSize: 17, color: commonColor),
      );
}

class SettingsTiles extends StatelessWidget {
  const SettingsTiles({Key? key, this.titleTile}) : super(key: key);
  final String? titleTile;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          titleTile!,
          style: TextStyle(color: commonColor),
        ),
        SizedBox(
            width: 30,
            child: Switch(
                inactiveTrackColor: const Color(0xff53B476),
                activeTrackColor: Colors.red,
                value: false,
                onChanged: (value) {}))
      ],
    );
  }
}

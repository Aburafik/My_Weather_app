import 'dart:convert';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:weather_apps/app_keys.dart';

import '../models/news_model.dart';

//This us the network class to help connect the app to the api
class Network {
  final String url =
      "http://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=$newsApIKey";
  Future<News> getNews() async {
    final response = await get(Uri.parse(url));
    //Checking to see if we are really getting the data from our api
    if (response.statusCode == 200) {
      //ok

      return News.fromJson(json.decode(response.body));
    } else {
      throw Exception('Cant Load data');
    }
  }

// YOUR API NETWORKING CODE HERE
  Future<List<GenerateTraveler>> getReportData() async {
    String url = "YOUR API URL";
    String basicAuth = "YOUR API KEY";

    final response =
        await get(Uri.parse(url), headers: {'authorization': basicAuth});
    //Checking to see if we are really getting the data from our api
    if (response.statusCode == 200) {
      //ok

      dynamic data = jsonDecode(response.body);
    
      Logger().d(data);
      return generateTravelerFromJson(response.body);
    } else {
      throw Exception('Cant Load data');
    }
  }
}

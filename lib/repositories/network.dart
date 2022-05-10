import 'dart:convert';
import 'package:http/http.dart';

import '../models/news_model.dart';

//This us the network class to help connect the app to the api
class Network {
  final String url =
      "http://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=54d9339efa2d4e419e61ff0f8158b581";
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
}

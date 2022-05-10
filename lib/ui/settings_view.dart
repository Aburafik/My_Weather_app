import 'package:flutter/material.dart';
import 'package:weather_apps/models/news_model.dart';
import 'package:weather_apps/repositories/network.dart';
import 'package:weather_apps/ui/ui_widgets.dart';

class LatestNews extends StatefulWidget {
  @override
  _LatestNewsState createState() => _LatestNewsState();
}

class _LatestNewsState extends State<LatestNews> {
  //Creating a future variable of Our news class
  Future<News>? news;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Network network = Network();
    news = network.getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: news,
            builder: (context, AsyncSnapshot<News> snapshots) {
              if (snapshots.hasData) {
                return Center(
                  child: ListView.builder(
                    itemCount: snapshots.data!.articles!.length,
                    itemBuilder: (context, index) {
                      return articlesContent(context, snapshots, index);
                    },
                  ),
                );
              } else {
                return const Center(
                  child:  CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}

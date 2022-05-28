import 'package:flutter/material.dart';
import 'package:weather_apps/models/news_model.dart';
import 'package:weather_apps/repositories/news_repository.dart';
import 'package:weather_apps/ui/ui_widgets.dart';

class LatestNews extends StatefulWidget {
  const LatestNews({Key? key}) : super(key: key);

  @override
  _LatestNewsState createState() => _LatestNewsState();
}

class _LatestNewsState extends State<LatestNews> {
  //Creating a future variable of Our news class
  Future<News>? news;
  Future? data;

  @override
  void initState() {
    super.initState();
    Network network = Network();
    news = network.getNews();
    // data=network.getReportData();
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
                      return newsCard(context, snapshots, index);
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

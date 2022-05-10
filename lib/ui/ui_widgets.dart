import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/news_model.dart';

Widget articlesContent(
    BuildContext context, AsyncSnapshot<News> snapshots, int index) {
  var article = snapshots.data!.articles![index];
  TextStyle textStyle =
      Theme.of(context).textTheme.headline6!.copyWith(fontSize: 20);
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Card(
      elevation: 5,
      child: Column(
        children: [
          Image.network(article.urlToImage!),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  article.title!,
                  style: textStyle.copyWith(fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  article.description!,
                  style: textStyle.copyWith(color: Colors.grey, fontSize: 17),
                ),
                Row(
                  children: [
                    Text('Source: '),
                    Text(article.source!.name!),
                  ],
                ),
                Row(
                  children: [
                    Text('Author: '),
                    Text(article.author!),
                  ],
                ),
                InkWell(
                    child: Text(
                      article.url!,
                      style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          fontSize: 16),
                    ),
                    onTap: () {
                      launch(article.url!);
                    })
              ],
            ),
          )
        ],
      ),
    ),
  );
}

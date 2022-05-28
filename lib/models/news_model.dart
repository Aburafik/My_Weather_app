import 'dart:convert';

class News {
  String? status;
  int? totalResults;
  List<Articles>? articles;

  News({this.status, this.totalResults, this.articles});

  News.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = <Articles>[];
      json['articles'].forEach((v) {
        articles!.add(new Articles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['totalResults'] = this.totalResults;
    if (this.articles != null) {
      data['articles'] = this.articles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Articles {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Articles(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  Articles.fromJson(Map<String, dynamic> json) {
    source =
        json['source'] != null ? new Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.source != null) {
      data['source'] = this.source!.toJson();
    }
    data['author'] = this.author;
    data['title'] = this.title;
    data['description'] = this.description;
    data['url'] = this.url;
    data['urlToImage'] = this.urlToImage;
    data['publishedAt'] = this.publishedAt;
    data['content'] = this.content;
    return data;
  }
}

class Source {
  String? id;
  String? name;

  Source({this.id, this.name});

  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}



// To parse this JSON data, do
//
//     final generateTraveler = generateTravelerFromJson(jsonString);

/// YOUR API MODEL CODE HERE

List<GenerateTraveler> generateTravelerFromJson(String str) => List<GenerateTraveler>.from(json.decode(str).map((x) => GenerateTraveler.fromJson(x))).toList();

String generateTravelerToJson(List<GenerateTraveler> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GenerateTraveler {
    GenerateTraveler({
        this.day,
        this.children,
    });

    DateTime? day;
    List<Child>? children;

    factory GenerateTraveler.fromJson(Map<String, dynamic> json) => GenerateTraveler(
        day: DateTime.parse(json["day"]),
        children: List<Child>.from(json["children"].map((x) => Child.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "day": "${day!.year.toString().padLeft(4, '0')}-${day!.month.toString().padLeft(2, '0')}-${day!.day.toString().padLeft(2, '0')}",
        "children": List<dynamic>.from(children!.map((x) => x.toJson())),
    };
}

class Child {
    Child({
        this.id,
        this.name,
        this.arrival,
        this.departure,
    });

    int? id;
    String ?name;
    DateTime? arrival;
    dynamic departure;

    factory Child.fromJson(Map<String, dynamic> json) => Child(
        id: json["id"],
        name: json["name"],
        arrival: DateTime.parse(json["arrival"]),
        departure: json["departure"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "arrival": arrival!.toIso8601String(),
        "departure": departure,
    };
}

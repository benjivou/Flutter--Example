import 'dart:convert';

import 'package:app/model/source.dart';

/// News Buckets retrieve from the Api
class News {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  News(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  factory News.fromJson(Map<String, dynamic> json) => News(
        source: Source.fromJson(json['source']),
        author: json['author'] as String?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        url: json['url'] as String?,
        urlToImage: json['urlToImage'] as String?,
        publishedAt: json['publishedAt'] as String?,
        content: json['content'] as String?,
      );

  List<News> newsFromJson(String str) =>
      List<News>.from(json.decode(str).map((x) => News.fromJson(x)));
}

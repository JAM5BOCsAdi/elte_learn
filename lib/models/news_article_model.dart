// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Source {
  String id;
  String name;

  Source({
    required this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(id: json['id'], name: json['name']);
  }
}

class NewsArticleModel {
  final Source source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String imageUrl;
  final String publishedAt;
  final String content;

  NewsArticleModel({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.imageUrl,
    required this.publishedAt,
    required this.content,
  });

  factory NewsArticleModel.fromJson(Map<String, dynamic> json) {
    return NewsArticleModel(
      source: Source.fromJson(json['source']),
      author: json['author'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      imageUrl: json['imageUrl'] as String,
      publishedAt: json['publishedAt'] as String,
      content: json['content'] as String,
    );
  }
}
// {
// "status": "ok",
// "totalResults": 30,
// -"articles": [
// -{
  // -"source": {
  // "id": null,
  // "name": "Portfolio.hu"
  // },
  // "author": "Portfolio.hu",
  // "title": "A kormány fellazítja az akkumulátorgyárakra vonatkozó szabályozást - Portfolio",
  // "description": "Szerdán tette közzé a Külgazdasági és Külügyminisztérium azt a jogszabálytervezetet, amely kivonja a nemzetgazdasági célból kiemelt beruházásokat a területrendezési terv hatálya alól. A szabályozást a már folyamatban lévő ügyekre is alkalmazni kell, két eleme…",
  // "url": "https://www.portfolio.hu/gazdasag/20230202/a-kormany-fellazitja-az-akkumulatorgyarakra-vonatkozo-szabalyozast-594452",
  // "urlToImage": "https://pcdn.hu/articles/images-xl/r/a/k/raktarak-ipari-park-503156.jpg",
  // "publishedAt": "2023-02-02T10:02:00Z",
  // "content": "A kormány honlapján társadalmi egyeztetésre bocsátotta a Külgazdasági és Külügyminisztérium egyes beruházásokkal összefügg hatósági ügyek kormányrendeletek módosítását, amely az egyes nemzetgazdasági… [+2180 chars]"
  // },
// ]
// }
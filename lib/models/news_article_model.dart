// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Source {
  String id;
  String name;

  Source({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory Source.fromMap(Map<String, dynamic> map) {
    return Source(
      id: map['id'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Source.fromJson(String source) => Source.fromMap(json.decode(source) as Map<String, dynamic>);
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'source': source,
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'imageUrl': imageUrl,
      'publishedAt': publishedAt,
      'content': content,
    };
  }

  factory NewsArticleModel.fromMap(Map<String, dynamic> map) {
    return NewsArticleModel(
      source: map['source'],
      author: map['author'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      url: map['url'] as String,
      imageUrl: map['urlToImage'] as String,
      publishedAt: map['publishedAt'] as String,
      content: map['content'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsArticleModel.fromJson(String source) => NewsArticleModel.fromMap(json.decode(source) as Map<String, dynamic>);
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
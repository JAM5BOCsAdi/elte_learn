// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NewsArticle {
  final String title;
  final String content;
  final String imageUrl;

  NewsArticle({required this.title, required this.content, required this.imageUrl});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'content': content,
      'imageUrl': imageUrl,
    };
  }

  factory NewsArticle.fromMap(Map<String, dynamic> map) {
    return NewsArticle(
      title: map['title'] as String,
      content: map['content'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsArticle.fromJson(String source) => NewsArticle.fromMap(json.decode(source) as Map<String, dynamic>);
}

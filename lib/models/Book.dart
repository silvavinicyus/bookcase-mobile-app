import 'dart:convert';

import 'package:flutter/foundation.dart';

class Book {
  String id;
  String title;
  String author;      
  String genre;
  String publisher;
  String pages;
  Book({
    @required this.id,
    @required this.title,
    @required this.author,
    @required this.genre,
    @required this.publisher,
    @required this.pages,
  });
  // bool read;
    

  Book copyWith({
    String id,
    String title,
    String author,
    String genre,
    String publisher,
    String pages,
  }) {
    return Book(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      genre: genre ?? this.genre,
      publisher: publisher ?? this.publisher,
      pages: pages ?? this.pages,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'genre': genre,
      'publisher': publisher,
      'pages': pages,
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'],
      title: map['title'],
      author: map['author'],
      genre: map['genre'],
      publisher: map['publisher'],
      pages: map['pages'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Book.fromJson(String source) => Book.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Book(id: $id, title: $title, author: $author, genre: $genre, publisher: $publisher, pages: $pages)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Book &&
      other.id == id &&
      other.title == title &&
      other.author == author &&
      other.genre == genre &&
      other.publisher == publisher &&
      other.pages == pages;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      author.hashCode ^
      genre.hashCode ^
      publisher.hashCode ^
      pages.hashCode;
  }
}

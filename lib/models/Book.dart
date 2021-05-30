import 'dart:convert';

import 'package:flutter/foundation.dart';

class Book {
  String id;
  String title;
  String author;      
  String genre;
  String publisher;
  String pages;
  bool read;
  Book({
    @required this.id,
    @required this.title,
    @required this.author,
    @required this.genre,
    @required this.publisher,
    @required this.pages,
    @required this.read,
  });

  Book copyWith({
    String id,
    String title,
    String author,
    String genre,
    String publisher,
    String pages,
    bool read,
  }) {
    return Book(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      genre: genre ?? this.genre,
      publisher: publisher ?? this.publisher,
      pages: pages ?? this.pages,
      read: read ?? this.read,
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
      'read': read,
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
      read: map['read'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Book.fromJson(String source) => Book.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Book(id: $id, title: $title, author: $author, genre: $genre, publisher: $publisher, pages: $pages, read: $read)';
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
      other.pages == pages &&
      other.read == read;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      author.hashCode ^
      genre.hashCode ^
      publisher.hashCode ^
      pages.hashCode ^
      read.hashCode;
  }
}

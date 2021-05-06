import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todlist/models/Book.dart';

class BookController extends ChangeNotifier{
  
  BookController(){
    this.getBooks();
  }

  final books = ValueNotifier<List<Book>>([]);  
  final dio = Dio(
    BaseOptions(
      baseUrl: "http://10.0.2.2:3333",
    ),
  );

  final title = TextEditingController();
  final author = TextEditingController();
  final genre = TextEditingController();
  final publisher = TextEditingController();
  final pages = TextEditingController();
  // final read = TextEditingController();

  String get getTitle => title.text;
  String get getAuthor => author.text;
  String get getGenre => genre.text;
  String get getPublisher => publisher.text;
  String get getPages => pages.text;
  // bool get getRead => read.text as bool;

  void setTitle(String title) {
    this.title.text = title;
  }

  void setAuthor(String author) {
    this.author.text = author;
  }

  void setGenre(String genre) {
    this.genre.text = genre;
  }

  void setPublisher(String publisher) {
    this.publisher.text = publisher;
  }

  void setPages(String pages){
    this.pages.text = pages;
  }  

  clearFields(){
    this.title.clear();
    this.author.clear();
    this.genre.clear();
    this.publisher.clear();
    this.pages.clear();
  }

  Future<List<Book>> getBooks() async {
    try{
      final response = ((await dio.get('/books')).data as List).map((e) => Book.fromMap(e)).toList();    
            
      books.value = response;

      return response;

    } catch(err) {
      print(err);
      return List.empty();
    }
  }

  Future<void> deleteBooks(String id) async {
    await dio.delete('/books/$id');

    books.value.removeWhere((element) => element.id == id);
    
    books.notifyListeners();
  }

  Future<Book> addBook() async {
    final book = Book.fromMap(
      (await dio.post('/books', data: {      
        "title": getTitle,
        "author": getAuthor,
        "genre": getGenre,
        "publisher": getPublisher,
        "pages": getPages,
        "read": false
      }
    )).data );

    books.value.add(book);

    books.notifyListeners();   

    return book;     
  }
}
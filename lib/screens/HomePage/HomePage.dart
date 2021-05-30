import 'package:flutter/material.dart';
import 'package:todlist/controllers/BookController.dart';
import 'package:todlist/core/AppRoutes.dart';
// import 'package:todlist/screens/HomePage/bookController.dart';
import 'package:provider/provider.dart';
import 'package:todlist/screens/GetBookReadWidget/GetBookReadWidget.dart';
import 'package:todlist/screens/GetBookUnreadWidget/GetBookUnreadWidget.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BookController bookController;
  int _currerntIndex = 0;

  @override
  void initState() {        
    super.initState();                
  }
  
  @override
  Widget build(BuildContext context) {
    bookController  = context.watch<BookController>();
    // print(bookController.books); 
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Livros"),        
      ),
      body: _currerntIndex == 0 ? GetBookRead(bookController: bookController) : GetBookUnread(bookController: bookController),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currerntIndex,
        onTap: (value) {
          setState(() {
            _currerntIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.book_rounded),
            label: "Lidos",              
          ),          
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books_outlined),
            label: "Quero Ler"
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.of(context).pushNamed(Routes.ADD_BOOK);
        },
      )
    );
  }
}
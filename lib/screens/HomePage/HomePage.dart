import 'package:flutter/material.dart';
import 'package:todlist/controllers/BookController.dart';
import 'package:todlist/core/AppRoutes.dart';
// import 'package:todlist/screens/HomePage/bookController.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BookController bookController;

  @override
  void initState() {        
    super.initState();    
    Future.delayed(Duration.zero,  () async {    
      await bookController.getBooks();
      print(bookController.books);
    });             
  }
  
  @override
  Widget build(BuildContext context) {
    bookController  = context.watch<BookController>();
    print(bookController.books);    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Livros"),        
      ),
      body: Container(
        alignment: Alignment.center,
        child: ValueListenableBuilder(
          builder: (_, __, ___) =>  Padding(
            padding: const EdgeInsets.all(2.0),
            child: ListView.builder(
              itemCount: bookController.books.value.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(bookController.books.value[index].title),  
                subtitle: Text(bookController.books.value[index].pages),        
                trailing: SizedBox(                  
                  width: 100,
                  child: Row( 
                    mainAxisAlignment: MainAxisAlignment.end,                   
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit), 
                        color: Colors.yellow,
                        onPressed: () async {
                          await bookController.deleteBooks(bookController.books.value[index].id);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete), 
                        color: Colors.red,
                        onPressed: () async {
                          await bookController.deleteBooks(bookController.books.value[index].id);
                        },
                      ),                      
                    ],
                  ),
                ),
                onTap: (){
                  // Navigator.of(context).pushNamed(Routes.)
                },                              
              ),              
              shrinkWrap: true,
            ),
          ),
          valueListenable: bookController.books,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.book_rounded),
            label: "Lidos"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            label: "Lendo"
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
          Navigator.of(context).pushNamed(Routes.ADD_TASK);
        },
      )
    );
  }
}
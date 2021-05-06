import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todlist/controllers/BookController.dart';

class AddBookWidget extends StatefulWidget {
  @override
  _AddBookWidgetState createState() => _AddBookWidgetState();
}

class _AddBookWidgetState extends State<AddBookWidget> {  
  @override
  void initState() {    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {  
    BookController bookController = context.watch<BookController>();  

    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionar Task"),
        centerTitle: true,
      ),
      body: Form(          
        child: Container(          
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(        
              children: [                
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Nome da livro"
                  ),
                  controller: bookController.title,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Nome do autor"
                  ),
                  controller: bookController.author,
                ),                
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Genero do livro"
                  ),
                  controller: bookController.genre,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Nome da editora"
                  ),
                  controller: bookController.publisher,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Quantidade de páginas"
                  ),
                  controller: bookController.pages,
                ),                
                SizedBox(height: 10),
                ElevatedButton(                              
                  onPressed: () async {
                    await bookController.addBook();
                    Navigator.pop(context);
                  },
                  child: Text("Adicionar"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  )                  
                )
              ],
            ),
          ),
        ),

      ),
    );    
  }
}
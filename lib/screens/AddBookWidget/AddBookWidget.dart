import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todlist/controllers/BookController.dart';
import 'package:cool_alert/cool_alert.dart';

class AddBookWidget extends StatefulWidget {
  @override
  _AddBookWidgetState createState() => _AddBookWidgetState();
}

class _AddBookWidgetState extends State<AddBookWidget> {  
  @override
  void initState() {    
    super.initState();
  }
  bool _isChecked = false;
  
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
                Row(
                  children: [
                    Checkbox(
                      // title: Text("Lido"),
                      value: _isChecked,                  
                      onChanged: (value) {  
                        setState((){                          
                          _isChecked = !_isChecked;
                          // print(_isChecked);
                        });   
                      },                      
                    ),
                    Text("Lido"),
                  ],
                ),
                SizedBox(height: 10),
                ElevatedButton(                              
                  onPressed: () async {
                    try{
                      await bookController.addBook(_isChecked);
                      bookController.clearFields();           
                      Navigator.pop(context);
                    } catch(err){       
                      print(err.toString());

                      CoolAlert.show(
                        context: context, 
                        title: "Erro!",
                        type: CoolAlertType.error, 
                        text: "O Livro que você está tentando adicionar já existe!",
                        backgroundColor: Colors.red,
                        confirmBtnColor: Colors.red,                                                                
                      );

                      bookController.title.clear();
                    }
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
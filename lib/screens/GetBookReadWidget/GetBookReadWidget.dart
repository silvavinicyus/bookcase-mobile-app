import 'package:flutter/material.dart';
import 'package:todlist/controllers/BookController.dart';
import 'package:todlist/core/AppRoutes.dart';

class GetBookRead extends StatefulWidget {
  const GetBookRead({
    Key key,
    @required this.bookController,
  }) : super(key: key);

  final BookController bookController;

  @override
  _GetBookReadState createState() => _GetBookReadState();  
}

class _GetBookReadState extends State<GetBookRead> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero,  () async {    
      await widget.bookController.getBooks();
      widget.bookController.filterBooks(read: true);
      print(widget.bookController.booksFiltered.value);
    });    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color:  Colors.lightGreen,
      alignment: Alignment.center,
      child: ValueListenableBuilder(
        builder: (_, __, ___) =>  Padding(
          padding: const EdgeInsets.all(2.0),
          child: ListView.builder(
            itemCount: widget.bookController.booksFiltered.value.length,
            itemBuilder: (context, index) => Visibility(
              visible: widget.bookController.booksFiltered.value[index].read,
              child: ListTile(
                title: Text(widget.bookController.booksFiltered.value[index].title),  
                leading: Text(widget.bookController.booksFiltered.value[index].pages),
                subtitle: Text(widget.bookController.booksFiltered.value[index].publisher),         
                trailing: SizedBox(                  
                  width: 100,
                  child: Row( 
                    mainAxisAlignment: MainAxisAlignment.end,                   
                    children: [                    
                      IconButton(
                        icon: Icon(Icons.delete), 
                        color: Colors.red,
                        onPressed: () async {
                          await widget.bookController.deleteBooks(widget.bookController.booksFiltered.value[index].id);
                        },
                      ),                      
                    ],
                  ),
                ),
                // onTap: (){
                //   Navigator.of(context).pushNamed(Routes.SHOW_BOOK, arguments: widget.bookController.booksFiltered.value[index]);
                // },                              
              ),
            ),              
            shrinkWrap: true,
          ),
        ),
        valueListenable: widget.bookController.booksFiltered,
      ),
    );
  }
}
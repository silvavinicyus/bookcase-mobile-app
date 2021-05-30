import 'package:flutter/material.dart';
import 'package:todlist/controllers/BookController.dart';
import 'package:todlist/core/AppRoutes.dart';

class GetBookUnread extends StatefulWidget {
  const GetBookUnread({
    Key key,
    @required this.bookController,
  }) : super(key: key);

  final BookController bookController;

  @override
  _GetBookUnreadState createState() => _GetBookUnreadState();
}

class _GetBookUnreadState extends State<GetBookUnread> {
  @override
  void initState() {    
    super.initState();
    Future.delayed(Duration.zero,  () async {    
      await widget.bookController.getBooks();
      widget.bookController.filterBooks(read: false);      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(      
      alignment: Alignment.center,
      child: ValueListenableBuilder(
        builder: (_, __, ___) =>  Padding(
          padding: const EdgeInsets.all(2.0),
          child: ListView.builder(
            itemCount: widget.bookController.booksFiltered.value.length,
            itemBuilder: (context, index) => Visibility(
              visible: !widget.bookController.booksFiltered.value[index].read,
              child: ListTile(
                title: Text(widget.bookController.booksFiltered.value[index].title),  
                leading: Text(widget.bookController.booksFiltered.value[index].publisher),
                subtitle: Text(widget.bookController.booksFiltered.value[index].pages),        
                trailing: SizedBox(                  
                  width: 100,
                  child: Row( 
                    mainAxisAlignment: MainAxisAlignment.end,                   
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit), 
                        color: Colors.yellow,
                        onPressed: () async {
                          await widget.bookController.deleteBooks(widget.bookController.booksFiltered.value[index].id);
                        },
                      ),
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
                onTap: (){
                  Navigator.of(context).pushNamed(Routes.SHOW_BOOK, arguments: widget.bookController.booksFiltered.value[index]);
                },                              
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
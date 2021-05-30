import 'package:flutter/material.dart';
import 'package:todlist/models/Book.dart';

class ShowBookWidget extends StatefulWidget {

  final Book book;

  const ShowBookWidget({Key key, this.book}) : super(key: key);
  
  @override
  _ShowBookWidgetState createState() => _ShowBookWidgetState();
}

class _ShowBookWidgetState extends State<ShowBookWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.book.title),
      ),
      body: Container(
        child: Column(
          children: [
            Text(
              widget.book.title
            )
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:todlist/screens/AddBookWidget/AddBookWidget.dart';
import 'package:todlist/screens/HomePage/HomePage.dart';
import 'package:todlist/screens/ShowBookWidget.dart/ShowBookWidget.dart';

class Routes {
  static const HOME_PAGE = "/";
  static const ADD_BOOK = "/add-book";
  static const EDIT_BOOK = "/edit-book";
  static const SHOW_BOOK = "/show-book";
}

class AppRoutes {
  static Route<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.ADD_BOOK:
        return MaterialPageRoute(builder: (context) {
          return AddBookWidget();
        });      
      case Routes.ADD_BOOK:
        return MaterialPageRoute(builder: (context) {
          return AddBookWidget();
        }); 
      case Routes.HOME_PAGE:
        return MaterialPageRoute(builder: (context) {
          return HomePage();
        });
      case Routes.SHOW_BOOK:
        return  MaterialPageRoute(builder: (context) {
          final book = settings.arguments;

          return  ShowBookWidget(book: book);
        });
      default:
        return MaterialPageRoute(builder: (context) {
          return HomePage();
        });
    }
  }
}
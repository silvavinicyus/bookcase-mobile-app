import 'package:flutter/material.dart';
import 'package:todlist/screens/AddBookWidget/AddBookWidget.dart';
import 'package:todlist/screens/HomePage/HomePage.dart';

class Routes {
  static const HOME_PAGE = "/";
  static const ADD_TASK = "/add-task";
  static const EDIT_TASK = "/edit-task";
}

class AppRoutes {
  static Route<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.ADD_TASK:
        return MaterialPageRoute(builder: (context) {
          return AddBookWidget();
        });      
      case Routes.ADD_TASK:
        return MaterialPageRoute(builder: (context) {
          return AddBookWidget();
        }); 
      case Routes.HOME_PAGE:
        return MaterialPageRoute(builder: (context) {
          return HomePage();
        });
      default:
        return MaterialPageRoute(builder: (context) {
          return HomePage();
        });
    }
  }
}
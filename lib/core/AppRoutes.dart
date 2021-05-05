import 'package:flutter/material.dart';
import 'package:todlist/screens/AddTaskWidget/AddTaskWidget.dart';
import 'package:todlist/screens/HomePage/HomePage.dart';
import 'package:provider/provider.dart';
import 'package:todlist/screens/HomePage/HomePageController.dart';

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
          return AddTaskWidget(homePageController: context.watch<HomePageController>());
        });      
      case Routes.ADD_TASK:
        return MaterialPageRoute(builder: (context) {
          return AddTaskWidget(homePageController: context.watch<HomePageController>());
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
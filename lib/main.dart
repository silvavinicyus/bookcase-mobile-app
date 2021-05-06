import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todlist/controllers/BookController.dart';
import 'package:todlist/core/AppRoutes.dart';
import 'package:todlist/screens/HomePage/HomePage.dart';
// import 'package:todlist/screens/HomePage/HomePageController.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      child: MaterialApp(
        title: "BookCase",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.red,
          brightness: Brightness.light,
          accentColor: Colors.redAccent
        ),
        home: HomePage(),
        onGenerateRoute: AppRoutes.routes,
      ),
      create: (_) => BookController(),
    )
  );
}


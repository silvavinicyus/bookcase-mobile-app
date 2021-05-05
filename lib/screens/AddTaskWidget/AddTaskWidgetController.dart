import 'package:flutter/material.dart';
import 'package:todlist/screens/HomePage/HomePageController.dart';
import 'package:dio/dio.dart';

class AddTaskWidgetController extends ChangeNotifier {
  final HomePageController homePageController;

  final dio = Dio(
    BaseOptions(
      baseUrl: "http://10.0.2.2:3333",
    ),
  );

  final name = TextEditingController();
  final hour = TextEditingController();

  AddTaskWidgetController(this.homePageController);

  String get getName => name.text;
  String get getHour => hour.text;

  void setName(String name) {
    this.name.text = name;
  }

  void setHour(String hour) {
    this.hour.text = hour;
  }

  Future<void> addTask() async {
    final task = await dio.post('/todo', data: {
      "name": getName,
      "hours": getHour
    });

    homePageController.tasks.value.add(task.data);

    homePageController.tasks.notifyListeners();    
  }
}
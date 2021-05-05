import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class HomePageController extends ChangeNotifier{
  final tasks = ValueNotifier([]);
  final dio = Dio(
    BaseOptions(
      baseUrl: "http://10.0.2.2:3333",
    ),
  );

  Future<void> getTasks() async {
    final response = await dio.get('/todo');

    tasks.value = response.data as List;
  }

  Future<void> deleteTasks(String id) async {
    await dio.delete('/todo/$id');

    tasks.value.removeWhere((element) => element['id'] == id);
    
    tasks.notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:todlist/screens/AddTaskWidget/AddTaskWidgetController.dart';
import 'package:todlist/screens/HomePage/HomePageController.dart';

class AddTaskWidget extends StatefulWidget {
  final HomePageController homePageController;

  const AddTaskWidget({Key key, @required this.homePageController}) : super(key: key);

  @override
  _AddTaskWidgetState createState() => _AddTaskWidgetState();
}

class _AddTaskWidgetState extends State<AddTaskWidget> {
  AddTaskWidgetController addTaskWidgetController;

  @override
  void initState() {    
    super.initState();

    addTaskWidgetController = AddTaskWidgetController(widget.homePageController);
  }
  @override
  Widget build(BuildContext context) {
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
                    hintText: "Nome da task"
                  ),
                  controller: addTaskWidgetController.name,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Hora da task"
                  ),
                  controller: addTaskWidgetController.hour,
                ),
                SizedBox(height: 10),
                ElevatedButton(                              
                  onPressed: () async {
                    await addTaskWidgetController.addTask();
                    Navigator.pop(context);
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
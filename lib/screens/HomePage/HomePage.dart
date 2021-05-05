import 'package:flutter/material.dart';
import 'package:todlist/core/AppRoutes.dart';
import 'package:todlist/screens/HomePage/HomePageController.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageController homePageController;

  @override
  void initState() {        
    super.initState();    
    Future.delayed(Duration.zero, (){homePageController.getTasks();});        
  }
  
  @override
  Widget build(BuildContext context) {
    
    homePageController = context.watch<HomePageController>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Tasks"),        
      ),
      body: Container(
        alignment: Alignment.center,
        child: ValueListenableBuilder(
          builder: (_, __, ___) =>  Padding(
            padding: const EdgeInsets.all(2.0),
            child: ListView.builder(
              itemCount: homePageController.tasks.value.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(homePageController.tasks.value[index]['name']),  
                subtitle: Text(homePageController.tasks.value[index]['hours']),        
                trailing: SizedBox(                  
                  width: 100,
                  child: Row( 
                    mainAxisAlignment: MainAxisAlignment.end,                   
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit), 
                        color: Colors.yellow,
                        onPressed: () async {
                          await homePageController.deleteTasks(homePageController.tasks.value[index]['id']);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete), 
                        color: Colors.red,
                        onPressed: () async {
                          await homePageController.deleteTasks(homePageController.tasks.value[index]['id']);
                        },
                      ),                      
                    ],
                  ),
                )                              
              ),              
              shrinkWrap: true,
            ),
          ),
          valueListenable: homePageController.tasks,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.book_rounded),
            label: "Lidos"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            label: "Lendo"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books_outlined),
            label: "Quero Ler"
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.of(context).pushNamed(Routes.ADD_TASK);
        },
      )
    );
  }
}
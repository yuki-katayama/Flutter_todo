import 'package:flutter/material.dart';
import 'package:flutter_todo/todo_add_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TodoListPage(),
    );
  }
}

class TodoListPage extends StatefulWidget{
  @override
  _TodoListPage createState() => _TodoListPage();

}

class _TodoListPage extends State {
  List<String> todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("リスト一覧"),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(todoList[index]),
            ),
          );
        },
      ),
      floatingActionButton:FloatingActionButton(
        onPressed: () async {
          String newText = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TodoAddPage()),
          );
          if (newText != null){
            setState(() {
              todoList.add(newText);
            });
          }
          },
        child: Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutterapp/Todo.dart';

void main() {
  runApp(MaterialApp(
    title: 'Returning Data',
    home: TodoScreen(todos: List.generate(20, (index) => Todo(
      'Todo $index',
      'this is description $index'
    ))),
  ));
}



class TodoScreen extends StatelessWidget{
  final List<Todo> todos;

  TodoScreen({Key key, @required this.todos}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO'),
      ),
      body: ListView.builder(itemBuilder: (context, index){
        return ListTile(
          title: Text(todos[index].title),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(todo: todos[index])));
          },
        );
      },
      itemCount: todos.length,)
    );

  }
}
class DetailScreen extends StatelessWidget{
  final Todo todo;
  DetailScreen({Key key , @required this.todo});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(todo.descripttion),
      ),
      appBar: AppBar(title: Text(todo.title),),
    );
  }
}
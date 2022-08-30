import 'package:flutter/material.dart';
import 'package:todo_app_provider/model/todo.dart';

class TodosProvider extends ChangeNotifier {
  final List<Todo> _todos = [
    Todo(
      createdTime: DateTime.now(),
      title: 'Walk the Dog 🐕',
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'Buy Food',
      description: '''
-Milk
-bread 
-water''',
    ),
    Todo(
        createdTime: DateTime.now(),
        title: 'Trip to somewhere',
        description: '''
- Rent some hotels
- Rent a car
- Pack suitecase'''),
  ];

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

}

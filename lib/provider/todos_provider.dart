import 'package:flutter/cupertino.dart';

import '../model/todo.dart';

class TodosProvider extends ChangeNotifier {
  final List<Todo> _todos = [
    Todo(
      createdTime: DateTime.now(),
      title: "Our First Todo",
    ),
    Todo(
      createdTime: DateTime.now(),
      title: "Play Cricket with Friends",
    ),
    Todo(
      createdTime: DateTime.now(),
      title: "Buy Food",
      description: '''-Eggs 
-Milk
-Butter
-Bread''',
    ),
    Todo(
        createdTime: DateTime.now(),
        title: "Trip to Himachal",
        description: '''-Book Ticket
-Pack some bags
-Rent Hotel
-Find out sightseeing spots'''),
    Todo(
      createdTime: DateTime.now(),
      title: "Plan Dad's Birthday",
      description: '''-Buy a cake
-Buy a gift
-Invite friends & family
-Decorate the house''',
    ),
  ];

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();

  List<Todo> get todosCompleted =>
      _todos.where((todo) => todo.isDone == true).toList();

  void addTodo(Todo todo) {
    _todos.add(todo);

    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _todos.remove(todo);

    notifyListeners();
  }

  void updateTodo(Todo todo, String title, String description) {
    todo.title = title;

    todo.description = description;

    notifyListeners();
  }

  bool toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;

    notifyListeners();

    return todo.isDone;
  }
}

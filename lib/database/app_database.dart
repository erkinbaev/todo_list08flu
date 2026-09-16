import 'package:todo_list08flu/database/todo.dart';

class AppDatabase {
  List<Todo> _todoList = [
    // Todo(id: 1, title: "Купить книгу", createdAt: "28.02.2026", isDone: true),
    // Todo(id: 2, title: "Купить новый телефон", createdAt: "14.03.2026", isDone: false),
    // Todo(id: 3, title: "Записаться в зал", createdAt: "25.05.2026", isDone: false)
  ];

  List<Todo> getTodoList() {
    return _todoList;
  }
}
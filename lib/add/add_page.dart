import 'package:flutter/material.dart';
import 'package:todo_list08flu/database/todo.dart';
import 'dart:async';

import 'package:todo_list08flu/main.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  //Выделяет память для виджета с состоянием
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  late Timer _timer;
TextEditingController _textEditingController = TextEditingController();

//занимает память, то есть в этот момент виджет появляется в оперативной памяти
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //готовим данные, подгружаем данные с локального хранилища, с сервера посредстовм интернета
    //инициализируем свойства
    //запускать анимации, либо таймеры
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final date = DateTime.now();
      print("${date.minute} : ${date.second}");
    });
    print("AddPage initState");
  }

//рисует интерфейс
  @override
  Widget build(BuildContext context) {
    print("AddPage build");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Добавить задачу"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                border: OutlineInputBorder(), 
              label: Text("Введите название задачи")
              )
              ),
              TextButton(onPressed: onSaveTap, child: Text("Сохранить"))
          ],
        ),
      ),
    );
  }

  void onSaveTap() {
    final title = _textEditingController.text;
    final createdAt = DateTime.now().toString();
    appDatabase.addTodo(Todo(id: 1, title: title, createdAt: createdAt, isDone: false));

    Navigator.of(context).pop(_textEditingController.text);
  }

//уничтожает виджет из памяти (освобождает)
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("AddPage dispose");
    _textEditingController.dispose();
    _timer.cancel();
  //остановить анимацию
  //остановить таймер или другие фоновые процессы
  //остановить контроллеры
  //остановить стримы (stream)
  }
}

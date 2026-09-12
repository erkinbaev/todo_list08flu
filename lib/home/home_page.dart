import 'package:flutter/material.dart';
import 'package:todo_list08flu/add/add_page.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  //Выделяет память для виджета с состоянием
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> tasks = [];
  int _counter = 0;
  bool _isTextVisible = true;
  Color _containerColor = Colors.blue;
  List<Color> _colors = [Colors.blue, Colors.red, Colors.green, Colors.orange];
  int _price = 0;
  int _amount = 0;


  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

//занимает память, то есть в этот момент виджет появляется в оперативной памяти
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //готовим данные, подгружаем данные с локального хранилища, с сервера посредстовм интернета
    //инициализируем свойства
    //запускать анимации, либо таймеры
    print("MyHomePage initState");
  }

//рисует интерфейс
  // @override
  // Widget build(BuildContext context) {
  //   print("MyHomePage build");
  //   return Scaffold(
  //     appBar: AppBar(
  //       backgroundColor: Theme.of(context).colorScheme.inversePrimary,
  //       title: Text(widget.title),
  //     ),
  //     body: Center(
  //       child: Column(
  //         mainAxisAlignment: .center,
  //         children: [
  //           const Text('You have pushed the button this many times:'),
  //           Text(
  //             '$_counter',
  //             style: Theme.of(context).textTheme.headlineMedium,
  //           ),
  //         ],
  //       ),
  //     ),
  //     floatingActionButton: FloatingActionButton(
  //       onPressed: onAddTap,
  //       tooltip: 'Increment',
  //       child: const Icon(Icons.add),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    print("MyHomePage build");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Visibility(child:  Text("Дополнительная информация"), visible: _isTextVisible),
            Container(width: 300, height: 200, color: _containerColor),
            TextButton(onPressed: onHideTap, child: Text(_isTextVisible ? "Скрыть" : "Показать")),
            Text("Цена: $_price сом"),
            Row(children: [Spacer(), IconButton(onPressed: onMinusTap, icon: Icon(Icons.remove)),IconButton(onPressed: onPlusTap, icon: Icon(Icons.add)), Spacer()])
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onAddTap,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  void onAddTap() async {
    final result = await Navigator.of(context).push(MaterialPageRoute(builder: (_) => AddPage()));
    if (result != null) {
      print("$result");
     // tasks.insert(0, result);
    }
  }

  void onHideTap() {
    setState(() {
      _isTextVisible = !_isTextVisible;
      _containerColor = _colors[Random().nextInt(_colors.length)];
    });
    print(_isTextVisible);
  }

  void onPlusTap() {
    setState(() {
       _amount ++;
      _price = 200 * _amount;
    });
    print(_amount);
    print(_price);
  }

  void onMinusTap() {
    setState(() {
      _amount --;
      _price = 200 * _amount;
    });
    print(_amount);
    print(_price);
  }

//уничтожает виджет из памяти (освобождает)
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("MyHomePage dispose");
  //остановить анимацию
  //остановить таймер или другие фоновые процессы
  //остановить контроллеры
  //остановить стримы (stream)
  }
}

extension on Random {
  void nextInt(int length) {

  }
}
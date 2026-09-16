import 'package:flutter/material.dart';
import 'package:todo_list08flu/home/home_cubit.dart';
import 'package:todo_list08flu/home/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  HomeCubit _cubit = HomeCubit();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BlocProvider(
        create: (_) => _cubit,
        child: MyHomePage(cubit: _cubit),
        ),
    );
  }
}


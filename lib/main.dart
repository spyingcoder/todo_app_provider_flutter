import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_provider/page/home_page.dart';
import 'package:todo_app_provider/provider/todos.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String title = 'Todo App';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => TodosProvider(),
    child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(
              primarySwatch: Colors.pink,
              scaffoldBackgroundColor: const Color(0xFFf6f5ee)),
          home:  const HomePage(),
        ),
  );
}
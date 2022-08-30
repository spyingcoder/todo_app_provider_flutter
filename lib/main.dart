import 'package:flutter/material.dart';
import 'package:todo_app_provider/page/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String title = 'Todo App';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
            primarySwatch: Colors.pink,
            scaffoldBackgroundColor: const Color(0xFFf6f5ee)),
        home:  HomePage(),
      );
}
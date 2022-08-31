import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_provider/provider/todos.dart';
import 'package:todo_app_provider/widget/todo_widget.dart';

class CompletedListWidget extends StatelessWidget {
  const CompletedListWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todosCompleted;
    for (var item in todos) {
      log(item.title.toString(), name: "Completed: ");
    }

    return todos.isEmpty
        ? const Center(
            child: Text(
              'No Completed Tasks.',
              style: TextStyle(fontSize: 20),
            ),
          )
        : ListView.separated(
            padding: const EdgeInsets.all(16),
            physics: const BouncingScrollPhysics(),
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return TodoWidget(todo: todo);
            },
            separatorBuilder: (context, index) => Container(
              height: 8,
            ),
          );
  
  }
}
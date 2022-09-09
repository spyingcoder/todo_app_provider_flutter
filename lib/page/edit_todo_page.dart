import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_provider/model/todo.dart';
import 'package:todo_app_provider/provider/todos.dart';
import 'package:todo_app_provider/widget/todo_form_widget.dart';

class EditTodoPage extends StatefulWidget {
  final Todo todo;

  const EditTodoPage({Key? key, required this.todo}) : super(key: key);

  @override
  State<EditTodoPage> createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  final _formKey = GlobalKey<FormState>();

  String? title;
  String? description;

  @override
  void initState() {
    title = widget.todo.title;
    description = widget.todo.description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Edit Todo"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                final provider =
                    Provider.of<TodosProvider>(context, listen: false);
                provider.removeTodo(widget.todo);
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Form(
            key: _formKey,
            child: TodoFormWidget(
              title: title!,
              description: description ?? "",
              onChangedTitle: (title) => setState(() {
                this.title = title;
              }),
              onChangedDescription: (description) => setState(() {
                this.description = description;
              }),
              onSavedTodo: saveTodo,
            ),  
          ),
        ),
      );

  void saveTodo() {
    final isValid = _formKey.currentState?.validate();
    if (!isValid!) {
      return;
    } else {
      final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.updateTodo(widget.todo, title!, description);
      Navigator.of(context).pop();
    }
  }
}

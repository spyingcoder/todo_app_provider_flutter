import 'dart:ffi';

import 'package:flutter/material.dart';

class TodoFormWidget extends StatelessWidget {
  final String title;
  final String description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedTodo;

  const TodoFormWidget({
    Key? key,
    this.title = '',
    this.description = '',
    required this.onChangedTitle,
    required this.onChangedDescription,
    required this.onSavedTodo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildTitle(),
            const SizedBox(
              height: 8,
            ),
            buildDescription(),
            const SizedBox(
              height: 32,
            ),
            buildButton(),
          ],
        ),
      );

  Widget buildTitle() => TextFormField(
        onChanged: onChangedTitle,
        maxLines: 1,
        initialValue: title,
        validator: (title) {
          if (title!.isEmpty) {
            return 'The title cannot be empty';
          }
          return null;
        },
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Title',
        ),
      );

  Widget buildDescription() => TextFormField(
        maxLines: 3,
        onChanged: onChangedDescription,
        initialValue: description,
        validator: (description) {
          if (description!.isEmpty) {
            return 'The description cannot be empty';
          }
          return null;
        },
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Description',
        ),
      );

  Widget buildButton() => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onSavedTodo,
          child: const Text('Save'),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black),
          ),
        ),
      );
}

import 'package:flutter/material.dart';

class TodoFormWidget extends StatelessWidget {
  const TodoFormWidget(
      {super.key,
      this.title = '',
      this.description = '',
      required this.onChangedTitle,
      required this.onChangedDescription,
      required this.onSavedTodo});

  final String title;
  final String description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedTodo;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildTitle(),
        const SizedBox(height: 9),
        buildDescription(),
        const SizedBox(height: 9),
        buildButton(),
        
      ],
    );
  }

  Widget buildTitle() => TextFormField(
        maxLines: 1,
        validator: (title) {
          if (title!.isEmpty) {
            return "Title cannot be empty";
          }
          return null;
        },
        initialValue: title,
        onChanged: onChangedTitle,
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: "Title",
        ),
      );

  Widget buildDescription() => TextFormField(
    maxLines: 3,
    onChanged: onChangedDescription,
    initialValue: description,
    decoration: const InputDecoration(border: UnderlineInputBorder(), labelText: "Description",),
  );
  
  Widget buildButton() => SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: onSavedTodo, 
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black),),
      child: const Text("Save", )
  
      ),
  );
}

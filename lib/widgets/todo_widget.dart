import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todos_provider.dart';
import '../model/todo.dart';
import '../pages/edit_todo_page.dart';
import '../utils.dart';

class TodoWidget extends StatelessWidget {
  const TodoWidget({super.key, required this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Slidable(
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              backgroundColor: Colors.green,
              onPressed: (_) {
                editTodo(context, todo);
              },
              icon: Icons.edit,
              label: "Edit",
            ),
          ],
        ),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              backgroundColor: Colors.red,
              onPressed: (_) {
                deleteTodo(context, todo);
              },
              icon: Icons.delete,
              label: "Delete",
            ),
          ],
        ),
        key: Key(todo.id),
        child: buildTodo(context),
      ),
    );
  }

  Widget buildTodo(BuildContext context) {
    return GestureDetector(
      onTap: () => editTodo(context, todo),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Checkbox(
              checkColor: Colors.white,
              activeColor: Theme.of(context).primaryColor,
              value: todo.isDone,
              onChanged: (_) {
                final provider =
                    Provider.of<TodosProvider>(context, listen: false);
                final isDone = provider.toggleTodoStatus(todo);
    
                Utils.showSnackBar(
                  context,
                  isDone ? "Task Completed" : "Task marked as incomplete",
                );
              },
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todo.title,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (todo.description.isNotEmpty)
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      child: Text(
                        todo.description,
                        style: const TextStyle(
                          height: 1.5,
                          fontSize: 20,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void deleteTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(todo);

    Utils.showSnackBar(context, 'Deleted the todo.');
  }

  void editTodo(BuildContext context, Todo todo) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>EditTodoPage(todo: todo), 
        )
        );
    
    
  }
}

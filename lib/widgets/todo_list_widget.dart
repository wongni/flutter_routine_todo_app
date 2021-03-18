import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:routine_todo_app/widgets/todo_item.dart';

import '../providers.dart';

class TodoListWidget extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final todos = useProvider(filteredTodos);

    return SingleChildScrollView(
      child: Column(
        children: [
          for (var i = 0; i < todos.length; i++) ...[
            Dismissible(
              key: ValueKey(todos[i].id),
              onDismissed: (_) =>
                  context.read(todosProvider).remove(todos[i].id),
              direction: DismissDirection.endToStart,
              background: Container(
                color: Theme.of(context).errorColor,
                alignment: Alignment.centerRight,
                child: const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(Icons.delete, color: Colors.white),
                ),
              ),
              child: TodoItem(todos[i]),
            ),
          ],
        ],
      ),
    );
  }
}

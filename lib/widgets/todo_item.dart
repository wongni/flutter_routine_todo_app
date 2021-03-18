import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../providers.dart';
import '../todo.dart';

class TodoItem extends HookWidget {
  final Todo todo;

  const TodoItem(this.todo);

  @override
  Widget build(BuildContext context) {
    final itemFocusNode = useFocusNode();
    useListenable(itemFocusNode);
    final isFocused = itemFocusNode.hasFocus;

    final textEditingController = useTextEditingController();
    final textFieldFocustNode = useFocusNode();

    return Padding(
      padding: const EdgeInsets.all(1),
      child: Material(
        color: Colors.white,
        elevation: 3,
        child: Focus(
          focusNode: itemFocusNode,
          onFocusChange: (focused) {
            if (focused) {
              textEditingController.text = todo.description;
            } else {
              context
                  .read(todosProvider)
                  .edit(todo.id, textEditingController.text);
              itemFocusNode.unfocus();
            }
          },
          child: ListTile(
            onTap: () {
              itemFocusNode.requestFocus();
              textFieldFocustNode.requestFocus();
            },
            leading: Checkbox(
              value: todo.completed,
              onChanged: (_) =>
                  context.read(todosProvider).toggleCompleted(todo.id),
            ),
            title: isFocused
                ? TextField(
                    autofocus: true,
                    focusNode: textFieldFocustNode,
                    controller: textEditingController,
                  )
                : Text(
                    todo.description,
                    style: TextStyle(
                      decoration: todo.completed
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routine_todo_app/providers.dart';
import 'package:routine_todo_app/todo.dart';

class TitleWidget extends HookWidget {
  static const double _size = 40;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Routine Todo',
          style: TextStyle(
            fontSize: _size,
            fontWeight: FontWeight.w100,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: IconButton(
            icon: const Icon(
              Icons.replay,
              size: _size,
            ),
            color: Theme.of(context).accentColor,
            onPressed: () {
              context.read(todosProvider).reset();
              context.read(todosFilter).state = TodosFilter.all;
            },
          ),
        )
      ],
    );
  }
}

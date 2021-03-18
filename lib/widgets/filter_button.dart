import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:routine_todo_app/todo.dart';
import 'package:routine_todo_app/providers.dart';

class FilterButton extends HookWidget {
  final TodosFilter filter;
  final String label;

  const FilterButton(this.filter, this.label);

  @override
  Widget build(BuildContext context) {
    final currentFilter = useProvider(todosFilter);

    return TextButton(
      onPressed: () => context.read(todosFilter).state = filter,
      style: TextButton.styleFrom(
        primary: currentFilter.state == filter ? Colors.blue : Colors.black54,
        // textStyle: TextStyle(
        //   fontWeight: currentFilter.state == filter ? FontWeight.bold : null,
        // ),
      ),
      child: Text(label),
    );
  }
}

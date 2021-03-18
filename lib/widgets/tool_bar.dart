import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:routine_todo_app/todo.dart';
import 'package:routine_todo_app/widgets/filter_button.dart';

import '../providers.dart';

class ToolBar extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(
        //   '${context.read(uncompletedTodosCount)} items left',
        //   overflow: TextOverflow.ellipsis,
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: TextField(
                controller: searchController,
                decoration: const InputDecoration(
                  labelText: 'Search',
                  icon: Icon(Icons.search),
                ),
                onChanged: (value) {
                  context.read(todosSearch).state = value;
                },
              ),
            ),
            const FilterButton(TodosFilter.all, 'All'),
            const FilterButton(TodosFilter.active, 'Active'),
            const FilterButton(TodosFilter.completed, 'Completed'),
          ],
        ),
      ],
    );
  }
}

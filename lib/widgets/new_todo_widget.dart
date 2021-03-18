import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../providers.dart';

class NewTodoWidget extends HookWidget {
  final newTodoController = useTextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: newTodoController,
            decoration: const InputDecoration(
              labelText: 'What needs to be done routinely?',
            ),
            onSubmitted: (value) {
              if (value.trim().isNotEmpty) {
                final routine = context.read(isNewTodoRoutine).state;
                context.read(todosProvider).add(value, routine);
                newTodoController.clear();
              }
            },
          ),
        ),
        // Column(
        //   children: [
        //     const Text(
        //       'Routine?',
        //       style: TextStyle(
        //         fontSize: 12,
        //         color: Colors.grey,
        //       ),
        //     ),
        //     Consumer(
        //       builder: (context, watch, child) => SizedBox(
        //         width: 30,
        //         height: 30,
        //         child: Checkbox(
        //           value: watch(isNewTodoRoutine).state,
        //           onChanged: (newValue) =>
        //               context.read(isNewTodoRoutine).state = newValue ?? true,
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}

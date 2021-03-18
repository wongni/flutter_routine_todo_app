import 'package:uuid/uuid.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

var _uuid = const Uuid();

class Todo {
  final String id;
  final String description;
  final bool completed;
  final bool routine;

  Todo({
    String? id,
    required this.description,
    this.routine = true,
    this.completed = false,
  }) : id = id ?? _uuid.v4();

  @override
  String toString() {
    return 'Todo(description: $description, completed: $completed, routine: $routine)';
  }
}

enum TodosFilter {
  all,
  active,
  completed,
  routine,
}

class TodoList extends StateNotifier<List<Todo>> {
  TodoList([List<Todo>? initialTodos]) : super(initialTodos ?? []);

  // ignore: avoid_positional_boolean_parameters
  void add(String description, bool routine) {
    state = [
      ...state,
      Todo(description: description, routine: routine),
    ];
  }

  void toggleCompleted(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          Todo(
            id: id,
            description: todo.description,
            completed: !todo.completed,
            routine: todo.routine,
          )
        else
          todo
    ];
  }

  void toggleRoutine(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          Todo(
            id: id,
            description: todo.description,
            completed: todo.completed,
            routine: !todo.routine,
          )
        else
          todo
    ];
  }

  void edit(String id, String description) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          Todo(
            id: id,
            description: description,
            completed: todo.completed,
            routine: todo.routine,
          )
        else
          todo
    ];
  }

  void remove(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }

  void reset() {
    state = state
        .map((todo) => Todo(id: todo.id, description: todo.description))
        .toList();
  }
}

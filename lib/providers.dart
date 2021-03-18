import 'package:routine_todo_app/todo.dart';
import 'package:riverpod/riverpod.dart';

final todosProvider = StateNotifierProvider<TodoList>(
  (_) => TodoList(
    [
      Todo(description: 'Buy milk'),
      Todo(description: 'Practice golf swing'),
      Todo(description: 'Study Flutter'),
      Todo(description: 'Eat healthy'),
      Todo(description: 'Buy milk'),
      Todo(description: 'Practice golf swing'),
      Todo(description: 'Study Flutter'),
      Todo(description: 'Eat healthy'),
      Todo(description: 'Buy milk'),
      Todo(description: 'Practice golf swing'),
      Todo(description: 'Study Flutter'),
      Todo(description: 'Eat healthy'),
      Todo(description: 'Buy milk'),
      Todo(description: 'Practice golf swing'),
      Todo(description: 'Study Flutter'),
      Todo(description: 'Eat healthy'),
    ],
  ),
);

final todosFilter = StateProvider((_) => TodosFilter.all);

final todosSearch = StateProvider<String>((ref) => '');

final isNewTodoRoutine = StateProvider<bool>((ref) => true);

final filteredTodos = Provider<List<Todo>>((ref) {
  final filter = ref.watch(todosFilter).state;
  final search = ref.watch(todosSearch).state;
  final todos = ref.watch(todosProvider.state);

  List<Todo> filteredTodos;
  switch (filter) {
    case TodosFilter.completed:
      filteredTodos = todos.where((todo) => todo.completed).toList();
      break;
    case TodosFilter.active:
      filteredTodos = todos.where((todo) => !todo.completed).toList();
      break;
    case TodosFilter.routine:
      filteredTodos = todos.where((todo) => todo.routine).toList();
      break;
    default:
      filteredTodos = todos;
  }

  return filteredTodos
      .where((todo) =>
          todo.description.toLowerCase().contains(search.toLowerCase()))
      .toList();
});

final uncompletedTodosCount = Provider<int>((ref) =>
    ref.watch(todosProvider.state).where((todo) => !todo.completed).length);

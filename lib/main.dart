import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:routine_todo_app/widgets/new_todo_widget.dart';
import 'package:routine_todo_app/widgets/todo_list_widget.dart';
import 'package:routine_todo_app/widgets/tool_bar.dart';
import 'widgets/title_widget.dart';

void main() => runApp(ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Routine Todo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        accentColor: Colors.purple,
      ),
      home: Home(),
    );
  }
}

class Home extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .2,
                  child: TitleWidget(),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .1,
                  child: NewTodoWidget(),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .1,
                  child: ToolBar(),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .6,
                  child: TodoListWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

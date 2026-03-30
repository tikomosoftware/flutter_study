// 第6回：アプリの入り口
import 'package:flutter/material.dart';
import 'todo_list_screen.dart';

class Lesson06App extends StatelessWidget {
  const Lesson06App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView Study',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      // 最初に表示する画面を指定
      home: const TodoListScreen(),
    );
  }
}

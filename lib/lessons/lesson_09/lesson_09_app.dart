// 第9回：アプリの入り口
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'user_list_screen.dart';

class Lesson09App extends StatelessWidget {
  const Lesson09App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User List + Detail',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const UserListScreen(),
    );
  }
}

@Preview(name: 'Lesson 09 - 詳細画面遷移')
Widget lesson09Preview() {
  return const Lesson09App();
}

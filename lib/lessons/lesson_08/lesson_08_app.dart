// 第8回：アプリの入り口
// レッスン7（httpパッケージ）を dio パッケージに書き換える練習です。
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'user_list_screen.dart';

class Lesson08App extends StatelessWidget {
  const Lesson08App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API + ListView Study',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const UserListScreen(),
    );
  }
}

@Preview(name: 'Lesson 08 - API通信(dio)')
Widget lesson08Preview() {
  return const Lesson08App();
}

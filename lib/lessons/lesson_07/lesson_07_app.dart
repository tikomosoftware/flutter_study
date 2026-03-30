// 第7回：アプリの入り口
import 'package:flutter/material.dart';
import 'user_list_screen.dart';

class Lesson07App extends StatelessWidget {
  const Lesson07App({super.key});

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

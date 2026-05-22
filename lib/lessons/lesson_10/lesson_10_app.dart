// 第10回：テストの書き方レッスンのメインウィジェット
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'counter_widget.dart';

class Lesson10App extends StatelessWidget {
  const Lesson10App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Testing Study',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: const CounterWidget(),
    );
  }
}

@Preview(name: 'Lesson 10 - テスト学習')
Widget lesson10Preview() {
  return const Lesson10App();
}

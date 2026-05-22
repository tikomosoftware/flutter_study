// 第3回：画面遷移（Navigation）の練習
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'first.dart';

class Lesson0304NavigationApp extends StatelessWidget {
  const Lesson0304NavigationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Study',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      // 最初に表示する画面を指定
      home: const FirstScreen(),
    );
  }
}

// Preview はトップレベル関数または static メソッドに付ける
@Preview(name: 'Lesson 03-04 Navigation')
Widget lesson0304NavigationAppPreview() {
  return const Lesson0304NavigationApp();
}

// 第4回：ファイル分割レッスンのメインウィジェット
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
// main_screen.dart をインポート
import 'main_screen.dart';

class Lesson04App extends StatelessWidget {
  const Lesson04App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 右上の「DEBUG」リボンを消す
      title: 'Split Files App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      // 別ファイルで定義した MainScreen を home に設定
      home: const MainScreen(),
    );
  }
}

@Preview(name: 'Lesson 04 - ファイル分割')
Widget lesson04Preview() {
  return const Lesson04App();
}

import 'package:flutter/material.dart';

// --- 表示したいレッスンをここでインポートします ---
// import 'lessons/lesson_00_hello_world.dart'; // 第0回：StatelessWidget（Hello World）
// 第1回：StatefulWidget（カウンターアプリ）
// 第2回：ダイアログとテキスト入力
// 第3回：画面遷移（Navigation）
// import 'lessons/lesson_00_hello_world.dart';
// import 'lessons/lesson_03-01_navigation.dart';
// import 'lessons/lesson_03_02/lesson_03-02_navigation.dart';
// import 'lessons/lesson_03_03/lesson_03-03_navigation.dart';
import 'lessons/lesson_03_04/lesson_03-04_navigation.dart';

// 第4回：ファイル分割
// 第5回：アプリ全体でのデータ共有
// 第6回：リスト表示（ListView）
// 第7回：API通信 + リスト表示
// 第8回：dio に書き換える練習
// 第9回：詳細画面への遷移

// 第10回：テストの書き方（ユニットテスト＆ウィジェットテスト）
// ※ テストは flutter test コマンドで実行します

void main() {
  // ここで、表示したいレッスンのウィジェットを呼び出します。

  // 第0回
  // runApp(const Lesson00HelloWorldApp());

  // 第1回
  // runApp(const Lesson01CounterApp());

  // 第2回
  // runApp(const Lesson02DialogApp());

  // 第3回
  // runApp(const Lesson03NavigationApp());
  // runApp(const Lesson0301NavigationApp());
  // runApp(const Lesson0302NavigationApp());
  // runApp(const Lesson0303NavigationApp());
  runApp(const Lesson0304NavigationApp());

  // 第4回
  // runApp(const Lesson04App());

  // 第5回
  // runApp(const Lesson05App());

  // 第6回
  // runApp(const Lesson06App());

  // 第7回
  // runApp(const Lesson07App());

  // 第8回
  // runApp(const Lesson08App());

  // 第9回
  // runApp(const Lesson09App());
}

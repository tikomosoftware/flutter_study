// 第0回：一番最初のHello World（StatelessWidgetの基礎）
import 'package:flutter/material.dart';

// StatelessWidgetは「状態を持たない（後から変化しない）」画面を作るためのものです。
class Lesson00HelloWorldApp extends StatelessWidget {
  const Lesson00HelloWorldApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialAppはアプリ全体の土台となるウィジェットです
    return MaterialApp(
      title: 'Hello World App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      // Scaffoldは画面の基本的な骨組み（ヘッダーやボディなど）を提供します
      home: Scaffold(
        // 画面上部のタイトルバー（AppBar）
        appBar: AppBar(
          title: const Text('はじめてのFlutter'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        // 画面の中央に配置するウィジェット
        body: const Center(
          // 画面にテキストを表示するウィジェット
          child: Text(
            'Hello World!',
            style: TextStyle(
              fontSize: 32, 
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // 画面の右下に浮かぶボタン（FloatingActionButton）
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // StatelessWidgetなので画面は変化しませんが、裏側で処理は動かせます
            print('ボタンが押されました！');
          },
          child: const Icon(Icons.thumb_up),
        ),
      ),
    );
  }
}

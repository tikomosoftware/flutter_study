// 第1回：カウンターアプリ（StatefulWidgetの基礎）
import 'package:flutter/material.dart';

// main関数は不要になるので削除（目次側のmainから直接 MyApp を呼び出します）

class Lesson01CounterApp extends StatefulWidget {
  const Lesson01CounterApp({super.key});

  @override
  State<Lesson01CounterApp> createState() => _Lesson01CounterAppState();
}

class _Lesson01CounterAppState extends State<Lesson01CounterApp> {
  // ① 変化するデータ（状態）を保存する変数を定義します
  int _counter = 0;

  // ② ボタンが押されたときに呼ばれる関数（プラス）
  void _incrementCounter() {
    setState(() {
      _counter++; // カウンターを1増やす
    });
  }

  // マイナスする関数
  void _decrementCounter() {
    setState(() {
      _counter--; // カウンターを1減らす
    });
  }

  // リセットする関数
  void _resetCounter() {
    setState(() {
      _counter = 0; // カウンターを0に戻す
    });
  }

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
        // 画面上部のタイトルバー（AppBar）を追加
        appBar: AppBar(
          title: const Text('はじめてのFlutter'),
          backgroundColor: Colors.blue, // タイトルバーの背景色を青に
          foregroundColor: Colors.white, // 文字色を白に
        ),
        // 画面の中央に配置するウィジェット
        body: Center(
          // 縦に複数のウィジェットを並べるための「Column」に変更
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // 中央寄せ
            children: [
              const Text('ボタンを押した回数:', style: TextStyle(fontSize: 20)),
              // ③ 変数 `_counter` の中身を画面に表示する
              Text(
                '$_counter',
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 32), // 少し隙間を空ける
              // ④ 3つのボタンを横に並べる（Rowウィジェット）
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // 横方向の中央寄せ
                children: [
                  // マイナスボタン
                  ElevatedButton(
                    onPressed: _decrementCounter,
                    child: const Icon(Icons.remove),
                  ),
                  const SizedBox(width: 16), // ボタン間の隙間
                  // リセットボタン
                  ElevatedButton(
                    onPressed: _resetCounter,
                    child: const Icon(Icons.refresh),
                  ),
                  const SizedBox(width: 16), // ボタン間の隙間
                  // プラスボタン
                  ElevatedButton(
                    onPressed: _incrementCounter,
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

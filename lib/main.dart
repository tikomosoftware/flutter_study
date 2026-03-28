import 'package:flutter/material.dart';

void main() {
  // アプリケーションのエントリーポイント（ここからアプリが始まります）
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ① 変化するデータ（状態）を保存する変数を定義します
  int _counter = 0;

  // ② ボタンが押されたときに呼ばれる関数
  void _incrementCounter() {
    // setState() を呼ぶことで、「データが変わったから画面を更新して！」とFlutterに伝えます
    setState(() {
      _counter++; // カウンターを1増やす
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
            ],
          ),
        ),
        // 画面の右下に浮かぶボタン（FloatingActionButton）を追加
        floatingActionButton: FloatingActionButton(
          // ④ ボタンが押されたら、上で作った `_incrementCounter` 関数を呼ぶ
          onPressed: _incrementCounter,
          child: const Icon(Icons.add), // 「+」マークのアイコンに変更
        ),
      ),
    );
  }
}

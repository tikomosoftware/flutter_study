// 第2回：テキスト入力とダイアログ表示
import 'package:flutter/material.dart';

class Lesson02DialogApp extends StatefulWidget {
  const Lesson02DialogApp({super.key});

  @override
  State<Lesson02DialogApp> createState() => _Lesson02DialogAppState();
}

class _Lesson02DialogAppState extends State<Lesson02DialogApp> {
  // テキストボックスに入力された文字を管理するための「コントローラー」
  final TextEditingController _textController = TextEditingController();

  // ① シンプルなメッセージダイアログを表示する関数
  // 修正：呼び出し元から innerContext を受け取るように変更
  void _showSimpleDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // ダイアログの外側をタップしても閉じないようにする（Web環境での安定性向上）
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('こんにちは！'),
          content: const Text('これはシンプルなダイアログです。'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // ダイアログを閉じる
              },
              child: const Text('閉じる'),
            ),
          ],
        );
      },
    );
  }

  // ② テキストボックスの入力内容をダイアログで表示する関数
  // 修正：呼び出し元から innerContext を受け取るように変更
  void _showInputDialog(BuildContext context) {
    // コントローラーから入力されたテキストを取得
    final inputText = _textController.text;

    showDialog(
      context: context,
      barrierDismissible: false, // ダイアログの外側をタップしても閉じないようにする
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('入力結果'),
          // 入力が空だった場合の処理も入れておきます
          content: Text(
            inputText.isEmpty ? '何も入力されていません！' : 'あなたの入力: $inputText',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // ダイアログを閉じる
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  // 画面が破棄されるときにコントローラーも破棄する（メモリリーク防止の重要なお作法）
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 修正ポイント：showDialog は MaterialApp の「内側」の context を使う必要があります。
    // そのため、Scaffold を返す部分を MaterialApp の home に直接書くのではなく、
    // 新しいウィジェット（または Builder）で包む必要があります。
    return MaterialApp(
      title: 'Dialog & Input',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: Builder(
        builder: (innerContext) => Scaffold(
          appBar: AppBar(
            title: const Text('ダイアログと入力の練習'),
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
          ),
          body: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 1. シンプルなダイアログを表示するボタン
                ElevatedButton(
                  // 修正：innerContext を渡すように変更
                  onPressed: () => _showSimpleDialog(innerContext),
                  child: const Text('シンプルなダイアログを表示'),
                ),

                const SizedBox(height: 60),
                const Divider(),
                const SizedBox(height: 60),

                // 2. テキスト入力欄（TextField）
                TextField(
                  controller: _textController,
                  decoration: const InputDecoration(
                    labelText: 'メッセージを入力してください',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.edit),
                  ),
                ),

                const SizedBox(height: 16),

                // 3. 入力した文字をダイアログで表示するボタン
                ElevatedButton(
                  // 修正：innerContext を渡すように変更
                  onPressed: () => _showInputDialog(innerContext),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade100,
                  ),
                  child: const Text('入力した文字をダイアログで表示'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

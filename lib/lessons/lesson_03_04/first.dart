// --- 1番目の画面 ---
import 'package:flutter/material.dart';
import 'second.dart';

// 1. TextField を使うために StatefulWidget に変更
class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  // 2. テキスト入力を管理するコントローラーを作成
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('03-04)最初の画面 '),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 3. テキストフィールドを追加
            TextField(
              controller: _controller, // 作成したコントローラーをセット
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '渡したい文字を入力してください',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // 4. ボタンが押されたら _controller.text で入力内容を取得して渡す
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SecondScreen(message: _controller.text),
                  ),
                );
              },
              child: const Text('2番目の画面へ進む →'),
            ),
          ],
        ),
      ),
    );
  }
}

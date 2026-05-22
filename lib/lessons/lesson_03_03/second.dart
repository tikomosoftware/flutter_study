import 'package:flutter/material.dart';

// --- 2番目の画面 ---
class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('03-03)2番目の画面'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 3. 受け取った文字列を画面に表示
            Text('受け取った文字: $message', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('← 最初の画面に戻る'),
            ),
          ],
        ),
      ),
    );
  }
}

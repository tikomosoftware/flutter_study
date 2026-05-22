import 'package:flutter/material.dart';
import 'first.dart';

// --- 2番目の画面 ---
class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('03-02)2番目の画面'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 現在の画面を閉じて前の画面に戻る
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange.shade100,
          ),
          child: const Text('← 最初の画面に戻る'),
        ),
      ),
    );
  }
}

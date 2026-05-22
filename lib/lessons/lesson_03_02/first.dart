// --- 1番目の画面 ---
import 'package:flutter/material.dart';
import 'second.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('03-02)最初の画面 '),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 2番目の画面へ遷移（積み重ねる）
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SecondScreen(),
                fullscreenDialog:
                    true, // このコードあると×ボタン、無いと←ボタン、表示エフェクトは何もからっていないような
              ),
            );
          },
          child: const Text('2番目の画面へ進む →'),
        ),
      ),
    );
  }
}

// 第4回：メイン画面（別のファイルに定義）
import 'package:flutter/material.dart';
// 他のファイルをインポートすることで、その中のクラスが使えるようになります。
import 'detail_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('メイン画面'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.home, size: 100, color: Colors.indigo),
            const SizedBox(height: 20),
            const Text(
              'この画面は main_screen.dart で\n定義されています。',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // detail_screen.dart で定義した DetailScreen を呼び出す
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DetailScreen()),
                );
              },
              child: const Text('詳細画面へ進む →'),
            ),
          ],
        ),
      ),
    );
  }
}

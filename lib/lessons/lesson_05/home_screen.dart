// 第5回：共有データを表示するメイン画面
import 'package:flutter/material.dart';
import 'app_data.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // AppData のインスタンスを取得（シングルトンなのでどこでも同じ）
  final appData = AppData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ホーム画面'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '現在のユーザー名：',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),

            // ★ ここがポイント！
            // ValueListenableBuilder は、「監視している値が変わった瞬間」に
            // その部分だけを自動で再描画してくれるウィジェットです。
            ValueListenableBuilder<String>(
              valueListenable: appData.userName, // AppData の userName を監視
              builder: (context, value, child) {
                return Text(
                  value, // 変更された後の「名前」が渡される
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                );
              },
            ),

            const SizedBox(height: 50),

            ElevatedButton.icon(
              onPressed: () {
                // プロフィール画面へ遷移
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
              icon: const Icon(Icons.person),
              label: const Text('プロフィールを編集する'),
            ),
          ],
        ),
      ),
    );
  }
}

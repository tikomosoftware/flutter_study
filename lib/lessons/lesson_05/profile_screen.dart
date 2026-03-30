// 第5回：共有データを変更するプロフィール画面
import 'package:flutter/material.dart';
import 'app_data.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // AppData のインスタンスを取得
  final appData = AppData();

  // 入力用のテキストコントローラー
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // 現在の共有値を初期値としてセットしておく
    _nameController.text = appData.userName.value;
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('プロフィール編集'),
        backgroundColor: Colors.teal.shade700,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            const Text(
              '名前を変更して保存してください：',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'ユーザー名',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.edit),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // ★ ここで共有データを更新！
                // appData.userName.value = _nameController.text と書くのと同じです
                appData.updateUserName(_nameController.text);

                // 更新したので前の画面に戻る
                Navigator.pop(context);

                // メモ：保存したことをユーザーに知らせるためにスナックバーを表示
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('名前を更新しました！')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: const Text('保存して戻る'),
            ),
          ],
        ),
      ),
    );
  }
}

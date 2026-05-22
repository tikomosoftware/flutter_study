// 第9回：ユーザー詳細画面
// 一覧画面からタップされたユーザーの情報を受け取って表示します。
// 画面間のデータの渡し方がポイントです。

import 'package:flutter/material.dart';
import 'user_model.dart';

class UserDetailScreen extends StatelessWidget {
  // ① コンストラクタでUserオブジェクトを受け取る
  // Delphiでいうフォームのプロパティに値をセットしてから Show() するイメージです。
  final User user;

  const UserDetailScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // アイコン（名前の頭文字）
            Center(
              child: CircleAvatar(
                radius: 48,
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                child: Text(user.name[0], style: const TextStyle(fontSize: 40)),
              ),
            ),
            const SizedBox(height: 32),
            // ② 各フィールドを表示するヘルパーウィジェット
            _buildRow(Icons.badge, 'ID', user.id.toString()),
            _buildRow(Icons.person, '名前', user.name),
            _buildRow(Icons.email, 'メール', user.email),
            _buildRow(Icons.cake, '年齢', '${user.age}歳'),
          ],
        ),
      ),
    );
  }

  // ③ 1行分のUIを作るプライベートメソッド
  // 同じレイアウトを繰り返すときはこうやってまとめると便利です。
  Widget _buildRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(icon, color: Colors.indigo),
          const SizedBox(width: 16),
          Text('$label：', style: const TextStyle(color: Colors.grey)),
          const SizedBox(width: 8),
          Text(value, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}

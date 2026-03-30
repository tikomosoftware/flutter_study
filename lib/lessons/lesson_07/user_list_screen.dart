// 第7回：API通信 + ListView.builderを使ったリスト表示
// レッスン6ではハードコードしたデータを表示しましたが、
// 今回はインターネット上のAPIからデータを取得して表示します。

import 'dart:convert'; // JSONの変換に使う
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // HTTPリクエスト用パッケージ
import 'user_model.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  // ① 状態を管理する変数たち
  List<User> _users = []; // 取得したユーザーリスト
  bool _isLoading = true; // 読み込み中かどうか
  String? _errorMessage; // エラーメッセージ（なければnull）

  // ② 画面が作られた時に自動で呼ばれる（Delphiの OnCreate に近い）
  @override
  void initState() {
    super.initState();
    _fetchUsers(); // APIからデータを取得
  }

  // ③ APIからユーザーデータを取得する非同期関数
  // 「async / await」は、処理の完了を待つ仕組みです。
  // Delphiでいう TTask や TThread を使った非同期処理に近いです。
  Future<void> _fetchUsers() async {
    // まずローディング状態にする
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      // HTTP GETリクエストを送信
      final url = Uri.parse(
        'https://dummy-rest-api-beta.vercel.app/api/users?page=1&limit=10&order=asc',
      );
      final response = await http.get(url);

      // ステータスコード200（成功）かチェック
      if (response.statusCode == 200) {
        // JSONをDartのMapに変換
        final Map<String, dynamic> body = jsonDecode(response.body);
        // "data" 配列を User オブジェクトのリストに変換
        final List<dynamic> data = body['data'];
        setState(() {
          _users = data.map((json) => User.fromJson(json)).toList();
          _isLoading = false;
        });
      } else {
        setState(() {
          _errorMessage = 'サーバーエラー（ステータス: ${response.statusCode}）';
          _isLoading = false;
        });
      }
    } catch (e) {
      // ネットワークエラーなど
      setState(() {
        _errorMessage = '通信エラー: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ユーザー一覧（API）'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        actions: [
          // 再読み込みボタン
          IconButton(icon: const Icon(Icons.refresh), onPressed: _fetchUsers),
        ],
      ),
      // ④ 状態に応じて表示を切り替える
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    // ローディング中
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    // エラーがあった場合
    if (_errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.red),
            const SizedBox(height: 16),
            Text(_errorMessage!, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _fetchUsers, child: const Text('再試行')),
          ],
        ),
      );
    }

    // ⑤ レッスン6と同じ ListView.builder パターンでリスト表示
    return ListView.builder(
      itemCount: _users.length,
      itemBuilder: (context, index) {
        final user = _users[index];

        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            // ユーザーのアイコン（名前の頭文字を表示）
            leading: CircleAvatar(
              backgroundColor: Colors.indigo,
              foregroundColor: Colors.white,
              child: Text(user.name[0]),
            ),
            // 名前
            title: Text(user.name),
            // メールアドレスと年齢
            subtitle: Text('${user.email}  ・  ${user.age}歳'),
          ),
        );
      },
    );
  }
}

// 第9回：ユーザー一覧画面
// レッスン8からの変更点は onTap の中身だけです。
// タップしたら詳細画面に遷移するようにします。

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'user_model.dart';
import 'user_detail_screen.dart'; // ← 追加

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  List<User> _users = [];
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final dio = Dio();
      final response = await dio.get(
        'https://dummy-rest-api-beta.vercel.app/api/users?page=1&limit=10&order=asc',
      );

      if (response.statusCode == 200) {
        final body = response.data as Map<String, dynamic>;
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
    } on DioException catch (e) {
      setState(() {
        _errorMessage = '通信エラー: ${e.message}';
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = '予期しないエラー: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ユーザー一覧'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _fetchUsers),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

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

    return ListView.builder(
      itemCount: _users.length,
      itemBuilder: (context, index) {
        final user = _users[index];

        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.indigo,
              foregroundColor: Colors.white,
              child: Text(user.name[0]),
            ),
            title: Text(user.name),
            subtitle: Text('${user.email}  ・  ${user.age}歳'),
            // ① 右端に「>」アイコンを表示して、タップできることを示す
            trailing: const Icon(Icons.chevron_right),
            // ② タップしたら詳細画面に遷移する
            // Navigator.push はレッスン4で学んだ画面遷移の方法です。
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  // ③ タップされたユーザーオブジェクトをそのまま渡す
                  builder: (context) => UserDetailScreen(user: user),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

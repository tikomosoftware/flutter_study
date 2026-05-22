// 第8回：API通信 + ListView.builderを使ったリスト表示
// レッスン7（httpパッケージ）を dio パッケージに書き換える練習です。
//
// TODO: 以下の手順で dio に書き換えてみましょう
//
// ① pubspec.yaml に dio を追加する
//      dio: ^5.0.0
//    追加したら `flutter pub get` を実行
//
// ② このファイルの import を書き換える
//    変更前:
//      import 'dart:convert';
//      import 'package:http/http.dart' as http;
//    変更後:
//      import 'package:dio/dio.dart';
//
// ③ _fetchUsers() の中身を書き換える
//    変更前（http）:
//      final url = Uri.parse('https://...');
//      final response = await http.get(url);
//      if (response.statusCode == 200) {
//        final body = jsonDecode(response.body);
//        ...
//      }
//    変更後（dio）:
//      final dio = Dio();
//      final response = await dio.get('https://...');
//      // dio は自動でJSONをパースしてくれるので jsonDecode 不要！
//      final body = response.data as Map<String, dynamic>;
//      ...
//
// ④ エラーハンドリングを書き換える
//    変更前:
//      } catch (e) {
//    変更後（dio専用の例外クラスが使える）:
//      } on DioException catch (e) {

// import 'dart:convert'; // ← ② で削除する
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http; // ← ② で書き換える
// import 'package:dio/dio.dart' as dia; // dio はクラス名の衝突が起きにくいので、通常はエイリアスなしで使います。
import 'package:dio/dio.dart';
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
      // dio は Uri.parse() 不要で、URLの文字列をそのまま渡せる

      // case1)
      // final dio = Dio();
      // final response = await dio.get(
      //   'https://dummy-rest-api-beta.vercel.app/api/users?page=1&limit=10&order=asc',
      // );

      // case2)
      final String url =
          'https://dummy-rest-api-beta.vercel.app/api/users?page=1&limit=10&order=asc';
      final dio = Dio();
      final response = await dio.get(url);

      // ステータスコード200（成功）かチェック
      if (response.statusCode == 200) {
        // JSONをDartのMapに変換
        // final Map<String, dynamic> body = jsonDecode(response.body);

        final body = response.data; // もうMapになってる

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
    } on DioException catch (e) {
      // ネットワークエラーなど
      setState(() {
        _errorMessage = '通信エラー: $e';
        _isLoading = false;
      });
    } catch (e) {
      // それ以外の予期しないエラー（JSONパース失敗など）
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

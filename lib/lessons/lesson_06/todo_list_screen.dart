// 第6回：ListView.builderを使ったリスト表示
import 'package:flutter/material.dart';
import 'todo_model.dart'; // さっき作ったモデルをインポート

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  // ① Todoデータのリスト（初期データ）
  final List<Todo> _todos = [
    Todo(title: '買い物（牛乳、卵）'),
    Todo(title: 'Flutterの練習（リスト表示）'),
    Todo(title: 'Delphiのコードを見直す', isDone: true),
    Todo(title: '散歩する'),
    Todo(title: '本を読む'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todoリスト'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      // ② ListView.builder で効率的に表示
      body: ListView.builder(
        itemCount: _todos.length, // リストの個数を指定
        itemBuilder: (context, index) {
          // 下記の一行が「個数分」繰り返されます
          final todo = _todos[index];

          // ③ ListTile を使ってきれいに表示
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(15), // 角を丸く
              // ),
              // tileColor: Colors.blue.withOpacity(0.05), // ほんのり色をつける
              leading: Icon(
                todo.isDone ? Icons.check_circle : Icons.radio_button_unchecked,
                color: todo.isDone ? Colors.green : Colors.grey,
              ),
              title: Text(
                todo.title,
                style: TextStyle(
                  // 完了していたら打ち消し線を引く
                  decoration: todo.isDone ? TextDecoration.lineThrough : null,
                  color: todo.isDone ? Colors.grey : Colors.black,
                ),
              ),
              // ④ タップした時の処理
              onTap: () {
                setState(() {
                  // ステータスを反転させる
                  todo.isDone = !todo.isDone;
                });
              },
            ),
          );
        },
      ),
    );
  }
}

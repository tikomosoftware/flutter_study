// 第6回：モデルクラスの定義
// Delphiでいう「レコード型」や「クラス」の定義に相当します。

class Todo {
  final String title;    // Todoのタイトル
  bool isDone;           // 完了したかどうか（可変にするため final はつけない）

  // コンストラクタ（初期化のための関数）
  Todo({
    required this.title,
    this.isDone = false, // デフォルトは「未完了」
  });
}

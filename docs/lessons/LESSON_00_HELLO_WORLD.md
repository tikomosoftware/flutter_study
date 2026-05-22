# 第0回：はじめてのHello World（StatelessWidget）の解説

最初のレッスンでは、Flutterアプリの最も基本的な構造と、静的な（変化しない）画面を作る方法を学びました。

## 📍 このレッスンのポイント

### 1. StatelessWidget（ステートレス・ウィジェット）
「ステート（状態）を持たない」ウィジェットです。一度画面に表示されたら、アプリ側から中身を書き換えることがない画面に使います。

### 2. アプリの構成要素
Flutterの画面は、小さな部品（ウィジェット）を組み合わせて作ります。

- **`MaterialApp`**: アプリ全体の共通設定（テーマ、タイトルなど）を管理する一番外側の枠組みです。
- **`Scaffold`**: 画面の「足場」となるウィジェットです。上部のタイトルバーや、中央のコンテンツエリアなどの配置場所を提供します。
- **`AppBar`**: 画面上部のタイトルバーです。
- **`Center`**: 子要素を画面の中央に配置するためのウィジェットです。
- **`Text`**: 文字を表示するためのウィジェットです。

## 🧪 実際に試したウィジェット

### Container
汎用的なボックスウィジェットです。色・サイズ・余白などを自由に設定できます。
- `color` で背景色を指定できます
- `width: double.infinity` / `height: double.infinity` で親の最大サイズいっぱいに広げられます
- `child` に別のウィジェットを入れて入れ子にできます

```dart
Container(
  color: Colors.red,
  width: double.infinity,
  height: double.infinity,
  child: Center(
    child: Text('Hello', style: TextStyle(color: Colors.white)),
  ),
)
```

### Column
子ウィジェットを縦方向（上から下）に並べます。
- `children` リストに入れた順番に上から配置されます
- 特定の子だけ `Container` で囲むと、その要素だけ色などを個別に設定できます

```dart
Column(
  children: [
    Text('data'),
    Container(
      color: Colors.yellow,
      child: Text('data', style: TextStyle(color: Colors.red)),
    ),
    Text('data'),
  ],
)
```

### Row
子ウィジェットを横方向（左から右）に並べます。Column の横版です。

```dart
Row(
  children: [
    Text('data'),
    Text('data'),
    Text('data'),
  ],
)
```

## 💡 便利なウィジェット
- **`FloatingActionButton`**: 画面の右下に浮いている丸いボタンです。`onPressed` にコールバックを渡すと押したときの処理を書けます。StatelessWidget なので画面は変わりませんが、`debugPrint` でログ出力はできます。

## ✅ このレッスンのチェックポイント
- [ ] すべての画面要素が「ウィジェット」という単位で構成されていることを理解した。
- [ ] `MaterialApp` -> `Scaffold` -> `AppBar` / `body` という入れ子構造を理解した。
- [ ] `StatelessWidget` は一度表示されると勝手に書き換わらないことを理解した。
- [ ] `Container` で背景色・サイズを設定できることを理解した。
- [ ] `Column` で縦並び、`Row` で横並びにできることを理解した。

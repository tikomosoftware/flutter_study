# 第9回：詳細画面への遷移（データの受け渡し）の解説

レッスン8までで「APIからデータを取得してリスト表示」ができるようになりました。
今回は、リストの項目をタップしたら詳細画面に遷移し、選択したデータを表示する方法を学びます。

## 📍 このレッスンのポイント

### 1. 一覧画面から詳細画面へのデータ渡し
リストのアイテムをタップしたとき、そのデータを次の画面に渡します。

```dart
onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      // タップされたユーザーオブジェクトをそのまま渡す
      builder: (context) => UserDetailScreen(user: user),
    ),
  );
}
```

Delphiでいうと、フォームのプロパティに値をセットしてから `Show()` するイメージです。

### 2. 詳細画面でデータを受け取る
コンストラクタの `required` パラメータでデータを受け取ります。

```dart
class UserDetailScreen extends StatelessWidget {
  final User user; // 受け取ったデータを保持するフィールド

  const UserDetailScreen({super.key, required this.user});
}
```

`required` を付けることで、呼び出し側が必ずデータを渡すことを強制できます。

### 3. trailing と onTap でタップ可能なリストを作る

```dart
ListTile(
  // 右端に「>」アイコンを表示して、タップできることを示す
  trailing: const Icon(Icons.chevron_right),
  // タップしたら詳細画面に遷移する
  onTap: () { ... },
)
```

`trailing` に矢印アイコンを置くことで、ユーザーに「タップできる」ことを視覚的に伝えます。

### 4. ヘルパーメソッドでUIの繰り返しをまとめる
同じレイアウトを何度も書く代わりに、プライベートメソッドにまとめます。

```dart
Widget _buildRow(IconData icon, String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: Row(
      children: [
        Icon(icon, color: Colors.indigo),
        const SizedBox(width: 16),
        Text('$label：'),
        const SizedBox(width: 8),
        Text(value),
      ],
    ),
  );
}
```

これにより、各フィールドの表示を1行で呼び出せます：
```dart
_buildRow(Icons.person, '名前', user.name),
_buildRow(Icons.email, 'メール', user.email),
```

## 💡 Delphiエンジニアへのアドバイス
Delphiでは「一覧フォーム → 詳細フォーム」の遷移で、グローバル変数やフォームのプロパティを使ってデータを渡していました。
Flutterではコンストラクタ引数で渡すのが基本パターンです。これにより：
- どのデータが必要かが明確になる（`required` で強制）
- グローバル変数を使わないので副作用が起きにくい
- テストもしやすい

また、`_buildRow` のようなヘルパーメソッドは、Delphiでいう「共通のパネル生成関数」に相当します。
同じUIパターンが3回以上出てきたらメソッドに切り出す、というのは良い習慣です。

## ✅ このレッスンのチェックポイント
- [ ] `Navigator.push` でオブジェクトを次の画面に渡せるようになった。
- [ ] コンストラクタの `required` パラメータでデータを受け取る方法を理解した。
- [ ] `ListTile` の `onTap` と `trailing` を使ってタップ可能なリストが作れた。
- [ ] ヘルパーメソッドでUIの繰り返しをまとめる方法を覚えた。
- [ ] 一覧→詳細の画面遷移パターンを実装できた。

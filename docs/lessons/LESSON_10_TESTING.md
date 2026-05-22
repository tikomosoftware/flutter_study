# 第10回：テストの書き方（ユニットテスト＆ウィジェットテスト）の解説

アプリが大きくなると「この変更で他の部分が壊れていないか？」が心配になります。
テストを書いておけば、コマンド一発で自動的に確認できます。
今回は Flutter のテストの基本を学びます。

## 📍 このレッスンのポイント

### 1. テストの種類

| 種類 | 何をテストするか | 速度 | Delphiでいうと |
|:---|:---|:---|:---|
| **ユニットテスト** | ロジック（計算、変換） | 超高速 | DUnit |
| **ウィジェットテスト** | UIの動作（タップ、表示） | 高速 | フォームの自動操作テスト |
| **統合テスト** | アプリ全体の動作 | 遅い | 実機テスト |

今回はユニットテストとウィジェットテストを学びます。

### 2. テストの実行方法

```bash
# 特定のテストファイルだけ実行
flutter test test/lessons/lesson_10/user_model_test.dart

# 特定のフォルダ内のテストを全部実行
flutter test test/lessons/lesson_10/

# プロジェクト内の全テストを実行
flutter test
```

### 3. テストファイルの置き場所

```
hello_world/
├── lib/                          ← アプリのコード
│   └── lessons/lesson_10/
│       ├── user_model.dart       ← テスト対象
│       └── counter_widget.dart   ← テスト対象
└── test/                         ← テストコード
    └── lessons/lesson_10/
        ├── user_model_test.dart      ← ユニットテスト
        └── counter_widget_test.dart  ← ウィジェットテスト
```

ルール：
- テストファイルは `test/` フォルダに置く
- ファイル名は `_test.dart` で終わる
- `lib/` のフォルダ構造と対応させると分かりやすい

### 4. ユニットテストの書き方

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:hello_world/lessons/lesson_10/user_model.dart';

void main() {
  // group: テストをグループ化する
  group('User.fromJson', () {
    // test: 1つのテストケース
    test('正しいJSONからUserオブジェクトを生成できる', () {
      // Arrange（準備）
      final json = {'id': 1, 'name': '田中', 'email': 'a@b.com', 'age': 25};

      // Act（実行）
      final user = User.fromJson(json);

      // Assert（検証）
      expect(user.name, '田中');
      expect(user.age, 25);
    });
  });
}
```

**AAA パターン（テストの基本構造）：**
- **Arrange（準備）** — テスト用のデータを用意する
- **Act（実行）** — テスト対象のメソッドを呼ぶ
- **Assert（検証）** — 結果が期待通りか確認する

### 5. ウィジェットテストの書き方

```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hello_world/lessons/lesson_10/counter_widget.dart';

void main() {
  testWidgets('＋ボタンを押すとカウントが1増える', (WidgetTester tester) async {
    // Arrange: ウィジェットを描画する
    await tester.pumpWidget(const MaterialApp(home: CounterWidget()));

    // Act: ボタンをタップして画面を更新
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Assert: 表示が変わったか確認
    expect(find.text('1'), findsOneWidget);
  });
}
```

**ウィジェットテストの重要メソッド：**

| メソッド | 役割 |
|:---|:---|
| `tester.pumpWidget()` | ウィジェットを描画する（最初に1回） |
| `tester.tap()` | タップ操作をシミュレート |
| `tester.pump()` | 画面を再描画する（setState の反映） |
| `find.text('文字')` | 画面内のテキストを探す |
| `find.byIcon(Icons.add)` | 画面内のアイコンを探す |
| `expect(finder, findsOneWidget)` | 1つ見つかることを検証 |
| `expect(finder, findsNothing)` | 見つからないことを検証 |

### 6. よく使う expect のマッチャー

```dart
expect(value, 1);              // 値が1であること
expect(value, isTrue);         // true であること
expect(value, isFalse);        // false であること
expect(value, isNull);         // null であること
expect(value, isNotNull);      // null でないこと
expect(list, isEmpty);         // リストが空であること
expect(list, hasLength(3));    // リストの長さが3であること
expect(() => func(), throwsA(isA<TypeError>())); // 例外が投げられること
```

## 💡 Delphiエンジニアへのアドバイス

Delphiの DUnit では `CheckEquals(Expected, Actual)` と書いていましたが、
Flutter では `expect(actual, expected)` と**実際の値が先**に来ます。順番に注意してください。

また、ウィジェットテストは実機やエミュレータが不要で、数秒で完了します。
Delphiでフォームのテストを書こうとすると大変でしたが、Flutter ではとても簡単です。

テストを書く習慣をつけると：
- リファクタリング（コードの整理）が怖くなくなる
- バグの再発を防げる
- 「この関数は何をするものか」がテストを読めば分かる

## ✅ このレッスンのチェックポイント
- [ ] `flutter test` コマンドでテストを実行できた。
- [ ] `test()` でユニットテストが書けるようになった。
- [ ] `testWidgets()` でウィジェットテストが書けるようになった。
- [ ] AAA パターン（Arrange / Act / Assert）を理解した。
- [ ] `expect()` で値の検証ができるようになった。
- [ ] `find.text()` や `find.byIcon()` でUI要素を探せるようになった。
- [ ] `tester.tap()` と `tester.pump()` でUIの操作をシミュレートできた。

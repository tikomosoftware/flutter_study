# 第5回：アプリ全体でのデータ共有（State Management）の解説

複数の画面で一つのデータ（例：ログインユーザー名や設定値）を共有し、一箇所を書き換えたら全ての画面が自動的に更新される仕組みを学びます。

## 📍 このレッスンの構成

1.  **データ管理 ([app_data.dart](file:///c:/Projects/study_Flutter/hello_world/lib/lessons/lesson_05/app_data.dart))**:
    - **シングルトン**: `AppData()` と呼ぶだけで、常に「世界に一つだけの同じ実体」を返します。
    - **ValueNotifier**: 値が変わった時に「通知」を行う特別な箱です。
2.  **表示画面 ([home_screen.dart](file:///c:/Projects/study_Flutter/hello_world/lib/lessons/lesson_05/home_screen.dart))**:
    - **ValueListenableBuilder**: `ValueNotifier` を監視し、通知が来たらその部分だけを自動で描き直します。
3.  **編集画面 ([profile_screen.dart](file:///c:/Projects/study_Flutter/hello_world/lib/lessons/lesson_05/profile_screen.dart))**:
    - 共有データを書き換えます。書き換え操作をした瞬間に、ホーム画面側も自動で更新の準備が整います。

## 💡 シングルトン（Singleton）とは？

「このクラスのインスタンス（実体）は、アプリの中で絶対に一つしか作りません」というデザインパターンの名前です。

```dart
// シングルトンの書き方
static final AppData _instance = AppData._internal();
factory AppData() => _instance;
AppData._internal();
```

これによって、`main.dart` から呼んでも `home_screen.dart` から呼んでも、指している「メモ帳」は全く同じものになります。

## ✅ このレッスンのチェックポイント
- [ ] 画面をまたいでデータを共有する方法（Singleton）を理解した。
- [ ] `ValueNotifier` で値の変更を通知できることを理解した。
- [ ] `ValueListenableBuilder` で自動的に UI が書き換わる様子を確認した。

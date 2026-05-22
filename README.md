# Flutter 学習プロジェクト

Flutter の基礎からデータ共有、リスト表示まで、ステップバイステップで学ぶためのプロジェクトです。

## 🚀 使い方（セットアップと実行）

このプロジェクトを動かすための基本的な手順です。

### 1. 依存関係のインストール
プロジェクトを開いたら、ターミナルで以下のコマンドを実行してライブラリをダウンロードしてください。

```bash
flutter pub get
```

### 2. アプリの起動（ウェブブラウザやデスクトップ）
以下のコマンドで、好きな環境でアプリを起動できます。パソコンのウェブブラウザで動かすのが一番簡単でおすすめです。

```bash
# Google Chrome で実行する場合（一番おすすめ）
flutter run -d chrome

# Microsoft Edge で実行する場合
flutter run -d edge

# ブラウザを問わずにウェブサーバーを立ち上げる場合
flutter run -d web-server

# Windowsアプリ（デスクトップアプリ）として実行する場合
flutter run -d windows
```

> [!TIP]
> 実行可能なデバイスの一覧は、ターミナルで `flutter devices` と打つと確認できます。ブラウザがインストールされていれば、そこに表示されます。


## 📝 レッスンの切り替え方

このプロジェクトでは、1つのアプリの中で各レッスンのプログラムを切り替えて動作させるようにしています。
**表示される画面を変更したい場合は、以下の手順でファイルを編集してください。**

1.  **[lib/main.dart](file:///c:/Projects/study_Flutter/hello_world/lib/main.dart)** を開く。
2.  一番上の **`import`** 部分で、実行したいレッスンの行のコメントアウト（`//`）を外し、他の行をコメントアウトする。
3.  真ん中の **`runApp`** 部分で、同じレッスンの行のコメントアウトを外し、他の行をコメントアウトする。

> [!TIP]
> 編集後、ターミナルで `r`（ホットリロード）または `R`（ホットリスタート）を押すと、画面が新しいレッスンに切り替わります。

## 📚 各レッスンの内容

| レッスン | テーマ | 解説資料 | ソースコード |
| :--- | :--- | :--- | :--- |
| **Lesson 0** | Hello World | [解説はこちら](docs/lessons/LESSON_00_HELLO_WORLD.md) | [lesson_00_hello_world.dart](lib/lessons/lesson_00_hello_world.dart) |
| **Lesson 1** | カウンター（状態管理） | [解説はこちら](docs/lessons/LESSON_01_COUNTER.md) | [lesson_01_counter.dart](lib/lessons/lesson_01_counter.dart) |
| **Lesson 2** | ダイアログとテキスト入力 | [解説はこちら](docs/lessons/LESSON_02_DIALOG.md) | [lesson_02_dialog.dart](lib/lessons/lesson_02_dialog.dart) |
| **Lesson 3** | 画面遷移（Navigation） | [解説はこちら](docs/lessons/LESSON_03_NAVIGATION.md) | [lesson_03_navigation.dart](lib/lessons/lesson_03_navigation.dart) |
| **Lesson 4** | ファイル分割 | [解説はこちら](docs/lessons/LESSON_04_FILE_SPLITTING.md) | [lesson_04/](lib/lessons/lesson_04/) |
| **Lesson 5** | データ共有（Provider） | [解説はこちら](docs/lessons/LESSON_05_DATA_SHARING.md) | [lesson_05/](lib/lessons/lesson_05/) |
| **Lesson 6** | リスト表示（ListView） | [解説はこちら](docs/lessons/LESSON_06_LISTVIEW.md) | [lesson_06/](lib/lessons/lesson_06/) |
| **Lesson 7** | API通信 + リスト表示（http） | [解説はこちら](docs/lessons/LESSON_07_API_HTTP.md) | [lesson_07/](lib/lessons/lesson_07/) |
| **Lesson 8** | API通信（dioに書き換え） | [解説はこちら](docs/lessons/LESSON_08_API_DIO.md) | [lesson_08/](lib/lessons/lesson_08/) |
| **Lesson 9** | 詳細画面への遷移（データ渡し） | [解説はこちら](docs/lessons/LESSON_09_DETAIL_SCREEN.md) | [lesson_09/](lib/lessons/lesson_09/) |
| **Lesson 10** | テストの書き方 | [解説はこちら](docs/lessons/LESSON_10_TESTING.md) | [lesson_10/](lib/lessons/lesson_10/) + [test/](test/lessons/lesson_10/) |

## 🛠 その他の資料
- [トラブルシューティング](TROUBLESHOOTING.md): エラーが出たときの対処法
- [Q & A](Q_AND_A.md): よくある質問と回答
- [ナビゲーションの考え方](FLUTTER_NAVIGATION_CONCEPT.md): 画面遷移の仕組みについて



# 第7回：API通信 + リスト表示（httpパッケージ）の解説

レッスン6ではハードコードしたデータをリスト表示しましたが、今回はインターネット上のAPIからデータを取得して表示します。
実際のアプリ開発では、サーバーからデータを取得して画面に表示するパターンが非常に多いため、ここで基本を押さえます。

## 📍 このレッスンのポイント

### 1. httpパッケージによるAPI通信
`package:http` はFlutterで最も基本的なHTTP通信ライブラリです。

```dart
import 'package:http/http.dart' as http;

final url = Uri.parse('https://example.com/api/users');
final response = await http.get(url);
```

- `Uri.parse()` でURLを作成する
- `http.get()` でGETリクエストを送信する
- `response.statusCode` でHTTPステータスコードを確認する
- `response.body` でレスポンスの本文（JSON文字列）を取得する

### 2. JSONのパース（dart:convert）
APIから返ってくるのはJSON文字列なので、Dartのオブジェクトに変換する必要があります。

```dart
import 'dart:convert';

final Map<String, dynamic> body = jsonDecode(response.body);
final List<dynamic> data = body['data'];
```

### 3. async / await（非同期処理）
API通信は時間がかかるため、非同期で実行します。
Delphiでいう `TTask` や `TThread` を使った非同期処理に近い概念です。

```dart
Future<void> _fetchUsers() async {
  final response = await http.get(url); // ← ここで通信完了を待つ
}
```

- `async` を付けた関数の中で `await` が使える
- `await` は処理が完了するまで待ってから次の行に進む
- 画面はフリーズせず、裏で通信が行われる

### 4. ローディング・エラー状態の管理
通信中は「読み込み中」を表示し、失敗したら「エラー」を表示する、という状態管理パターンです。

```dart
bool _isLoading = true;
String? _errorMessage;
```

状態に応じて表示を切り替えることで、ユーザーに今何が起きているかを伝えます。

### 5. モデルクラスの factory コンストラクタ
JSONデータをDartオブジェクトに変換する専用のコンストラクタです。

```dart
factory User.fromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as int,
    name: json['name'] as String,
    email: json['email'] as String,
    age: json['age'] as int,
  );
}
```

Delphiでいう「クラスメソッド」に近い概念で、JSONのMapを受け取ってオブジェクトを生成します。

## 💡 Delphiエンジニアへのアドバイス
Delphiでは `TIdHTTP` や `TRESTClient` でAPI通信をしていましたが、Flutterでは `http.get()` 一行で済みます。
また、Delphiでは `TJSONObject` でパースしていたJSON処理も、`jsonDecode()` で簡単にMapに変換できます。
非同期処理は `TTask.Run` に近いですが、`async/await` のおかげでコールバック地獄にならず、同期的に読めるコードが書けます。

## ✅ このレッスンのチェックポイント
- [ ] `http.get()` でAPIからデータを取得できるようになった。
- [ ] `jsonDecode()` でJSON文字列をDartのMapに変換できた。
- [ ] `async / await` の仕組みを理解した。
- [ ] ローディング中・エラー時・成功時の3つの状態を切り替えて表示できた。
- [ ] `factory` コンストラクタでJSONからモデルオブジェクトを生成できた。

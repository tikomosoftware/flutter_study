# 第8回：API通信をdioパッケージに書き換える解説

レッスン7で使った `http` パッケージを、より高機能な `dio` パッケージに書き換える練習です。
実際の開発では dio の方がよく使われるため、両方知っておくと便利です。

## 📍 このレッスンのポイント

### 1. httpとdioの違い

| 項目 | http | dio |
|:---|:---|:---|
| URL指定 | `Uri.parse()` が必要 | 文字列をそのまま渡せる |
| JSONパース | `jsonDecode()` で手動変換 | 自動でMapに変換してくれる |
| エラーハンドリング | 汎用の `catch (e)` | 専用の `DioException` が使える |
| 機能 | シンプル | インターセプター、タイムアウト、リトライなど豊富 |

### 2. dioの基本的な使い方

```dart
import 'package:dio/dio.dart';

final dio = Dio();
final response = await dio.get('https://example.com/api/users');

// response.data はすでにMap（jsonDecode不要！）
final body = response.data as Map<String, dynamic>;
```

### 3. 書き換えのポイント（httpからdio）

**import の変更:**
```dart
// 変更前
import 'dart:convert';
import 'package:http/http.dart' as http;

// 変更後
import 'package:dio/dio.dart';
```

**リクエスト部分の変更:**
```dart
// 変更前（http）
final url = Uri.parse('https://...');
final response = await http.get(url);
final body = jsonDecode(response.body);

// 変更後（dio）
final dio = Dio();
final response = await dio.get('https://...');
final body = response.data; // もうMapになってる！
```

**エラーハンドリングの変更:**
```dart
// 変更前
} catch (e) {

// 変更後（dio専用の例外を先にキャッチ）
} on DioException catch (e) {
  // ネットワークエラー、タイムアウトなど
} catch (e) {
  // それ以外の予期しないエラー
}
```

### 4. DioExceptionの利点
`DioException` はエラーの種類を細かく分類してくれます：
- `DioExceptionType.connectionTimeout` — 接続タイムアウト
- `DioExceptionType.receiveTimeout` — 受信タイムアウト
- `DioExceptionType.badResponse` — サーバーがエラーを返した
- `DioExceptionType.connectionError` — ネットワーク接続エラー

## 💡 Delphiエンジニアへのアドバイス
Delphiでいうと、`TIdHTTP`（シンプル）から `TRESTClient`（高機能）に乗り換えるイメージです。
dio はインターセプター（リクエスト前後に処理を挟む仕組み）があるので、認証トークンの自動付与やログ出力などが簡単にできます。
小さなアプリなら http で十分ですが、規模が大きくなったら dio に移行するのが一般的です。

## ✅ このレッスンのチェックポイント
- [ ] `pubspec.yaml` に `dio` を追加して `flutter pub get` できた。
- [ ] `http` のコードを `dio` に書き換えられた。
- [ ] `jsonDecode` が不要になる理由を理解した。
- [ ] `DioException` でエラーハンドリングできた。
- [ ] http と dio の違いを説明できるようになった。

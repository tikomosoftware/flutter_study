// 第10回：ユニットテスト（モデルクラスのテスト）
//
// ユニットテストとは？
// → UIを使わず、ロジック（計算や変換）が正しく動くかを確認するテストです。
// Delphiでいう DUnit に相当します。
//
// 実行方法：
//   flutter test test/lessons/lesson_10/user_model_test.dart
//
// 全テスト実行：
//   flutter test

import 'package:flutter_test/flutter_test.dart';
import 'package:hello_world/lessons/lesson_10/user_model.dart';

void main() {
  // ─────────────────────────────────────────────
  // group: テストをグループ化して整理する
  // Delphiでいう「テストスイート」に近い概念です。
  // ─────────────────────────────────────────────
  group('User.fromJson', () {
    // ① 正常系：正しいJSONからUserオブジェクトが作れるか
    test('正しいJSONからUserオブジェクトを生成できる', () {
      // Arrange（準備）: テスト用のデータを用意する
      final json = {
        'id': 1,
        'name': '田中太郎',
        'email': 'tanaka@example.com',
        'age': 25,
      };

      // Act（実行）: テスト対象のメソッドを呼ぶ
      final user = User.fromJson(json);

      // Assert（検証）: 結果が期待通りか確認する
      expect(user.id, 1);
      expect(user.name, '田中太郎');
      expect(user.email, 'tanaka@example.com');
      expect(user.age, 25);
    });

    // ② 異常系：型が違うJSONを渡したらエラーになるか
    test('型が不正なJSONを渡すとエラーになる', () {
      final invalidJson = {
        'id': '文字列', // int であるべき
        'name': '田中太郎',
        'email': 'tanaka@example.com',
        'age': 25,
      };

      // expect の中で throwsA を使うと「例外が投げられること」を検証できる
      expect(() => User.fromJson(invalidJson), throwsA(isA<TypeError>()));
    });

    // ③ 異常系：必要なキーが欠けているJSONを渡したらエラーになるか
    test('必要なキーが欠けているとエラーになる', () {
      final incompleteJson = {
        'id': 1,
        'name': '田中太郎',
        // 'email' が欠けている
        // 'age' が欠けている
      };

      expect(() => User.fromJson(incompleteJson), throwsA(isA<TypeError>()));
    });
  });

  group('User.toJson', () {
    // ④ toJson が正しいMapを返すか
    test('UserオブジェクトからJSONのMapに変換できる', () {
      final user = User(
        id: 1,
        name: '田中太郎',
        email: 'tanaka@example.com',
        age: 25,
      );

      final json = user.toJson();

      expect(json['id'], 1);
      expect(json['name'], '田中太郎');
      expect(json['email'], 'tanaka@example.com');
      expect(json['age'], 25);
    });

    // ⑤ fromJson → toJson の往復変換が正しいか（ラウンドトリップテスト）
    test('fromJson → toJson で元のデータに戻る', () {
      final originalJson = {
        'id': 42,
        'name': '佐藤花子',
        'email': 'sato@example.com',
        'age': 30,
      };

      final user = User.fromJson(originalJson);
      final resultJson = user.toJson();

      expect(resultJson, originalJson);
    });
  });

  group('User のプロパティ', () {
    // ⑥ isAdult の判定テスト
    test('18歳以上なら isAdult が true', () {
      final adult = User(id: 1, name: 'テスト', email: 'a@b.com', age: 18);
      expect(adult.isAdult, isTrue);
    });

    test('17歳以下なら isAdult が false', () {
      final minor = User(id: 2, name: 'テスト', email: 'a@b.com', age: 17);
      expect(minor.isAdult, isFalse);
    });

    // ⑦ displayName のテスト
    test('displayName は「名前 さん」の形式になる', () {
      final user = User(id: 1, name: '田中', email: 'a@b.com', age: 20);
      expect(user.displayName, '田中 さん');
    });
  });
}

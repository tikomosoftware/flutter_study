// 第10回：ウィジェットテスト（UIのテスト）
//
// ウィジェットテストとは？
// → 実際にウィジェットを描画して、ボタンを押したり文字を確認したりするテストです。
// Delphiでいう「フォームの自動操作テスト」に近いです。
// 実機やエミュレータは不要で、テスト環境内で高速に動きます。
//
// 実行方法：
//   flutter test test/lessons/lesson_10/counter_widget_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hello_world/lessons/lesson_10/counter_widget.dart';

void main() {
  // ─────────────────────────────────────────────
  // testWidgets: ウィジェットテスト専用の関数
  // tester: ウィジェットを操作するためのヘルパー
  // ─────────────────────────────────────────────

  group('CounterWidget', () {
    // ① 初期状態のテスト：画面に「0」が表示されているか
    testWidgets('初期値は 0 が表示される', (WidgetTester tester) async {
      // Arrange: ウィジェットを描画する
      // MaterialApp で囲むのがポイント（テーマやナビゲーションが必要なため）
      await tester.pumpWidget(const MaterialApp(home: CounterWidget()));

      // Assert: 「0」というテキストが画面にあるか確認
      expect(find.text('0'), findsOneWidget);
    });

    // ② プラスボタンを押したらカウントが増えるか
    testWidgets('＋ボタンを押すとカウントが1増える', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: CounterWidget()));

      // Act: プラスアイコンのボタンをタップ
      await tester.tap(find.byIcon(Icons.add));
      // pump() で画面を再描画させる（setState の反映を待つ）
      await tester.pump();

      // Assert: 「1」が表示されているか
      expect(find.text('1'), findsOneWidget);
      expect(find.text('0'), findsNothing);
    });

    // ③ マイナスボタンを押したらカウントが減るか
    testWidgets('－ボタンを押すとカウントが1減る', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: CounterWidget()));

      // Act: マイナスアイコンのボタンをタップ
      await tester.tap(find.byIcon(Icons.remove));
      await tester.pump();

      // Assert: 「-1」が表示されているか
      expect(find.text('-1'), findsOneWidget);
    });

    // ④ リセットボタンを押したら0に戻るか
    testWidgets('リセットボタンを押すと0に戻る', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: CounterWidget()));

      // まず2回プラスを押して「2」にする
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
      expect(find.text('2'), findsOneWidget);

      // Act: リセットボタンをタップ
      await tester.tap(find.byIcon(Icons.refresh));
      await tester.pump();

      // Assert: 「0」に戻っているか
      expect(find.text('0'), findsOneWidget);
    });

    // ⑤ 複数回操作のテスト
    testWidgets('プラスを3回押すと3になる', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: CounterWidget()));

      // 3回タップ
      for (int i = 0; i < 3; i++) {
        await tester.tap(find.byIcon(Icons.add));
        await tester.pump();
      }

      // Assert
      expect(find.text('3'), findsOneWidget);
    });

    // ⑥ UIの存在確認テスト
    testWidgets('必要なUI要素が全て表示されている', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: CounterWidget()));

      // 「カウント:」というラベルがあるか
      expect(find.text('カウント:'), findsOneWidget);

      // 3つのボタン（アイコン）があるか
      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.byIcon(Icons.remove), findsOneWidget);
      expect(find.byIcon(Icons.refresh), findsOneWidget);

      // AppBar のタイトルがあるか
      expect(find.text('カウンター'), findsOneWidget);
    });
  });
}

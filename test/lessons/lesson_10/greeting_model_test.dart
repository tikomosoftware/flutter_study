// greeting_model.dart に対するユニットテスト
// ここに自分でテストを書いてみましょう！

import 'package:flutter_test/flutter_test.dart';
import 'package:hello_world/lessons/lesson_10/greeting_model.dart';

void main() {
  // 例：hello() が正しい文字列を返すかテスト
  test('hello() は「Hello HogeHoge」を返す', () {
    final model = GreetingModel(name: 'HogeHoge');
    expect(model.hello(), 'Hello HogeHoge');
  });

  test('hello() は「Hello HugaHuga', () {
    final model = GreetingModel(name: 'HugaHuga');
    expect(model.hello(), 'Hello HugaHuga');
  });

  // ↓ ここから自分で書いてみてください！
  // nameLength や isEmpty のテストを追加してみましょう

  test('nameLength は名前の文字数を返す', () {
    final model = GreetingModel(name: 'HogeHoge');
    expect(model.nameLength, 8);
  });
}

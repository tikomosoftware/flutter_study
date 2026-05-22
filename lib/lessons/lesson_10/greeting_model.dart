// 第10回：テスト練習用のシンプルなモデル
// このクラスに対してユニットテストを書いてみましょう！

class GreetingModel {
  final String name;

  GreetingModel({required this.name});

  /// 挨拶を返す
  String hello() {
    return 'Hello $name';
  }

  /// 名前の文字数を返す
  int get nameLength => name.length;

  /// 名前が空かどうか
  bool get isEmpty => name.isEmpty;
}

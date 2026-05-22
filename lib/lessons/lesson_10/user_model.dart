// 第10回：テスト対象のモデルクラス
// レッスン7〜9で使った User クラスと同じものです。
// テストの学習用に独立して置いています。

class User {
  final int id;
  final String name;
  final String email;
  final int age;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.age,
  });

  /// JSONのMap → Userオブジェクトに変換するファクトリコンストラクタ
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      age: json['age'] as int,
    );
  }

  /// User → JSONのMapに変換するメソッド（APIに送信するときなどに使う）
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'email': email, 'age': age};
  }

  /// 大人かどうかを判定するメソッド（テストしやすいロジックの例）
  bool get isAdult => age >= 18;

  /// 表示用の名前（「さん」付き）
  String get displayName => '$name さん';
}

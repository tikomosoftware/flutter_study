// 第8回：ユーザーモデルクラスの定義
// APIから取得したJSONデータをDartのオブジェクトに変換するためのクラスです。
// Delphiでいう「レコード型」にJSONパース機能を追加したイメージです。

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

  // JSONのMap → Userオブジェクトに変換する「ファクトリコンストラクタ」
  // Delphiでいう「クラスメソッド」に近い概念です。
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      age: json['age'] as int,
    );
  }
}

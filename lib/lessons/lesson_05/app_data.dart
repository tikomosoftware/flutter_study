// 第5回：共有データ管理クラス
import 'package:flutter/material.dart';

class AppData {
  // --- シングルトンパターンの実装 ---
  // こうすることで、アプリのどこからでも「AppData()」を呼べば
  // 必ず同じインスタンス（実体）にアクセスできるようになります。
  static final AppData _instance = AppData._internal();
  factory AppData() => _instance;
  AppData._internal();

  // --- 共有したいデータ ---
  // ValueNotifier を使うと、「値が変わったよ！」という通知を自動で行えます。
  // ここでは初期値を '初期ユーザー' にしています。
  final ValueNotifier<String> userName = ValueNotifier<String>('初期ユーザー');

  // 必要に応じて他のデータも増やせます
  final ValueNotifier<int> clickCount = ValueNotifier<int>(0);

  // データを更新するメソッド
  void updateUserName(String newName) {
    userName.value = newName;
  }

  void incrementCount() {
    clickCount.value++;
  }
}

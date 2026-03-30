// 第5回：共有データレッスンのメインウィジェット
import 'package:flutter/material.dart';
import 'home_screen.dart';

class Lesson05App extends StatelessWidget {
  const Lesson05App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shared Data App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      // ホーム画面を初期画面に設定
      home: HomeScreen(),
    );
  }
}

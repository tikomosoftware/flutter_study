// 第3回：画面遷移（Navigation）の練習
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

class Lesson0301NavigationApp extends StatelessWidget {
  const Lesson0301NavigationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Study',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      // 最初に表示する画面を指定
      home: const FirstScreen(),
    );
  }
}

// --- 1番目の画面 ---
class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('最初の画面'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 2番目の画面へ遷移（積み重ねる）
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondScreen()),
            );
          },
          child: const Text('2番目の画面へ進む →'),
        ),
      ),
    );
  }
}

// --- 2番目の画面 ---
class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('2番目の画面'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 現在の画面を閉じて前の画面に戻る
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange.shade100,
          ),
          child: const Text('← 最初の画面に戻る'),
        ),
      ),
    );
  }
}

@Preview(name: 'Lesson 03-01 - Navigation')
Widget lesson0301NavigationPreview() {
  return const Lesson0301NavigationApp();
}

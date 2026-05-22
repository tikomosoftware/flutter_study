import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

/// Widget Previewer のサンプル
/// サイドバーの "Flutter Widget Preview" タブで確認できます。

@Preview(name: 'シンプルなカード')
Widget simpleCardPreview() {
  return MaterialApp(
    home: Scaffold(
      body: Center(
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.flutter_dash, size: 64, color: Colors.blue),
                const SizedBox(height: 8),
                const Text(
                  'Flutter Widget Previewer',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  'リアルタイムでウィジェットを確認できます',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

@Preview(name: 'カウンターボタン')
Widget counterButtonPreview() {
  return MaterialApp(
    home: Scaffold(
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text('カウント'),
        ),
      ),
    ),
  );
}

@Preview(name: 'ダークモード', brightness: Brightness.dark)
Widget darkModePreview() {
  return MaterialApp(
    darkTheme: ThemeData.dark(),
    themeMode: ThemeMode.dark,
    home: Scaffold(
      body: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: const Text('ダークモードのプレビュー'),
          ),
        ),
      ),
    ),
  );
}

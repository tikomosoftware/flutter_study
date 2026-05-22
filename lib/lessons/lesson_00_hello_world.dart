// 第0回：一番最初のHello World（StatelessWidgetの基礎）
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

// StatelessWidgetは「状態を持たない（後から変化しない）」画面を作るためのものです。
// 一度作ったら変わらない静的な画面に使います。
class Lesson00HelloWorldApp extends StatelessWidget {
  const Lesson00HelloWorldApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialAppはアプリ全体の土台となるウィジェットです。
    // テーマやルーティングなどアプリ全体の設定をここで行います。
    return MaterialApp(
      title: 'Hello World App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      // Scaffoldは画面の基本的な骨組み（ヘッダーやボディなど）を提供します。
      // appBar / body / floatingActionButton などのスロットを持っています。
      home: Scaffold(
        // AppBar：画面上部のタイトルバーです。
        // backgroundColor で背景色、foregroundColor でテキスト・アイコン色を変えられます。
        appBar: AppBar(
          title: const Text('はじめてのFlutter'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),

        // ── body の試行錯誤ログ ──────────────────────────────────────────

        // [試し①] Center + Text：最もシンプルな Hello World。
        // Center は子ウィジェットを画面中央に配置します。
        // Text の style で文字サイズや太さを指定できます。
        // body: const Center(
        //   child: Text(
        //     'Hello World!',
        //     style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        //   ),
        // ),

        // [試し②] Container + Center + Text（背景色あり）：
        // Container は色・サイズ・余白などを自由に設定できる汎用ボックスです。
        // color で背景色を指定し、child に別のウィジェットを入れられます。
        // body: Container(
        //   color: Colors.red,
        //   child: const Center(
        //     child: Text(
        //       'Hello World!',
        //       style: TextStyle(
        //         fontSize: 42,
        //         fontWeight: FontWeight.bold,
        //         color: Colors.amber,
        //       ),
        //     ),
        //   ),
        // ),

        // [試し③] Container でサイズを画面いっぱいに広げる：
        // double.infinity を使うと親の最大幅・高さいっぱいに広がります。
        // body: Container(
        //   color: Colors.red,
        //   width: double.infinity,
        //   height: double.infinity,
        //   child: Center(
        //     child: Text("Hello", style: TextStyle(color: Colors.white)),
        //   ),
        // ),

        // [現在④] Column：子ウィジェットを縦方向に並べます。
        // children リストに入れた順番に上から下へ配置されます。
        // Container を混ぜることで特定の要素だけ色を変えることもできます。
        // body: Container(
        //   color: Colors.white12,
        //   width: double.infinity,
        //   height: double.infinity,
        //   child: Column(
        //     children: [
        //       Text('data'),
        //       Text('data'),
        //       // Container で囲むと、その子だけ背景色・文字色を個別に設定できます
        //       Container(
        //         color: Colors.yellow,
        //         child: Text('data', style: TextStyle(color: Colors.red)),
        //       ),
        //       Text('data'),
        //       Text('data'),
        //     ],
        //   ),
        // ),
        body: Center(
          child: Column(
            children: [
              Text('data'),
              // Container で囲むと、その子だけ背景色・文字色を個別に設定できます
              Container(
                color: Colors.yellow,
                child: Text('data', style: TextStyle(color: Colors.red)),
              ),
              Container(
                color: Colors.lightGreen,
                width: double.infinity,
                // height: double.infinity,
                child: TextButton(
                  onPressed: () {
                    //ボタン押した場合の動作
                    debugPrint('ボタンが押されました！');
                  },
                  child: Text('Hello'),
                ),
              ),
              // サイズを指定しているだけなのにコンテナを使うのは過剰,警告が出る
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    //ボタン押した場合の動作
                    debugPrint('ボタンが押されました！');
                  },
                  child: Text('Hello'),
                ),
              ),
              // こっちを使えば警告が出ない
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    //ボタン押した場合の動作
                    debugPrint('ボタンが押されました！');
                  },
                  child: Text('Hello'),
                ),
              ),
              Container(
                child: OutlinedButton(
                  onPressed: () {
                    //ボタン押した場合の動作
                    debugPrint('ボタンが押されました！');
                  },
                  child: Text('Hello'),
                ),
              ),
              Text('data'),
              TextButton(
                onPressed: () {
                  //ボタン押した場合の動作
                  debugPrint('ボタンが押されました！');
                },
                child: Text('Hello'),
              ),
              ElevatedButton(
                onPressed: () {
                  //ボタン押した場合の動作
                  debugPrint('ボタンが押されました！');
                },
                child: Text('Hello'),
              ),
              OutlinedButton(
                onPressed: () {
                  //ボタン押した場合の動作
                  debugPrint('ボタンが押されました！');
                },
                child: Text('Hello'),
              ),
            ],
          ),
        ),

        // [試し⑤] Row：子ウィジェットを横方向に並べます。
        // Column が縦ならば Row は横、という対になる存在です。
        // body: Container(
        //   color: Colors.white12,
        //   width: double.infinity,
        //   height: double.infinity,
        //   child: Row(
        //     children: [
        //       Text('data'),
        //       Text('data'),
        //       Text('data'),
        //       Text('data'),
        //       Text('data'),
        //     ],
        //   ),
        // ),

        // FloatingActionButton：画面右下に浮かぶボタンです。
        // onPressed にコールバックを渡すと押したときの処理を書けます。
        // StatelessWidget なので画面の見た目は変わりませんが、
        // debugPrint でコンソールにログを出力することはできます。
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            debugPrint('ボタンが押されました！ - START -');
            debugPrint('ボタンが押されました！ - END -');
          },
          child: const Icon(Icons.thumb_up),
        ),
      ),
    );
  }
}

@Preview(name: 'Lesson 00 - Hello World')
Widget lesson00HelloWorldPreview() {
  return const Lesson00HelloWorldApp();
}

import 'package:flutter/material.dart';
import 'package:flutter_app/emaple5.dart';

void main() {
  runApp(MyApp());
}

/// 这个 widget 作用这个应用的顶层 widget.
///
/// 这个 widget 是无状态的，所以我们继承的是 [StatelessWidget].
/// 对应的，有状态的 widget 可以继承 [StatefulWidget]
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //创建内容
    // 我们想使用 material 风格的应用，所以这里用 MaterialApp
    return MaterialApp(
      // 移动设备使用这个 title 来表示我们的应用。具体一点说，在 Android 设备里，我们点击
      // recent 按钮打开最近应用列表的时候，显示的就是这个 title。
      title: "Flutter",
      // 应用的“主页”
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo'),
        ),
        // 我们知道，Flutter 里所有的东西都是 widget。为了把按钮放在屏幕的中间，
        // 这里使用了 Center（它是一个 widget）。
        body: Center(
          child: TestWidget(),
        ),
      ),
    );
  }


}


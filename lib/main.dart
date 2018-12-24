import 'package:flutter/material.dart';

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
          child: RollingButton(),
        ),
      ),
    );
  }


}

class RollingButton extends StatefulWidget {
  // StatefulWidget 需要实现这个方法，返回一个 State
  @override
  State<StatefulWidget> createState() {
    return _RollingButton();
  }
}

class _RollingButton extends State<RollingButton> {

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("点击"),
      onPressed: _onPressed,

    );
  }
  // context 这里使用的是 MyApp.build 的参数
  void _onPressed() {
    //打 log 可以使用 Dart 提供的 print，但在日志比较多的时候，print 的输出可能会被 Android 丢弃，
    // 这个时候 debugPrint 会是更好的选择。
    // 对应的日志信息可以在 Dart Console 里查看（View -> Tool Windows -> Run 或者 Mac 上使用 Command+4 打开）。
    debugPrint('点击调用了');

    showDialog(
        context: context,
        // 第一个 context 是参数名，第二个 context 是 State 的成员变量
        builder: (_) {
          return AlertDialog(
            content: Text("我是个弹窗!"),
          );
        }
    );
  }

}

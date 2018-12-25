
import 'package:flutter/material.dart';

/// 一个按钮 点击弹窗
/// 仅用作示例
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
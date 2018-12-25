import 'package:flutter/material.dart';

/// 基础控件
///Widget 分为两种
///一种是无状态的，叫 StatelessWidget，它只能用来展示信息，不能有动作（用户交互）；
///另一种是有状态的，叫 StatefulWidget，这种 Widget 可以通过改变状态使得 UI 发生变化，它可以包含用户交互。
///[注]
///stateless widget 整个生命周期里都不会改变，所以 build 方法只会执行一次。
///而 stateful widget 只要状态改变，就会调用 build 方法重新创建 UI。
class TestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MessageForm();
  }
}

/// 文本
class TextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "Put your text here",
      style: TextStyle(
          color: Colors.blue, fontSize: 16.0, fontWeight: FontWeight.bold),
    );
  }
}

/// 图片
/// Image.asset(name);
/// Image.file(file);
/// Image.memory(bytes);
/// Image.network(src);

class ImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://upload-images.jianshu.io/upload_images/3118842-7b076bf4f2dd0f92.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240"
    );
  }
}

/// 按钮
/// FlatButton 和 RaisedButton
class TestButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var flatBtn = FlatButton(
      onPressed: () => print('FlatButton pressed 点击'),
      child: Text('BUTTON'), //它可以接受任意的 Widget
    );
    var raisedButton = RaisedButton(
      onPressed: () => print('RaisedButton pressed 点击'),
      child: Text('BUTTON'), //它可以接受任意的 Widget
    );
    return flatBtn;
  }
}

/// 文本输入框 / 弹窗
class MessageForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MessageForm();
  }
}
class _MessageForm extends State<MessageForm> {
  //通过controller获取输入的内容
  var editController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            controller: editController,
          ),
        ),
        RaisedButton(
          child: Text("点击"),
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  title: Text("Dialog标题"),
                  content: Text("输入框输入:  ${editController.text}"),
                  //actions 设置 dialog 的按钮
                  actions: <Widget>[
                    FlatButton(
                      child: Text("确定"),
                      onPressed: ()=>  Navigator.pop(context),
                    ),
                  ],
                );
              }
            );
          },
        )

      ],
    );
  }
  @override
  void dispose() {
    super.dispose();
    // 手动调用 controller 的 dispose 方法以释放资源
    editController.dispose();
  }
}


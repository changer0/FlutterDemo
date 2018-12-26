import 'package:flutter/material.dart';

/// 页面间跳转
class TestWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TestWidget();
  }
}

class _TestWidget extends State<TestWidget> {
  var newScreenMsg;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      child: Text("新页面返回数据: $newScreenMsg "),
      onPressed: () {
        // Navigator.push 会返回一个 Future<T>，如果你对这里使用的 await不太熟悉，可以参考
        // https://www.dartlang.org/guides/language/language-tour#asynchrony-support
        Navigator.push<String>(
            context,
            MaterialPageRoute(
              builder: (_) => NewScreen(),
            )).then((String result) {
          newScreenMsg = result;
        });
      },
    );
  }
}

/// 新的页面
class NewScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewScreen();
  }
}

class _NewScreen extends State<NewScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("New Screen"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("点击返回"),
          onPressed: () {
            Navigator.pop(context, "新页面数据1");
          },
        ),
      ),
    );
  }
}

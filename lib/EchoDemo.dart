import 'package:flutter/material.dart';

///编写一个Echo客户端
///数据输入列表
class MessageForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MessageForm();
  }
}

class _MessageForm extends State<MessageForm> {
  final editController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        //行
        children: <Widget>[
          Expanded(
              child: Container(
            margin: EdgeInsets.only(right: 8.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "输入消息", contentPadding: EdgeInsets.all(0)),
              style: TextStyle(fontSize: 22.0, color: Colors.black54),
              controller: editController,
              // 自动获取焦点。这样在页面打开时就会自动弹出输入法
              autofocus: true,
            ),
          )),
          InkWell(
            onTap: () {
              debugPrint('send: ${editController.text}');
              final msg = Message(
                  editController.text, DateTime.now().millisecondsSinceEpoch);
              Navigator.pop(context, msg);
            },
            onDoubleTap: () => debugPrint('double tapped'),
            onLongPress: () => debugPrint('long pressed'),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(5.0)),
              child: Text("发送"),
            ),
          ),
        ],
      ),
    );
  }
}

///消息列表
///
class MessageList extends StatefulWidget {
  // 先忽略这里的参数 key，后面我们就会看到他的作用了
  MessageList({Key key}): super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MessageListState();
  }
}

class _MessageListState extends State<MessageList> {
  final List<Message> messages = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final msg = messages[index];
          final subtitle =  DateTime.fromMillisecondsSinceEpoch(msg.timestamp)
              .toLocal().toIso8601String();;
          return ListTile(
            title: Text(msg.msg),
            subtitle: Text(subtitle),
          );
        },
    );

  }
  void addMessage(Message msg) {
    setState(() {
      messages.add(msg);
    });
  }
}



/// 数据
class Message {
  final String msg;
  final int timestamp;

  Message(this.msg, this.timestamp);

  @override
  String toString() {
    return 'Message{msg: $msg, timestamp: $timestamp}';
  }
}

///启动主应用
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Echo",
      home: MessageListScreen(),
    );
  }
}

class AddMessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("消息列表"),
      ),
      body: MessageForm(),
    );
  }
}

class MessageListScreen extends StatelessWidget {

  final messageListKey = GlobalKey<_MessageListState>(debugLabel: 'messageListKey');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Echo client'),
        ),
        body: MessageList(key: messageListKey),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AddMessageScreen())
            );
            debugPrint('result = $result');
            if (result is Message) {
              messageListKey.currentState.addMessage(result);
            }
          },
          tooltip: 'Add message',
          child: Icon(Icons.add),
        )
    );
  }
}

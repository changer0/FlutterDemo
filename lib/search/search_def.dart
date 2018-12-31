import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class SearchDef extends StatelessWidget {

  SearchDef() {
    sendHotWords();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SearchDefHeader("搜索热词", "换一换", (){
          debugPrint("点击换一换");
        }),
        SearchDefHeader("搜索历史", "清空", (){
          debugPrint("点击清空");
        }),
      ],
    );
  }

  /// 获取热词
  void sendHotWords() {
    http.get("https://ptcoopsearch.reader.qq.com/hotkey?hotkeytype=huawei&changenum=0")
        .then((res){
          debugPrint("数据: ${res.body}");
    });
  }

}

/// 顶部的Header 布局
class SearchDefHeader extends StatelessWidget {
  var title = "";
  var action = "";
  var onTabAction;

  SearchDefHeader(this.title, this.action, this.onTabAction);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8, 32, 16, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(color: Color(0xFF333333), fontSize: 18, fontWeight: FontWeight.bold),
          ),

          GestureDetector(
            onTap: onTabAction,
            child: Text(
              action,
              style: TextStyle(color: Color(0xFF58C2F5), fontSize: 13, fontWeight: FontWeight.bold),
            ),
          )

        ],
      ),
    );
  }
}

/// 搜索热词和搜索历史 流式布局
class SearchDefFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;

  SearchDefFlowDelegate({this.margin});

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}

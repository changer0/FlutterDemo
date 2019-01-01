import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/search/search_bean.dart';
import 'package:http/http.dart' as http;


class SearchDef extends StatelessWidget {
  final hotWordsKey = GlobalKey<_SearchDefFlowContent>(debugLabel: 'hotWordsKe');
  int currentHotNum = 0;

  SearchDef() {
    sendHotWords(currentHotNum);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Column(
        children: <Widget>[
          SearchDefHeader("搜索热词", "换一换", (){
            debugPrint("点击换一换");
            sendHotWords(++currentHotNum > 4 ? currentHotNum = 0 : currentHotNum);
          }),
          SearchDefFlowContent(key: hotWordsKey),
          SearchDefHeader("搜索历史", "清空", (){
            debugPrint("点击清空");
          }),
        ],
      ),
    );
  }

  /// 获取热词
  void sendHotWords(int num) {
    debugPrint("当前请求的num: $num");
    http.get("https://ptcoopsearch.reader.qq.com/hotkey?hotkeytype=huawei&changenum=$num")
        .then((res){
          debugPrint("数据: ${res.body}");
          dynamic obj = json.decode(res.body);
          hotWordsKey.currentState.setHotWords(SearchHotWord.fromJson(obj));
    });
  }

}

/// 顶部的Header 布局
class SearchDefHeader extends StatelessWidget {
  final title;
  final action;
  final onTabAction;

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


class SearchDefFlowContent extends StatefulWidget {
  SearchDefFlowContent({Key key}): super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SearchDefFlowContent();
  }
}

class _SearchDefFlowContent extends State<SearchDefFlowContent> {
  List<SearchHotWord> hotWords = [];

  void setHotWords(List<SearchHotWord> list) {
    setState(() {
      hotWords.clear();
      hotWords.addAll(list);
      debugPrint(" addHotWords 执行了");
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widges = [];
    if (hotWords.length > 0) {
      for (var word in hotWords) {
        widges.add( Chip(
          label: Text(word.keyWord),
          shape: RoundedRectangleBorder(
            side: BorderSide.none,//自定义边框颜色和样式。
            borderRadius: BorderRadius.all(
              Radius.circular(5)
            ),

          ),
        ));
      }
      debugPrint("执行了");
    }
    return Wrap(
      spacing: 8.0, // 主轴方向的间距
      runSpacing: 4.0, // gap between lines
      children: widges,
      alignment: WrapAlignment.start,//主轴对齐方式

    );

  }

}

/// 搜索热词和搜索历史 流式布局
//class SearchDefFlowDelegate extends FlowDelegate {
//  EdgeInsets margin = EdgeInsets.zero;
//
//  SearchDefFlowDelegate({this.margin});
//
//  @override
//  void paintChildren(FlowPaintingContext context) {
//    var x = margin.left;
//    var y = margin.top;
//    for (int i = 0; i < context.childCount; i++) {
//      var w = context.getChildSize(i).width + x + margin.right;
//      if (w < context.size.width) {
//        context.paintChild(i,
//            transform: new Matrix4.translationValues(x, y, 0.0));
//        x = w + margin.left;
//      } else {
//        x = margin.left;
//        y += context.getChildSize(i).height + margin.top + margin.bottom;
//        context.paintChild(i,
//            transform: new Matrix4.translationValues(x, y, 0.0));
//        x += context.getChildSize(i).width + margin.left + margin.right;
//      }
//    }
//  }
//
//  @override
//  bool shouldRepaint(FlowDelegate oldDelegate) {
//    return oldDelegate != this;
//  }
//}

import 'package:flutter/material.dart';

/// 搜索标题
class SearchTopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Row(
        children: <Widget>[
          Image.asset(
            'images/public_back.png',
            width: 25,
            height: 25,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 0.2),
                  borderRadius: BorderRadius.circular(5.0)),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Image.asset(
                      'images/icon_search_top_inner.png',
                      width: 15,
                      height: 15,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "搜索书名、作者名",
                          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                          border: InputBorder.none),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_app/search/search_def.dart';
import 'package:flutter_app/search/search_topbar.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "搜索",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: SearchTopBar(),
        ),
        body: SearchDef(),
      ),
    );
  }
}


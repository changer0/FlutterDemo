
import 'package:flutter/material.dart';

/// 手势处理
class TestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TestListener();
  }

}

/// 点击
class TestPress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("点击"),
      onPressed: () => debugPrint("触发点击"),
    );
  }

}

/// 任意控件的手势事件
///onTapDown：按下
//
//onTap：点击动作
//onTapUp：抬起
//onTapCancel：前面触发了 onTapDown，但并没有完成一个 onTap 动作
//onDoubleTap：双击
//onLongPress：长按
//onScaleStart, onScaleUpdate, onScaleEnd：缩放
//onVerticalDragDown, onVerticalDragStart, onVerticalDragUpdate, onVerticalDragEnd, onVerticalDragCancel, onVerticalDragUpdate：在竖直方向上移动
//onHorizontalDragDown, onHorizontalDragStart, onHorizontalDragUpdate, onHorizontalDragEnd, onHorizontalDragCancel, onHorizontalDragUpdate：在水平方向上移动
//onPanDown, onPanStart, onPanUpdate, onPanEnd, onPanCancel：拖曳（水平、竖直方向上移动）
/// [注]
//如果同时设置了 onVerticalXXX 和 onHorizontalXXX，在一个手势里，只有一个会触发（如果用户首先在水平方向移动，则整个过程只触发 onHorizontalUpdate；竖直方向的类似）
//这里要说明的是，onVerticalXXX/onHorizontalXXX 和 onPanXXX 不能同时设置。如果同时需要水平、竖直方向的移动，使用 onPanXXX。
class TestGestureDetector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      onPressed: () => debugPrint("触发点击"),
      child: GestureDetector(
        onLongPress: () => debugPrint("长按事件"),
        child: Text("点击"),
      ),
    );
  }
}

/// GestureDetector 在绝大部分时候都能够满足我们的需求，如果真的满足不了，
/// 我们还可以使用最原始的 Listener 控件。
class TestListener extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Listener(
      child: Text('text'),
      onPointerDown: (event) => print('onPointerDown'),
      onPointerUp: (event) => print('onPointerUp'),
      onPointerMove: (event) => print('onPointerMove'),
      onPointerCancel: (event) => print('onPointerCancel'),
    );
  }

}
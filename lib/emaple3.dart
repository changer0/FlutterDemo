import 'package:flutter/material.dart';

/// 基础控件
class TestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TestStack();
  }
}

/// 控件 Container 可以让我们设置一个控件的尺寸、背景、margin 等：
class TestContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Container"),
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(4.0),
      width: 80,
      decoration: BoxDecoration(
        //背景色
        color: Colors.grey,
        //圆角
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }
}

///如果我们只需要 padding，可以使用控件 Padding
class TestPadding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text("Padding"),
    );
  }
}

///Center 就跟它的名字一样，把一个控件放在中间：
class TestCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(4.0),
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        //背景色
        color: Colors.grey,
        //圆角
        borderRadius: BorderRadius.circular(5.0),
      ),

      // 把文本放在 Container 的中间
      child: Center(
        child: Text("Center"),
      ),
    );
  }
}

///Row 水平布局
class TestRow extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text("Text1"),
        Text("Text2"),
        Text("Text3"),
        Text("Text4"),
      ],
    );
  }

}
///Column 竖直布局
class TestColumn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("Text1"),
        Text("Text2"),
        Text("Text3"),
        Text("Text4"),
      ],
    );
  }
}
///Expand 当一行/列里有多个 Expand 时，我们还可以通过设置它的 flex 参数，
///在多个 Expand 之间按比例划分可用空间。
class TestExpand extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text("Text1"),
          // 占一行的 2/3
          flex: 2,
        ),

        Expanded(
          child: Text("Text2"),
          // 占一行的 1/3
          flex: 1,
        ),

        Text("Text3"),
        Text("Text4"),
      ],
    );
  }
}

/// Stack 一个控件叠在另一个控件的上面
/// 默认情况下，子控件都按 Stack 的左上角对齐，于是，上面的两个文本完全一上
/// 一下堆叠在一起。我们还可以通过设置 alignment 参数来改变这个对齐的位置：
class TestStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      // Aligment 的取值范围为 [-1, 1]，Stack 中心为 (0, 0)，
      // 这里设置为 (-0.5, -0.5) 后，可以让文本对齐到 Container 的 1/4 处
      alignment: const Alignment(-0.5, -0.5),
      children: <Widget>[
        Container(
          width: 200.0,
          height: 200.0,
          color: Colors.blue,
        ),
        Text('顶层'),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:async';

class DemoStateWidget extends StatefulWidget {

  final String text;

  //通过构造方法传值
  DemoStateWidget(this.text);

  //主要是负责创建state
  @override
  _DemoStateWidgetState createState() {
    return _DemoStateWidgetState(text);
  }
}

class _DemoStateWidgetState extends State<DemoStateWidget> {

  String text;

  _DemoStateWidgetState(this.text);

  @override
  void initState() {
    //初始化，这个函数在生命周期中只调用一次
    super.initState();
    //定时2秒
    new Future.delayed(Duration(seconds: 1), () {
      setState(() {
        text = "这就变了数值";
      });
    });
  }

  @override
  void dispose() {
    //销毁，只调用一次
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // 在initState()之后调用，此时可以获取其他state
    super.didChangeDependencies();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text ?? "这就是有状态DEMO"),
    );
  }
}
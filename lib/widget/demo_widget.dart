import 'dart:async';

import 'package:flutter/material.dart';

class DemoWidget extends StatelessWidget {

  final String text;

  //数据可以通过构造方法传递进来
  DemoWidget(this.text);

  @override
  Widget build(BuildContext context) {
    //这里返回你需要的控件
    return Container(
      //白色背景
      color: Colors.white,
      //Dart语法中，如果??为空，就返回尾号后的内容
      child: Text(text ?? "这就是无状态DEMO"),
    );
  }
}
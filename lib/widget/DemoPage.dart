import 'package:flutter/material.dart';
import 'package:flutter_study/widget/DemoItem.dart';

class DemoPage extends StatefulWidget {

  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {

  @override
  Widget build(BuildContext context) {
    //一个页面的开始
    //如果是新页面，会自带返回按键
    return new Scaffold(
      //背景样式
      backgroundColor: Colors.blue,
      //标题栏
      appBar: new AppBar(
        title: new Text("Title"),
      ),
      //正式的页面开始
      //一个Listview
      body: new ListView.builder(
          itemBuilder: (context, index) {
            return new DemoItem();
          },
        itemCount: 20,
      ),
    );
  }
}
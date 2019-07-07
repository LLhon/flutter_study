import 'package:flutter/material.dart';
import 'package:flutter_study/widget/DemoItem.dart';
import 'package:english_words/english_words.dart';


class DemoPage extends StatefulWidget {

  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {

  //表尾标记
  static const loadingTag = "##loading##";
  var _words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    //一个页面的开始
    //如果是新页面，会自带返回按键
    return new Scaffold(
      //背景样式
      backgroundColor: Colors.blue,
      //标题栏
      appBar: new AppBar(
        //这个title是一个widget
        title: new Text("Title"),
      ),
      //正式的页面开始
      //一个Listview
      body: new ListView.separated(
        itemBuilder: (context, index) {
          //如果到了底部
          if (_words[index] == loadingTag) {
            //不足100条，继续获取数据
            if (_words.length - 1 < 100) {
              //获取数据
              _retrieveData();
              //加载时显示loading
              return Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: CircularProgressIndicator(strokeWidth: 2.0, backgroundColor: Colors.orange),
                ),
              );
            } else {
              //数据已经全部加载完毕
              return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16.0),
                child: Text("我也是有底线的~", style: TextStyle(color: Colors.white)),
              );
            }
          }
          return new DemoItem(_words[index]);
        },
        itemCount: _words.length,
        //添加分割线
        separatorBuilder: (context, index) => Divider(height: .0),
      ),
    );
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(_words.length - 1,
        generateWordPairs().take(20).map((e) => e.asPascalCase).toList()
      );
      setState(() {
        //重新构建列表
      });
    });
  }

  request() async {
    await Future.delayed(Duration(seconds: 1));
    return "ok";
  }

  doSomeThing() async {
    String data = await request();
    data = "ok from request";
    return data;
  }

  renderSome() {
    doSomeThing().then((value) {
      //打印ok from request
      print(value);
    });
  }
}
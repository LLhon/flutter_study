import 'package:flutter/material.dart';
import 'package:flutter_study/widget/TabBarPageFirst.dart';
import 'package:flutter_study/widget/TabBarPageSecond.dart';
import 'package:flutter_study/widget/TabBarPageThree.dart';
import 'package:flutter_study/widget/TabBarWidget.dart';

class TabBarBottomPageWidget extends StatefulWidget {

  @override
  _TabBarBottomPageWidgetState createState() => _TabBarBottomPageWidgetState();
}

class _TabBarBottomPageWidgetState extends State<TabBarBottomPageWidget> {

  final PageController pageController = new PageController();
  final List<String> tab = ["动态", "趋势", "我的"];

  //渲染底部tab
  _renderTab() {
    List<Widget> list = new List();
    for (int i = 0; i < tab.length; i++) {
      list.add(new FlatButton(onPressed: () {
        //每个tabbar点击时通过jumpTo跳转页面
        //每个页面需要跳转坐标为：当前屏幕大小 * 索引index
        pageController.jumpTo(MediaQuery
          .of(context)
          .size
          .width * i);
      }, child: new Text(
        tab[i],
        maxLines: 1,
      )));
    }
    return list;
  }

  //渲染Tab对应页面
  _renderPage() {
    return [
      new TabBarPageFirst(),
      new TabBarPageSecond(),
      new TabBarPageThree(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // 带 scaffold 的 TabBar 页面
    return new TabBarWidget(
      type: TabBarWidget.BOTTOM_TAB,
      //渲染tab
      tabItems: _renderTab(),
      //渲染页面
      tabViews: _renderPage(),
      backgroundColor: Colors.black45,
      indicatorColor: Colors.white,
      title: new Text("FlutterStudy"));
  }
}
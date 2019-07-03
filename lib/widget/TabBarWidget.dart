import 'package:flutter/material.dart';

class TabBarWidget extends StatefulWidget {

  //底部模式
  static const int BOTTOM_TAB = 0;

  //顶部模式
  static const int TOP_TAB = 1;

  final int type;

  final List<Widget> tabItems;

  final List<Widget> tabViews;

  final Color backgroundColor;

  final Color indicatorColor;

  final Widget title;

  final Widget drawer;

  final Widget floatingActionButton;


  TabBarWidget({
      this.type,
      this.tabItems,
      this.tabViews,
      this.drawer,
      this.floatingActionButton,
      this.backgroundColor,
      this.indicatorColor,
      this.title
  });

  @override
  _TabBarState createState() => _TabBarState(
    type,
    drawer,
    tabViews,
    title,
    floatingActionButton,
    indicatorColor
  );
}

//TabBar 和 PageView 之间通过 _pageController 和 _tabController 实现 tab 与页面的同步

class _TabBarState extends State<TabBarWidget> with SingleTickerProviderStateMixin {

  final int _type;

  final List<Widget> _tabViews;

  final Color _indicatorColor;

  final Widget _title;

  final Widget _drawer;

  final Widget _floatingActionButton;

  final PageController _pageController = new PageController();

  TabController _tabController;

  _TabBarState(
    this._type,
    this._drawer,
    this._tabViews,
    this._title,
    this._floatingActionButton,
    this._indicatorColor
  ) : super();

  @override
  void initState() {
    super.initState();
    //初始化时创建控制器
    //通过 with SingleTickerProviderStateMixin 实现动画效果。
    _tabController = TabController(length: widget.tabItems.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // 底部Tabbar模式
    return new Scaffold(
      //设置侧边滑出drawer, 不需要可以不设置
      drawer: _drawer,
      //设置悬浮按钮，不需要可以不设置
      floatingActionButton: _floatingActionButton,
      //标题栏
      appBar: new AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: _title,
      ),
      //页面主体, PageView，用于承载 tab 对应的页面
      body: new PageView(
        //必须有的控制器，与 tabbar 的控制器同步
        controller: _pageController,
        //每一个tab对应的页面主体，是一个List<Widget>
        children: _tabViews,
        onPageChanged: (index) {
          //页面滑动回调，用于同步tab选中状态
          _tabController.animateTo(index);
        },
      ),
      //底部导航栏，也就是tab栏
      bottomNavigationBar: new Material(
        color: Theme.of(context).primaryColor,
        //TabBar控件
        child: new TabBar(
          //必须有的控制器，与 pageView 的控制器同步
          controller: _tabController,
          //每一个tab item, 是一个 List<Widget>
          tabs: widget.tabItems,
          //tab底部选中条颜色
          indicatorColor: _indicatorColor,
        ),
      ),
    );
  }
}

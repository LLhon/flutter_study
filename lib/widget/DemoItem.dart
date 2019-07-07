import 'package:flutter/material.dart';
import 'package:flutter_study/widget/BaseWidgets.dart';

class DemoItem extends StatelessWidget {

  final String words;

  DemoItem(
    this.words
   );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      //卡片包装
      child: new Card(
        //增加点击效果
        child: new FlatButton(
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context) {
                return new NewRoute();
              }));
            },
            child: new Padding(
              padding: new EdgeInsets.only(
                  left: 0.0, top: 10.0, right: 10.0, bottom: 10.0),
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  //文本描述
                  new Container(
                      child: new Text(words, style: TextStyle(color: Colors.blue, fontSize: 14.0),
                        //最长3行
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      margin: new EdgeInsets.only(top: 6.0, bottom: 2.0),
                      alignment: Alignment.topLeft),
                  new Padding(padding: EdgeInsets.all(10.0)),
                  //三个平均分配的图标文字
                  new Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _getBottomItem(Icons.star, "999"),
                      _getBottomItem(Icons.link, "999"),
                      _getBottomItem(Icons.subject, "999"),
                    ],
                  )
                ],
              ),
            )
        ),
      ),
    );
  }

  _getBottomItem(IconData icon, String text) {
    //充满rom横向的布局
    return new Expanded(
      flex: 1,
      //居中显示
      child: new Center(
        //横向布局
        child: new Row(
          //主轴居中，即横向居中
          mainAxisAlignment: MainAxisAlignment.center,
          //大小按照最大充满
          mainAxisSize: MainAxisSize.max,
          //竖向也居中
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //一个图标，大小16.0，灰色
            new Icon(
                icon,
                size: 16.0,
                color: Colors.grey
            ),
            //间隔
            new Padding(padding: EdgeInsets.only(left: 5.0)),
            //显示文本
            new Text(
              text,
              //设置字体样式，颜色灰色，字体大小14.0
              style: new TextStyle(color: Colors.grey, fontSize: 14.0),
              //超过的为...显示
              overflow: TextOverflow.ellipsis,
              //最长为1行
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
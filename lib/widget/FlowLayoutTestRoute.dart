import 'package:flutter/material.dart';

class FlowLayoutTestRoute extends StatefulWidget {

  @override
  _FlowLayoutTestRouteState createState() => _FlowLayoutTestRouteState();
}

class _FlowLayoutTestRouteState extends State<FlowLayoutTestRoute> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("流式布局Flow"),
      ),
      body: Wrap(
        //主轴(水平)方向间距
        spacing: 8.0,
        //纵轴(垂直)方向间距
        runSpacing: 4.0,
        //沿主轴方向居中
        alignment: WrapAlignment.start,
        children: <Widget>[
          new Chip(
            avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text("A")),
            label: new Text("Java")
          ),
          new Chip(
            avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('B')),
            label: new Text('Python')
          ),
          new Chip(
            avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('C')),
            label: Text('Go'),
          ),
          new Chip(
            avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('D'),),
            label: Text('PHP'),
          ),
          new Chip(
            avatar: CircleAvatar(
              backgroundColor: Colors.blue, child: Text('E'),),
            label: Text('C++'),
          ),
          new Chip(
            avatar: CircleAvatar(
              backgroundColor: Colors.blue, child: Text('F'),),
            label: Text('Kotlin'),
          ),
        ],
      ),
    );
  }
}
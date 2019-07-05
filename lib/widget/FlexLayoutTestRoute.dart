import 'package:flutter/material.dart';

class FlexLayoutTestRoute extends StatefulWidget {

  @override
  _FlexLayoutTestRouteState createState() => _FlexLayoutTestRouteState();
}

class _FlexLayoutTestRouteState extends State<FlexLayoutTestRoute> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("弹性布局Flex"),
      ),
      body: Column(
        children: <Widget>[
          //Flex的两个widget按1:2来占据水平空间
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              //Expanded 可以按比例扩伸 Row, Column, Flex 子widget所占用的空间
              Expanded(
                //flex 是弹性系数，如果为0或null，则child是没有弹性的，即不会被扩伸占用的空间
                flex: 1,
                child: Container(
                  height: 30.0,
                  color: Colors.red,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 30.0,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: SizedBox(
              height: 100.0,
              //Flex的三个子widget，在垂直方向按2：1：1来占用100像素的空间
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 30.0,
                      color: Colors.red,
                    ),
                  ),
                  //Spacer 单纯的就是占用指定比例的空间，实际上它只是Expanded的一个包装
                  Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 30.0,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
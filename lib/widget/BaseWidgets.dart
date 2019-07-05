import 'package:flutter/material.dart';
import 'package:flutter_study/widget/FlexLayoutTestRoute.dart';

class NewRoute extends StatefulWidget {

  @override
  _NewRouteState createState() => _NewRouteState();
}

class _NewRouteState extends State<NewRoute> {

  bool _switchSelected = true; //维护单选开关状态
  bool _checkboxSelected = true; //维护复选框状态

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Route"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context) {
                return new FlexLayoutTestRoute();
              }));
            },
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text("submit"),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          ),
          Switch(
            value: _switchSelected,
            onChanged: (value) {
              //重新构建页面
              setState(() {
                _switchSelected = value;
              });
            },
          ),
          Checkbox(
            value: _checkboxSelected,
            activeColor: Colors.red,
            onChanged: (value) {
              //重新构建页面
              setState(() {
                _checkboxSelected = value;
              });
            },
          ),
          Image.network(
            "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
            width: 100.0,
          ),
          Icon(Icons.android, color: Colors.black,),
          TextField(
            decoration: InputDecoration(
              labelText: "password",
              hintText: "请输入密码",
              prefixIcon: Icon(Icons.lock),
            ),
            obscureText: true,
          ),
          Container(
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "电子邮件地址",
                prefixIcon: Icon(Icons.email),
                border: InputBorder.none, //隐藏下划线
              ),
            ),
            decoration: BoxDecoration(
              //下划线浅灰色，宽度1个像素
              border: Border(bottom: BorderSide(color: Colors.grey[200], width: 1.0))
            ),
          )
        ],
      ),
    );
  }
}
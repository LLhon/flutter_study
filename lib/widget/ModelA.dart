class ModelA {
  String name;
  String tag;

  //默认构造方式，赋值给name,tag
  ModelA(this.name, this.tag);

  //返回一个空的ModelA
  ModelA.empty();

  //返回一个设置了name的ModelA
  ModelA.forName(this.name);
}
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  List<Map> routes = [
    {"routeName": "route_test", "title": "路由管理"},
    {"routeName": "product", "title": "商品"},
    {"routeName": "randomWords", "title": "随机单词列表"},
    {"routeName": "signUpPage", "title": "登录"},
    {"routeName": "friendlychatPage", "title": "聊天"},
    {"routeName": "shrineSign", "title": "电子商务应用 - SHRINE"},
    {"routeName": "tabs", "title": "tabs demo"},
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView.builder(
      itemCount: this.routes.length,
      itemExtent: 50,
      itemBuilder: (BuildContext context, int index){
        return listItem(context, routes, index);
    }),
      );
  }
}

Widget listItem(BuildContext context, List routes, int index) {

  Map route  =  routes[index];

  return GestureDetector(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(route["title"]),
    ),
    onTap: () {
      print("点击了"+ index.toString());
      Navigator.pushNamed(context, route["routeName"], arguments: route["title"]);
    },
  );
}
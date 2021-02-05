import 'package:flutter/material.dart';
import 'tip_router_page.dart';

class RouterTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // 获取路由参数
    var args = ModalRoute.of(context).settings.arguments;
    print("${args.runtimeType} >>> $args");
    return Scaffold(
      appBar: AppBar(
        title: Text(args),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () async {
            var result = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) {
                      return TipRoute(
                          text: "wo shi sha bi"
                      );
                    },
                ),
            );
            print("路由返回值：$result");
          },
          child: Text("打开提示页"),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'product_details.dart';

class ProductListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: Text('商品列表')),
        body: Center(
          child: RaisedButton(
            child: Text('查看商品详情页567890'),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => new ProductDetails()
              ));
            },
          ),
        )
    );
  }
}
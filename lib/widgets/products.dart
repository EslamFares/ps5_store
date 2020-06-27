import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ps5_store_ui/widgets/product_Card.dart';
import 'package:ps5_store_ui/models/product.dart';
class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ProductsCard(Products_List[0]),
              ProductsCard(Products_List[1]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ProductsCard(Products_List[2]),
              ProductsCard(Products_List[3]),
            ],
          ),
        ],
      ),
    );
  }
}

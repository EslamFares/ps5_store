import 'package:flutter/cupertino.dart';
import 'package:ps5_store_ui/styles/my_color.dart';
import 'package:flutter/material.dart';
import 'package:ps5_store_ui/models/product.dart';
import 'package:ps5_store_ui/widgets/shadow.dart';
import 'package:ps5_store_ui/screens/product_screen.dart';
class ProductsCard extends StatefulWidget {
  final Product _product;
  ProductsCard(this._product);

  @override
  _ProductsCardState createState() => _ProductsCardState();
}

class _ProductsCardState extends State<ProductsCard> {
bool click = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>ProductScreen(widget._product)));
      },
      child: Container(
        height: 300,
        width: MediaQuery.of(context).size.width / 2 - 40,
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        padding: EdgeInsets.only(left: 10.0, right: 10.0,bottom: 15.0,top: 5),
        decoration: BoxDecoration(
          color: MyColor().light,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: Shadow().neumorphic(
              Colors.grey.withOpacity(0.4), Colors.white.withOpacity(1)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            IconButton(
              icon: Icon(
                click?Icons.favorite:Icons.favorite_border,
                size: 20,
                color:click==true?Colors.red:Colors.black,
              ),
              onPressed: (){
                setState(() {click = !click; });

              },
            ),
            Center(
                child: Image(
              image: AssetImage(widget._product.image),
              height: 150,
            )),
            SizedBox(
              height: 5,
            ),
            Text(
              widget._product.type,
              style: TextStyle(fontSize: 10),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              widget._product.name,
              style: TextStyle(
                  fontSize: 14,
                  color: MyColor().blue,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

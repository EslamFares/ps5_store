import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ps5_store_ui/models/product.dart';
import 'package:ps5_store_ui/styles/my_color.dart';
import 'package:ps5_store_ui/widgets/neumorphic_button.dart';
import 'package:ps5_store_ui/widgets/header.dart';
import 'package:ps5_store_ui/widgets/shadow.dart';

class ProductScreen extends StatelessWidget {
  final Product data;

  ProductScreen(this.data);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: MyColor().dark,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Header(
                  leadingButton: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Button().iconButton(
                        MyColor().dark,
                        Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        Shadow().neumorphic(Colors.black.withOpacity(0.5),
                            Colors.grey.withOpacity(0.1)),
                        40.0),
                  ),
                  actionButton: Button().iconButton(
                      MyColor().dark,
                      Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                      Shadow().neumorphic(Colors.black.withOpacity(0.5),
                          Colors.grey.withOpacity(0.1)),
                      40.0),
                  logo: Image(
                    image: AssetImage("assets/ps5-logo-light.png"),
                    width: 120.0,
                  ),
                  bgColor: MyColor().dark),
              _bodyProduct(context)
            ],
          ),
        ),
      ),
    );
  }

  _bodyProduct(BuildContext context) {
    var padding =
        MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.top;
    var bodyHeight = MediaQuery.of(context).size.height - (padding + 95);
    return Container(
      padding: EdgeInsets.all(20),
      height: bodyHeight,
      child: SingleChildScrollView(
        child:Container(
          margin: EdgeInsets.only(top: 10.0),
          padding: EdgeInsets.only(top: 50.0),
          decoration: BoxDecoration(
              color: MyColor().light,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                  bottomLeft:  Radius.circular(40.0),
                  bottomRight:  Radius.circular(40.0),

              )),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: bodyHeight - 120.0),
            child: Column(
              children: <Widget>[
                Image(image: AssetImage(data.image),height: 250,width: 200,),
                SizedBox(height: 5.0,),
                Image(image: AssetImage('assets/ring.png'),height: 80,),
                SizedBox(height: 5,),
                _fetures(),
                SizedBox(height: 5,),
                _buyButton()
              ],
            ),
          ),
        ) ,
      ),
    );
  }

  _fetures() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 25.0),
      height: 130.0,
      child: Row(
//        scrollDirection: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: 120.0,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
            margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
            decoration: BoxDecoration(
                color: MyColor().light,
                boxShadow: Shadow().neumorphic(
                    Colors.grey.withOpacity(0.4), Colors.white.withOpacity(1)),
                borderRadius: BorderRadius.circular(20.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(
                  Icons.mic,
                  color: MyColor().blue,
                ),
                Text(
                  "Built-In Microphone",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Container(
            width: 120.0,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
            margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
            decoration: BoxDecoration(
                color: MyColor().light,
                boxShadow: Shadow().neumorphic(
                    Colors.grey.withOpacity(0.4), Colors.white.withOpacity(1)),
                borderRadius: BorderRadius.circular(20.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(
                  Icons.headset_mic,
                  color: MyColor().blue,
                ),
                Text(
                  "Headset Jack",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Container(
            width: 120.0,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
            margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
            decoration: BoxDecoration(
                color: MyColor().light,
                boxShadow: Shadow().neumorphic(
                    Colors.grey.withOpacity(0.4), Colors.white.withOpacity(1)),
                borderRadius: BorderRadius.circular(20.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(
                  Icons.router,
                  color: MyColor().blue,
                ),
                Text(
                  "Motion Sensor",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buyButton() {
    return Container(
      height: 55.0,
      margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: MyColor().blue,
        boxShadow: Shadow().neumorphic(
            Colors.black.withOpacity(0.3), Colors.white.withOpacity(1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 80.0,
            height: 55.0,
            decoration: BoxDecoration(
                color: MyColor().darkBlue,
                borderRadius: BorderRadius.circular(30.0)),
            child: Center(
              child: Text(
                data.price,
                style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
              child: Center(
                child: Text("Buy Now",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0)),
              ))
        ],
      ),
    );
  }

}

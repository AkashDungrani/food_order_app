import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/product_model.dart';
import '../../provider/cart_provider.dart';
import '../../provider/theme_provider.dart';

class cart_page extends StatefulWidget {
  const cart_page({Key? key}) : super(key: key);

  @override
  State<cart_page> createState() => _cart_pageState();
}

class _cart_pageState extends State<cart_page> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text("Cart page"), centerTitle: true, actions: [
        Switch(
            value: Provider.of<ThemeProvider>(context).isdrk,
            onChanged: (val) {
              Provider.of<ThemeProvider>(context, listen: false).changeTheme();
            })
      ]),
      body: Column(
        children: [
          Expanded(
              flex: 12,
              child: ListView.builder(
                  itemCount: Provider.of<CartProvider>(context).allcart.length,
                  itemBuilder: (contecxt, i) {
                    Product product =
                        Provider.of<CartProvider>(context).allcart[i];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 5,
                        child: Container(
                          height: _height * 0.15,
                          width: _width,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              border: Border.all(color: Colors.green),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 5,
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        product.image,
                                        height: _height * 0.10,
                                      ),
                                      SizedBox(height: _height * 0.01),
                                      Text(
                                        "${product.name}".split(" ")[0],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 22),
                                      )
                                    ],
                                  )),
                              Expanded(
                                  flex: 6,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          InkWell(
                                              onTap: () {
                                                Provider.of<CartProvider>(
                                                        context,
                                                        listen: false)
                                                    .Countpluse(
                                                        product: product);
                                              },
                                              child: Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                  color: Colors
                                                      .lightGreen.shade300,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "+",
                                                  style:
                                                      TextStyle(fontSize: 30),
                                                ),
                                              )),
                                          SizedBox(width: _width * 0.03),
                                          Text(
                                            "${product.quantity}",
                                            style: TextStyle(fontSize: 25),
                                          ),
                                          SizedBox(width: _width * 0.03),
                                          InkWell(
                                            onTap: () {
                                              Provider.of<CartProvider>(context,
                                                      listen: false)
                                                  .CountdecrementAndRemove(
                                                      product: product);
                                            },
                                            child: Container(
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                color:
                                                    Colors.lightGreen.shade300,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              alignment: Alignment.center,
                                              child: Text(
                                                "-",
                                                style: TextStyle(fontSize: 30),
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              Provider.of<CartProvider>(context,
                                                      listen: false)
                                                  .RemoveFromCart(
                                                      product: product);
                                            },
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                              size: 35,
                                            ),
                                          )
                                        ],
                                      ),
                                      Text(
                                        "Price : ${product.price}",
                                        style: TextStyle(
                                            fontSize: 22, color: Colors.green),
                                      )
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      ),
                    );
                  })),
          Expanded(
            flex: 3,
            child: Container(
              width: _width,
              decoration: BoxDecoration(
                  color: Colors.lightGreen.shade200,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: _height * 0.03),
                  Text(
                    "Total Product : ${Provider.of<CartProvider>(context).allProduct}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: _height * 0.02),
                  Text(
                    "Total Price : ${Provider.of<CartProvider>(context).totalPrice}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/product_model.dart';
import '../../provider/cart_provider.dart';
import '../../provider/theme_provider.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text("Favourite page"), centerTitle: true, actions: [
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
                  itemCount: Provider.of<CartProvider>(context).favourite.length,
                  itemBuilder: (contecxt, i) {
                    Product product =
                        Provider.of<CartProvider>(context).favourite[i];
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Price : ${product.price}",
                                        style: TextStyle(
                                            fontSize: 22, color: Colors.green),
                                      ),
                                      ElevatedButton(onPressed: (){
                                      setState(() {
                                          Provider.of<CartProvider>(context,
                                                      listen: false)
                                                  .RemoveFromFavourite(
                                                      product: product);
                                      });
                                      }, child: Text("Remove From Favourite")),
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      ),
                    );
                  })),
                 ],
      ),
    );
  }
}

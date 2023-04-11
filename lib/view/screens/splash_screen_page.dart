import 'package:flutter/material.dart';
import 'package:food_order/models/globals.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helper/db_helper.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({Key? key}) : super(key: key);

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: _height * 0.17),
           Image.asset("assets/images/pizza.png"),
            SizedBox(height: _height * 0.01),
            Text("Fast Delivery At\nYour Doorstep",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            SizedBox(height: _height * 0.2),
            Container(
              // alignment: Alignment.center,
              height: _height * 0.06,
              width: _width * 0.7,
              child: ElevatedButton(
                  onPressed: () async {
                    SharedPreferences pres =
                        await SharedPreferences.getInstance();
                    print(global.data);
                    if (global.data == false) {
                      global.products.forEach((element) {
                        DBHleper.dbHleper.inserRecode(data: element);
                      });

                      Navigator.of(context).pushReplacementNamed('/');
                      pres.setBool('data', true);
                    } else {
                      Navigator.of(context).pushReplacementNamed('/');
                    }
                  },
                  child: Text(
                    "Let's Explore",
                    style: TextStyle(color: Colors.green, fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white))),
            )
          ],
        ),
      ),
    );
  }
}

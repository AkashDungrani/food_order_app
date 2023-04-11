import 'package:flutter/material.dart';
import 'package:food_order/models/globals.dart';
import 'package:food_order/provider/cart_provider.dart';
import 'package:food_order/provider/theme_provider.dart';
import 'package:food_order/view/screens/homepage.dart';
import 'package:food_order/view/screens/splash_screen_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prep = await SharedPreferences.getInstance();
  global.data = prep.getBool('data') ?? false;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
            create: (context) => ThemeProvider()),
        ChangeNotifierProvider<CartProvider>(
            create: (context) => CartProvider()),
      ],
      builder: (context, child) => MaterialApp(
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(secondary: Colors.green, primary: Colors.green)),
        darkTheme: ThemeData.dark(),
        themeMode: (Provider.of<ThemeProvider>(context).isdrk)
            ? ThemeMode.dark
            : ThemeMode.light,
        debugShowCheckedModeBanner: false,
        initialRoute: 'splash_screen',
        routes: {
          '/': (context) => home_page(),
          'splash_screen': (context) => splash_screen(),
        },
      ),
    ),
  );
}

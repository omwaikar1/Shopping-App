import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/global_variables.dart';
import 'package:shop_app/pages/home_page.dart';
import 'package:shop_app/pages/product_details_page.dart';

import 'providers/cart_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromRGBO(254, 206, 1, 1),
              primary: Color.fromRGBO(254, 206, 1, 1)),
          inputDecorationTheme: const InputDecorationTheme(
              hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          textTheme: const TextTheme(
              titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              titleMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              bodySmall: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        title: 'Shopping App',
        home: HomePage(),
      ),
    );
  }
}

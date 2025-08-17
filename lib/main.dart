import 'package:flutter/material.dart';
import 'package:mini_bakery_app/model/cart_model.dart';
import 'package:mini_bakery_app/pages/welcome_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (content) => CartModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const WelcomePage(),
      ),
    );
  }
}

import 'package:apple_shop_app/home_page.dart';
import 'package:apple_shop_app/pages/apple_shop_at_lesson.dart';
import 'package:apple_shop_app/pages/apple_shop_sample_from_mentor.dart';
import 'package:apple_shop_app/pages/assignment.dart';
import 'package:flutter/material.dart';


void main() => runApp(const AppleShopApp());

class AppleShopApp extends StatelessWidget {
  const AppleShopApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const HomePage(),
      routes: {
        Sample.id: (context) => const Sample(),
        AppleShopPage.id: (context) => const AppleShopPage(),
        AppleProducts.id: (context) => const AppleProducts(),
      },

    );
  }
}

import 'package:apple_shop_app/pages/apple_shop_at_lesson.dart';
import 'package:apple_shop_app/pages/apple_shop_sample_from_mentor.dart';
import 'package:apple_shop_app/pages/assignment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String id = 'home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, String> uis = {
    Sample.id: 'Apple Shop Sample From Mentor',
    AppleShopPage.id: 'Apple Shop',
    AppleProducts.id: 'Apple Products'
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('Apple Shop', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
        centerTitle: true,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: uis.length,
          itemBuilder: (context, index) {
            return _card(index + 1, uis.values.toList()[index],
                uis.keys.toList()[index]);
          },
        ),
      ),
    );
  }

  Widget _card(int number, String name, String id) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: MaterialButton(
        child: ListTile(
          contentPadding: const EdgeInsets.all(0),
          minVerticalPadding: 10,
          minLeadingWidth: 10,
          leading: Text(number.toString(),
              style: const TextStyle(
                  fontWeight: FontWeight.bold, letterSpacing: 1.5, fontSize: 16)),
          title: Center(
              child: Text(name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, letterSpacing: 1.5, fontSize: 19),
                  textAlign: TextAlign.center)),
          selectedColor: Colors.blueGrey,
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(id);
        },
      ),
      elevation: 10.0,
    );
  }
}
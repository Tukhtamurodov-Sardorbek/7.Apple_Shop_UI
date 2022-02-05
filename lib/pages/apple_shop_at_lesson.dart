import 'package:flutter/material.dart';

class AppleShopPage extends StatefulWidget {
  const AppleShopPage({Key? key}) : super(key: key);
  static const String id="AppleShopPage";

  @override
  _AppleShopPageState createState() => _AppleShopPageState();
}

class _AppleShopPageState extends State<AppleShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apple Products'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.black,
        actions: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(vertical: 12.5, horizontal: 5),
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: Colors.grey.shade700,
              borderRadius: BorderRadius.circular(7.5),
            ),
            child: const Text('7', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
          )
        ],
      ),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            Container(
              height: 225,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.red,
                image: const DecorationImage(
                  image: AssetImage('assets/appleShop/img.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              /// GRADIENT EFFECT
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.center,
                        colors: [
                          Colors.black.withOpacity(0.5),
                          Colors.black.withOpacity(0.3),
                          Colors.black.withOpacity(0.1),
                        ]
                    )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    /// LIFESTYLE SAFE
                    const Expanded(child: Align(alignment: AlignmentDirectional.center, child: Text('Lifestyle safe', style: TextStyle(fontSize: 30, color: Colors.white),),)),
                    /// SHOP NOW BUTTON
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      child: MaterialButton(
                        height: 60,
                        minWidth: MediaQuery.of(context).size.width,
                        onPressed: (){},
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text('Shop Now', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            /// Body
            GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return _GridItem(context, index);
                }
            ),
          ],
        ),
      ),
    );
  }

  Container _GridItem(BuildContext context, int index) {
    return Container(
      alignment: Alignment.bottomRight,
      padding: const EdgeInsets.all(15),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
            image: AssetImage('assets/appleShop/img_${index % 5 + 1}.png'),
            fit: BoxFit.cover,
          )
      ),
      child: const Icon(Icons.star_border_outlined, size: 35, color: Colors.amber),
    );
  }
}

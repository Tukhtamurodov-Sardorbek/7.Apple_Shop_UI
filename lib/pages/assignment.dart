import 'package:flutter/material.dart';

class AppleProducts extends StatefulWidget {
  const AppleProducts({Key? key}) : super(key: key);
  static const String id = 'apple_products';
  @override
  _AppleProductsState createState() => _AppleProductsState();
}

class _AppleProductsState extends State<AppleProducts> {
  List<Products> _likedProducts = [];

  final List<Products> _products = [
    Products('assets/appleProducts/img_1.png'),
    Products('assets/appleProducts/img_2.png'),
    Products('assets/appleProducts/img_3.png'),
    Products('assets/appleProducts/img_4.png'),
    Products('assets/appleProducts/img_5.png'),
    Products('assets/appleProducts/img_6.png'),
    Products('assets/appleProducts/img_7.png'),
    Products('assets/appleProducts/img_8.png'),
    Products('assets/appleProducts/img_9.png'),
    Products('assets/appleProducts/img_10.png'),
    Products('assets/appleProducts/img_11.png'),
    Products('assets/appleProducts/img_12.png'),
    Products('assets/appleProducts/img_13.png'),
    Products('assets/appleProducts/img_14.png'),
    Products('assets/appleProducts/img_15.png'),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffed6237),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('APPLE PRODUCTS'),
        centerTitle: true,
        actions: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: const Color(0xffeeaa47),
              borderRadius: BorderRadius.circular(7.5),
            ),
            child: const Text('7', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
          )
        ],
      ),
      drawer: SafeArea(
        child: Drawer(
          backgroundColor: const Color(0xffed6237),
          child: ListView(
              children: [
                const SizedBox(height: 10),
                /// LOGO
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                        image: AssetImage('assets/appleProducts/logo.png'),
                        fit: BoxFit.fitHeight
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 8,
                        blurRadius: 7,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    border: Border.all(
                      color: Colors.white,
                      width: 4,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.favorite, color: Colors.amber),
                          Text(' Favorites', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                        ],
                      ),
                      const Text('See all', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  height: 150,
                  child: _likedProducts.isEmpty
                      ? const Center(child: Text('No liked products', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 1.5),))
                      : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _likedProducts.length,
                      itemBuilder: (context, index){return _savedProducts(_likedProducts[index]);}
                  ),
                ),
              ]
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            /// Header
            Container(
              height: MediaQuery.of(context).size.height * 0.28,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  image: DecorationImage(
                    image: AssetImage('assets/appleProducts/img.png'),
                    fit: BoxFit.cover,
                  )
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
                    const Text('Lifestyle sale',  style: TextStyle(fontSize: 30, color: Colors.white, letterSpacing: 1.1)),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40, bottom: 30),
                      child: MaterialButton(
                          height: 50,
                          minWidth: MediaQuery.of(context).size.width,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text('Shop Now', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                          onPressed: (){}
                      ),
                    ),


                  ],
                ),
              ),
            ),
            /// OTHERS
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _products.length,
                itemBuilder: (context, index){
                  return _card(_products[index]);
                }
            )
          ],
        ),
      ),
    );
  }

  Widget _card(Products product){
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        child: Container(
          padding: const EdgeInsets.only(right: 8, top: 8),
          alignment: Alignment.topRight,
          height: MediaQuery.of(context).size.height * 0.47,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              image: DecorationImage(
                image: AssetImage(product.mediaPath),
                fit: BoxFit.cover,
              )
          ),
          child: IconButton(
            icon: Icon(product.isLiked ? Icons.favorite : Icons.favorite_border_outlined, color: product.isLiked ? Colors.red : Colors.amber, size: 35),
            onPressed: (){
              setState(() {
                product.isLiked = !product.isLiked;
                product.isLiked ? _likedProducts.add(product) : _likedProducts.contains(product) ? _likedProducts.remove(product) : null;

              });
            },
          ),
        ),
      ),
    );
  }
  Widget _savedProducts(Products object){
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      elevation: 20,
      child: Container(
        // margin: const EdgeInsets.only(right: 5, left: 10),
        width: MediaQuery.of(context).size.width*0.5-20,
        child: Stack(
          children: [
            Center(child: Image(image: AssetImage(object.mediaPath), fit: BoxFit.contain)),
            Container(
              alignment: Alignment.topRight,
              child: IconButton(
                  icon: Icon(object.isLiked ? Icons.favorite : Icons.favorite_border_outlined, color: object.isLiked ? Colors.red : Colors.black,),
                  onPressed: (){
                    setState(() {
                      object.isLiked = false;
                      _likedProducts.remove(object);
                      //_likedProducts.length--;
                    });
                  }
              ),
            ),
            // Container(
            //   alignment: Alignment.bottomCenter,
            //   child: Text(object.price, style: TextStyle(backgroundColor: Colors.white.withOpacity(0.8), color: const Color(0xFF003846),fontSize: 25, fontWeight: FontWeight.bold),),
            // )
          ],
        ),
      ),
    );



    //   Column(
    //     children: [
    //       Container(
    //         alignment: Alignment.topRight,
    //         child:
    //         IconButton(icon: Icon(isPressed ? Icons.favorite : Icons.favorite_border_outlined, color: isPressed ? Colors.red:Colors.black,), onPressed: (){
    //           setState(() {
    //             isPressed = !isPressed;
    //           });
    //         }),),
    //       SizedBox(height: 5,),
    //       Stack(
    //         children: [
    //           Image(image: AssetImage(product)),
    //           Container(
    //             alignment: Alignment.bottomCenter,
    //             child: Text(price, style: const TextStyle(fontWeight: FontWeight.bold),),
    //           )
    //         ],
    //       ),
    //
    //     ]
    // );
  }
}

class Products{
  String mediaPath;
  bool isLiked = false;
  Products(this.mediaPath);
}
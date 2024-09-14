import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:homenestshop/models/itemModel.dart';
import 'package:homenestshop/pages/AboutPage.dart';
import 'package:homenestshop/pages/FavouritePage.dart';
import 'package:homenestshop/pages/cartPage.dart';
import 'package:homenestshop/pages/description.dart';
import 'package:homenestshop/pages/homepage.dart';
import 'package:homenestshop/pages/loginpage.dart';
import 'package:provider/provider.dart';
import '../components/animatedText.dart';
import '../components/product_tile.dart';
import '../models/Products.dart';

class MyMainPage extends StatefulWidget {
   MyMainPage({super.key});



  @override
  State<MyMainPage> createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {
  String selectedCategory = 'All';


  final user = FirebaseAuth.instance.currentUser;

  void signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyLoginPage()), // Ensure you have a LoginPage defined
    );
  }

  @override
  void initState() {
    super.initState();
    final productsProvider = Provider.of<products>(context, listen: false);
    productsProvider.fetchCart();
    productsProvider.fetchFavourites();
    productsProvider.fetchProducts(); // Fetch products here
  }

  @override
  Widget build(BuildContext context) {


    final productsProvider = context.watch<products>(); // Ensure 'Products' is

    final List<Items> filteredProducts = selectedCategory == 'All'
        ? productsProvider.items
        : productsProvider.items
        .where((item) => item.category
        .trim().toLowerCase() == selectedCategory.trim().toLowerCase())
        .toList();


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[100],
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 1),
            Text('HOMENEST',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown)),
            // Image.asset('assets/images/icons/user-interface.png',
            //     height: 30, width: 30, color: Colors.brown),
            Icon(Icons.shopping_cart_outlined,color: Colors.brown, size: 30,),
          ],
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
      // backgroundColor: Colors.white,
        child:Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.brown.shade400
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white70,
                        radius: 40,
                      ),
                      Text(user?.email ?? 'Not logged in', style: TextStyle(color: Colors.white, fontSize: 18)),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyCartPage(),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Icon(Icons.shopping_cart, color: Colors.brown,size: 40,),
                              SizedBox(width: 20,),
                              Text(
                                'Cart',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.brown,
                                ),
                              ),
                            ],
                          )),
                      Divider(thickness: 1,color: Colors.brown.shade100,),
                      SizedBox(height: 20,),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FavouritePage(),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Icon(Icons.favorite, color: Colors.brown,size: 40,),
                              SizedBox(width: 20,),
                              Text(
                                'Wishlist',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.brown,
                                ),
                              ),
                            ],
                          )),
                      Divider(thickness: 1,color: Colors.brown.shade100,),
                      SizedBox(height: 20,),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AboutPage(),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Icon(Icons.info,color: Colors.brown,size: 40,),
                              SizedBox(width: 20,),
                              Text(
                                'About',
                                style: TextStyle(
                                  fontSize: 25,
                                   color: Colors.brown
                                ),
                              ),
                            ],
                          )),

                      Divider(thickness: 1,color: Colors.brown.shade100,),
                      SizedBox(height:300,),
                      Container(
                        child: Row(
                          children: [Icon(Icons.logout, color: Colors.brown,size: 40,),
                            SizedBox(width: 20,),
                            InkWell(
                              onTap: (){
                                signOut(context);
                              },
                              child: Text('Logout',style: TextStyle(
                                color: Colors.brown,
                                fontSize: 25
                              ),),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),

            ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 17),
              child: Container(
                height: 250,
                decoration: BoxDecoration(
                    color: Colors.brown,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 170,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text('Promo For First Purchase',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontStyle: FontStyle.italic)),
                            ),
                          ),
                          Container(
                            width: 170,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Special Discount',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          SizedBox(height: 25,),
                          Image.asset('assets/images/sofa.png', width: 150),
                          FadeInText(
                            text: 'Use Promo and get 40 % Off',
                            duration: const Duration(seconds: 2),
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top:BorderSide(color: Colors.brown),
                        )
                      ),
                      height: 80,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          categoryButton('All', Icons.category),
                          categoryButton('Sofa', Icons.weekend),
                          categoryButton('Chair', Icons.chair),
                          categoryButton('Lamp', Icons.lightbulb),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7,
            ),
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final productItem = filteredProducts[index];
                return MyProductTile(
                  product: productItem,
                  OnTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MyDetailsPage(product: productItem),
                      ),
                    );
                  },
                );
              },
              childCount: filteredProducts.length,
            ),
          ),
        ],
      ),
    //  bottomNavigationBar: CustomNavigationBar(),
    );
  }

  Widget categoryButton(String category, IconData icon) {
    return GestureDetector(
      onTap: () {
        if (selectedCategory != category) {
          setState(() {
            selectedCategory = category;
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: selectedCategory == category
                  ? Colors.brown
                  : Colors.brown[200],
              child: Icon(icon, color: Colors.white),
            ),
            SizedBox(height: 5),
            Text(category, style: TextStyle(color: Colors.brown)),
          ],
        ),
      ),
    );
  }
}

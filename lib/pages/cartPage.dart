import 'package:flutter/material.dart';
import 'package:homenestshop/pages/MyPaymentPage.dart';
import 'package:provider/provider.dart';

import '../models/Products.dart';
import '../models/itemModel.dart';

class MyCartPage extends StatefulWidget {
  const MyCartPage({super.key});

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {


  @override
  void initState() {
    super.initState();
    // Fetch cart items from Firestore when the page initializes
    final shop = Provider.of<products>(context, listen: false);
    shop.fetchCart();  // Fetch the cart from Firestore
  }

  void deleteItem(Items item, BuildContext context) {
    final shop = context.read<products>();
    shop.removeFromCart(item);
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<products>(
      builder: (context, value, child)
    {
      print('Cart contains ${value.cart.length} items');
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.brown.shade500,
          foregroundColor: Colors.white,
          title: Text('My Cart',),
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index) {
                  final Items item = value.cart[index];

                  final String itemName = item.name;
                  final int itemPrice = item.price;
                  final String itemImage=item.imagePath;

                  return ListTile(
                    title: Row(
                      children: [
                        Image.asset(
                          itemImage,
                          width: 70,
                          height:70,
                        ),
                        SizedBox(width: 8),
                        Text(itemName,style: TextStyle(fontSize: 18),),
                      ],
                    ),
                    subtitle: Row(
                      children: [
                        SizedBox(width: 50),
                        Text('Rs. ${itemPrice.toString()}', style: TextStyle(fontSize: 15),),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.brown),
                      onPressed: () => deleteItem(item, context),
                    ),
                  );
                },
              ),

            ),
            SizedBox(height: 10,),
            Container(
                color: Colors.brown,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Total Price: ', style: TextStyle(
                        color: Colors.white, fontSize: 20),),
                    Text('Rs. ${value.getTotalPrice()}', style: TextStyle(
                        color: Colors.white, fontSize: 20),),
                  ],
                )
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.brown.shade500
              ),
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Go To Payment", style: TextStyle(
                      color: Colors.white, fontSize: 25),),
                  IconButton(onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>
                          MyPaymentPage()),
                    );
                  },
                    icon: Icon(
                      Icons.arrow_forward, color: Colors.white,),
                  )
                ],
              ),
            )

          ],
        ),
      );
      },
    );

  }
}
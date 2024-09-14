import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/Products.dart';
import '../models/itemModel.dart';

class bottomDescriptionBar extends StatefulWidget {
  final Items product;
  const bottomDescriptionBar({super.key, required this.product});

  @override
  State<bottomDescriptionBar> createState() => _bottomDescriptionBarState();
}

class _bottomDescriptionBarState extends State<bottomDescriptionBar> {
  bool _isFavourite = false;

  int quantityCount = 0;

  void dec_quantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  void inc_quantity() {
    setState(() {
      quantityCount++;
    });
  }

  void MyCart() {
    if (quantityCount > 0) {
      final shop = context.read<products>();

      shop.addToCart(widget.product, quantityCount);

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.brown.shade400,
          content: Text('Successfully Added to Your Cart', style: TextStyle(color: Colors.white,
          fontSize: 20)),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.done, color: Colors.white),
            ),
          ],
        ),
      );
    }
  }

  void toggleFavourite() {
    final shop = context.read<products>();

    setState(() {
      _isFavourite = !_isFavourite;
      if (_isFavourite) {
        shop.addToFavourites(widget.product);
      } else {
        shop.removeFromFavourites(widget.product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: Colors.brown.shade300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: IconButton(
              onPressed: toggleFavourite,
              icon: Icon(
                _isFavourite ? Icons.favorite : Icons.favorite_border,
                color: Colors.brown,
                size: 30,
              ),
            ),
          ),
          Container(
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: dec_quantity,
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  quantityCount.toString(),
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                SizedBox(width: 5),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: inc_quantity,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              MyCart();
            },
            icon: Icon(Icons.shopping_cart, color: Colors.brown,size: 25,),
            label: Text(
              'Add to cart',
              style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

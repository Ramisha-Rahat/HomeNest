import 'package:flutter/material.dart';

import '../models/itemModel.dart';


class MyProductTile extends StatelessWidget {

  final Items product;
  final VoidCallback OnTap;

  const MyProductTile({
    super.key, required this.product,required this.OnTap
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: OnTap,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.brown.shade200,
            borderRadius: BorderRadius.circular(10),
            border: Border(
              top: BorderSide(color: Colors.brown,width: 2),
              left:BorderSide(color: Colors.brown,width: 2),
              right: BorderSide(color: Colors.brown,width: 2),
              bottom: BorderSide(color: Colors.brown,width: 2),
            ),
          ),
          child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: 150,
                        height: 150, // Adjust the width and height as needed
                        child: Center(
                          child: ClipRect(
                            child: Image.asset(
                              product.imagePath,
                              fit: BoxFit.cover,
                              height: 140, // Same as the container height
                              width: double.infinity, // Same as the container width
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        product.name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Rs-${product.price.toString()}',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.brown.shade800,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('View Description', style: TextStyle(fontSize: 11, color: Colors.brown,),)
                      ],
                    )
                  ],
          ),
        ),
      ),
    );
  }
}
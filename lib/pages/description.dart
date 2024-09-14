import 'package:flutter/material.dart';

import '../models/itemModel.dart';
import 'bottomDescriptionBar.dart';

class MyDetailsPage extends StatefulWidget {
  final Items product;
  const MyDetailsPage({super.key, required this.product});

  @override
  State<MyDetailsPage> createState() => _MyDetailsPageState();
}

class _MyDetailsPageState extends State<MyDetailsPage> {

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
        body:  Container(
          child: SingleChildScrollView(
            child: Column(
                children: [
                  SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.brown.shade300,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      height: 400,
                      width: 350,
                        child: Image.asset(widget.product.imagePath,
                          height: 400, width: 350,
                        )
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: 350,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.brown),
                        bottom:  BorderSide(color: Colors.brown),
                      )
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                      Text(widget.product.name,
                        style: TextStyle(fontSize: 27,color:Colors.brown ,fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none),),
                          Text(
                            'Price: \$${widget.product.price}',
                            style: TextStyle(fontSize: 24, color: Colors.brown,decoration: TextDecoration.none),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Description:',style: TextStyle(fontSize: 25, color: Colors.brown,decoration: TextDecoration.underline),),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        widget.product.description,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.brown.shade800,
                            decoration: TextDecoration.none
                        ),
                        textAlign: TextAlign.start,
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ),

                ],
            ),

          ),
        ),
        bottomNavigationBar:  bottomDescriptionBar(product: widget.product),
    );
  }
}

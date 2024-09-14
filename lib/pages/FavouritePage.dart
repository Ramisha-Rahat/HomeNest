import 'package:flutter/material.dart';
import 'package:homenestshop/pages/mainpage.dart';
import 'package:provider/provider.dart';
import '../models/Products.dart';
import '../models/itemModel.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.brown,
        title: Text('Wishlist',style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Consumer<products>(
        builder: (context, value, child) {
          if (value.favourites.isEmpty) {
            return Center(
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> MyMainPage()));
                },
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('No items in your wishlist:('),
                        Text(
                        'Tap to go to Menu',
                    style: TextStyle(
                      fontSize: 20
                    ),
                        ),
                        ],
                  )),
              ),
            );
          }
          return ListView.builder(
            itemCount: value.favourites.length,
            itemBuilder: (context, index) {
              final Items item = value.favourites[index];
              return ListTile(
                leading: Image.asset(item.imagePath, height: 50, width: 50),
                title: Text(item.name),
                subtitle: Text('Rs. ${item.price.toString()}'),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.brown),
                  onPressed: () {
                    value.removeFromFavourites(item);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

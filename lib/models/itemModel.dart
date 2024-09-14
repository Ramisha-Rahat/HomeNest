import 'dart:core';

class Items {
  final String name;

  final int price;

  final String description;

  final String imagePath;

  final String category;

  Items({
    required this.name,
    required this.price,
    required this.description,
    required this.imagePath,
    required this.category
  });

  //adding or mapping to firestore
  Map<String, dynamic> toMap(){
    return{
      'name':name,
      'price':price,
      'imagePath':imagePath,
      'description':description,
      'category':category
    };
  }
//items creation from firestore cocument
  factory Items.fromMap(Map<String,dynamic> data){
    return Items(
      name:data['name'],
      price: data['price'],
      imagePath:data['imagePath'],
      description: data['description'],
      category:data['category'],
    );
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:homenestshop/models/itemModel.dart';
//
// class products extends ChangeNotifier {
//   final List<Items> _itemModel = [
//     Items(
//         name: 'Lounge Sofa',
//         price: 29000,
//         description:
//             'The Lounge Sofa is a perfect blend of comfort and elegance, designed with a sleek wooden frame that adds a touch of sophistication to any living space. Its plush cushions offer superior relaxation, making it an ideal choice for both contemporary and classic interiors. ',
//         imagePath: 'assets/images/sofa3-removebg-preview.png',
//          category: 'Sofa'
//     ),
//     Items(
//         name: 'Sofa',
//         price: 20000,
//         description: 'The Grey Lounge Sofa is not just a piece of furniture; it`s your personal haven of comfort. With its extended length, this sofa is perfect for stretching out and enjoying a peaceful nap or unwinding after a long day. The soft grey fabric exudes a modern charm, while the generously cushioned seating and backrest provide the ultimate in relaxation. Whether you`re lounging with a book, watching your favorite show, or drifting off to sleep, this sofa is designed to offer maximum comfort in style.',
//         imagePath: 'assets/images/sofa2.png',
//         category: 'Sofa'
//     ),
//     Items(
//         name: 'Mini Room',
//         price: 105000,
//         description: 'Transform your living space with our All-in-One Living Room Furniture Set, designed for both functionality and style. This thoughtfully curated set includes everything you need to create a cozy and cohesive living area—spacious seating, a sleek coffee table, practical storage solutions, and accent pieces that tie the room together. Each element is crafted with a focus on versatility and modern aesthetics, ensuring that your living room is not only beautiful but also highly functional. Whether you`re hosting guests or enjoying a quiet evening at home, this furniture set adapts to your needs, offering comfort, convenience, and timeless style—all in one. Perfect for small spaces or open-concept living areas, this set makes it easy to achieve a coordinated, designer look without the hassle.',
//         imagePath: 'assets/images/livingroom-removebg.png',
//         category: 'Sofa'),
//     Items(
//         name: 'Sofa Chair',
//         price: 13000,
//         description: 'The Sofa Chair is the perfect fusion of comfort and style, offering the best of both worlds—a cozy seat and the luxurious feel of a sofa in a compact form. Designed for ultimate relaxation, this chair features plush cushions and a supportive backrest, making it an ideal choice for reading, lounging, or simply unwinding. Its elegant design complements any living space, whether as a standalone piece or as an accent to your existing furniture. ',
//         imagePath: 'assets/images/sofa.png',
//         category: 'Chair'
//     ),
//     Items(
//         name: 'PlushWood Chair',
//         price: 9000,
//         description: ' The plush velvet fabric not only feels incredibly soft but also adds a subtle sheen, making this pretty chair an inviting spot for relaxation or conversation. Whether placed in a living room, bedroom, or study, this chair is sure to enhance the beauty of your space.',
//         imagePath: 'assets/images/chair.png',
//         category: 'Chair'
//     ),
//     Items(
//         name: 'Wooden Lamp',
//         price: 5500,
//         description: 'The Modern Accent Lamp is a perfect blend of functionality and style, designed to elevate any room`s ambiance. With its sleek design and warm light, this lamp adds a touch of sophistication to your living space. Whether placed on a side table in the living room or as a bedside companion, its elegant silhouette and subtle glow create a cozy and inviting atmosphere. The lamp`s durable materials and contemporary finish make it a versatile piece that complements both modern and traditional interiors',
//         imagePath: 'assets/images/download.png',
//         category: 'Lamp'
//     ),
//     Items(
//         name: 'Green Sofa',
//         price: 13000,
//         description: 'The Cozy Green Sofa is the epitome of comfort and style, designed to be the centerpiece of your living room. Its plush cushions and deep seating invite you to sink in and relax, making it the perfect spot for unwinding after a long day. The soft green upholstery adds a fresh, natural touch to your space, while the elegant design ensures it complements any decor. Whether you`re curling up with a good book or hosting guests, this pretty green sofa offers the ideal blend of comfort and beauty.',
//         imagePath: 'assets/images/green_sofa-removebg-preview.png',
//         category: 'Sofa'
//     ),
//   ];
//
//   List<Items> _cart = [];
//
//   List<Items> _favourites = [];
//
//   List<Items> get ItemModels => _itemModel;
//
//   List<Items> get cart => _cart;
//
//   List<Items> get favourites => _favourites;
//
//   void addToCart(Items item, int itemQuantity) {
//     for (int i = 0; i < itemQuantity; i++) {
//       _cart.add(item);
//     }
//     notifyListeners();
//   }
//
//   void removeFromCart(Items item) {
//     _cart.remove(item);
//     notifyListeners();
//   }
//
//   int getTotalPrice() {
//     int total = 0;
//     for (var item in _cart) {
//       total += item.price;
//     }
//     return total;
//   }
//
//   void addToFavourites(Items item) {
//     if (!_favourites.contains(item)) {
//       _favourites.add(item);
//       notifyListeners();
//     }
//   }
//
//   void removeFromFavourites(Items item) {
//     _favourites.removCollectionReferencetifyListeners();
//   }
// }

class products extends ChangeNotifier {
  final CollectionReference productsCollection = FirebaseFirestore.instance.collection('products');
  final CollectionReference cartCollection = FirebaseFirestore.instance.collection('cart');
  final CollectionReference favouritesCollection = FirebaseFirestore.instance.collection('favourites');

  List<Items> _items = [];
  List<Items> _cart = [];
  List<Items> _favourites = [];

  // Getters for accessing the lists
  List<Items> get items => _items;
  List<Items> get cart => _cart;
  List<Items> get favourites => _favourites;

  Future<void> fetchProducts() async {
    try {
      final querySnapshot = await productsCollection.get();
      _items = querySnapshot.docs.map((doc) {
        return Items(
          name: doc['name'] ?? 'Unknown',  // Provide default value if name is null
          category: doc['category'] ?? 'Unknown',
          imagePath: doc['imagePath'] ?? 'assets/images/default.png', // Default image path
          price: doc['price'] ?? 0,  // Default price is 0
          description: doc['description'] ?? 'No description available',
        );
      }).toList();
      notifyListeners();
    } catch (error) {
      print('Error fetching products: $error');
    }
  }

  // Fetch cart items from Firestore
  Future<void> fetchCart() async {
    try {
      final snapshot = await cartCollection.get();
      _cart = snapshot.docs.map((doc) {
        return Items.fromMap(doc.data() as Map<String, dynamic>? ?? {}); // Handle null data safely
      }).toList();
      notifyListeners();
    } catch (e) {
      print("Error fetching cart: $e");
    }
  }



  // Fetch favourites from Firestore
  Future<void> fetchFavourites() async {
    try {
      final snapshot = await favouritesCollection.get();
      _favourites = snapshot.docs.map((doc) {
        return Items.fromMap(doc.data() as Map<String, dynamic>? ?? {}); // Handle null data safely
      }).toList();
      notifyListeners();
    } catch (e) {
      print("Error fetching favourites: $e");
    }
  }

  // Add item to cart and Firestore
  Future<void> addToCart(Items item, int itemQuantity) async {
    try {
      for (int i = 0; i < itemQuantity; i++) {
        _cart.add(item);
        await cartCollection.add(item.toMap());
      }
      notifyListeners();
    } catch (e) {
      print("Error adding to cart: $e");
    }
  }

  // Remove item from cart and Firestore
  Future<void> removeFromCart(Items item) async {
    try {
      _cart.remove(item);
      final cartItemSnapshot = await cartCollection.where('name', isEqualTo: item.name ?? '').limit(1).get(); // Check for null name
      if (cartItemSnapshot.docs.isNotEmpty) {
        await cartItemSnapshot.docs.first.reference.delete();
      }
      notifyListeners();
    } catch (e) {
      print("Error removing from cart: $e");
    }
  }

  // Add item to favourites and Firestore
  Future<void> addToFavourites(Items item) async {
    try {
      if (!_favourites.contains(item)) {
        _favourites.add(item);
        await favouritesCollection.add(item.toMap());
      }
      notifyListeners();
    } catch (e) {
      print("Error adding to favourites: $e");
    }
  }

  // Remove item from favourites and Firestore
  Future<void> removeFromFavourites(Items item) async {
    try {
      _favourites.remove(item);
      final favItemSnapshot = await favouritesCollection.where('name', isEqualTo: item.name ?? '').limit(1).get(); // Check for null name
      if (favItemSnapshot.docs.isNotEmpty) {
        await favItemSnapshot.docs.first.reference.delete();
      }
      notifyListeners();
    } catch (e) {
      print("Error removing from favourites: $e");
    }
  }

  // Get the total price of items in the cart
  int getTotalPrice() {
    int total = 0;
    for (var item in _cart) {
      total += item.price ?? 0;  // Handle null price safely
    }
    return total;
  }
}
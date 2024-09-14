// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:furnitureshop/pages/FavouritePage.dart';
// import 'package:furnitureshop/pages/cartPage.dart';
// import 'package:furnitureshop/pages/mainpage.dart';
//
// class CustomNavigationBar extends StatefulWidget {
//   const CustomNavigationBar({super.key});
//
//   @override
//   State<CustomNavigationBar> createState() => _CustomNavigationBarState();
// }
//
// class _CustomNavigationBarState extends State<CustomNavigationBar> {
//
//   int _currentIndex=1;
//
//   final List<Widget> _pages = [
//     MyCartPage(),
//     MyMainPage(),
//     FavouritePage(),
//   ];
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_currentIndex],
//       bottomNavigationBar: CurvedNavigationBar(
//         index: _currentIndex,
//         buttonBackgroundColor: Colors.brown.shade200,
//         backgroundColor: Colors.brown,
//         color: Colors.brown.shade200,
//         animationDuration: const Duration(milliseconds: 500),
//         items: const [
//           Icon(Icons.shopping_cart, color: Colors.white),
//           Icon(Icons.home, color: Colors.white),
//           Icon(Icons.favorite, color: Colors.white),
//         ],
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index; // Update the current index
//           });
//         },
//       ),
//     );
//   }
// }

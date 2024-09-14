import 'package:flutter/material.dart';

class InfiniteListPage extends StatelessWidget {
  final ScrollController controller;
  final Color color;

  InfiniteListPage({required this.controller, required this.color});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      itemCount: 100, // Or use a dynamic count if you're fetching data
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Item $index'),
        );
      },
    );
  }
}
